https://www.leeholmes.com/extracting-forensic-script-content-from-powershell-process-dumps/

> Precision Computing - Software Design and Development

# Extracting Forensic Script Content from PowerShell Process Dumps
### Extracting Forensic Script Content from PowerShell Process Dumps

Thu, Jan 17, 2019 6-minute read

After posting [Extracting Activity History from PowerShell Process Dumps](https://www.leeholmes.com/blog/2019/01/04/extracting-activity-history-from-powershell-process-dumps/), I got an interesting follow up question: “Is it possible to extract the content of scripts (from disk) that were executed, even if those files were not captured?”

The answer is “Yes”, but it’s also complicated. And to make it even more complicated, we’re going to go down a path showing how to do some of this detective work from scratch. This is going to require a lot of WinDbg automation, so for a first step, [install the WinDbg module](https://www.leeholmes.com/blog/2009/01/21/scripting-windbg-with-powershell/).

To set up our forensics experiment, create this simple script. Save it somewhere like c:\\temp:

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-5.png "image")](https://www.leeholmes.com/images/2019/01/image-11.png)

Open a PowerShell session, run the script, and create a dump file.

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-6.png "image")](https://www.leeholmes.com/images/2019/01/image-12.png)

Now, use the WinDbg module to connect to the dump file:

```powershell
Connect-DbgSession -ArgumentList '-z "C:\Users\lee\AppData\Local\Temp\powershell.DMP"'
```

### Begin our investigation

To begin our investigation, let’s cast a really wide net. We know we want to extract objects (if they exist) that represent scripts that were run in that session. But how do we find these?

First, let’s use SOS’s “Dump Object” command to dump everything it knows about every single object in the process. So, we’ll start with the **!DumpHeap** command to find all object instances (i.e.: we won’t even use the –Type filter). There are “smarter” ways to do it, but this step and the next will take a very long time, so maybe get it going before bed or something.

```powershell
$allReferences = dbg !dumpheap -short
```

Once we have all object references, let’s use the **!do** (Dump Object) command to have SOS visualize them all. The output of Dump Object doesn’t include the address of the object being dumped, so we’ll use Add-Member to keep track of that as well.

```powershell
$allObjects = $allReferences | Foreach-Object { $object = dbg "!do $_" Add-Member -InputObject $object Address $_ -PassThru -Force }
```

(The next day) That’s a mighty hay stack indeed! On my system, there are about a million objects that SOS knows about in this process instance. Do any of them have any part of the GUID in the way that SOS would visualize them? Let’s find out!

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-7.png "image")](https://www.leeholmes.com/images/2019/01/image-13.png)

Looks like we’re in luck! Out of those million objects, we managed to narrow it down to 7 System.String objects in PowerShell’s memory that somehow referenced the GUID. If we think the information might have been in a System.String all along, we could have made our initial “$allObjects” query faster by using “$allReferences = dbg !dumpheap –type System.String –short”. But how do we figure out what’s holding these GUIDs?

To find out, we’ll use SOS’s **!gcroot** command. This is commonly used to diagnose managed memory leaks – for example, “*What am I doing that’s causing the CLR to hold onto 10 million instances of this string?*” For any given object, the !gcroot command tells you what object is referencing it and what object is referencing that one - all the way until you hit the root of the object tree. Let’s explore some of these roots.

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-8.png "image")](https://www.leeholmes.com/images/2019/01/image-14.png)

Ok, so the last one (item #6 in the array) wasn’t actually rooted. It was no longer referenced, and would be cleaned up by the garbage collector shortly.

Item #5 was rooted through an object array (System.Object\[\]), where one of those elements was a ConcurrentDictionary, which held a ScriptBlock, which held CompiledScriptBlockData, which held nodes in a PowerShell AST, bottoming out in a [CommandAst](https://docs.microsoft.com/en-us/dotnet/api/system.management.automation.language.commandast?view=powershellsdk-1.1.0) AST that referenced this GUID.

Sounds cool. What about any others? Here’s item #4 in my instance:

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-9.png "image")](https://www.leeholmes.com/images/2019/01/image-15.png)

This is interesting! This one starts with the same root object array (0000026e101e9a40), the same ConcurrentDictionary (0000026e003bc440), but this time bottoms out into a tuple (a simple pairing of two items) that contains our string and another string. Let’s dive into that tuple and the strings it contains.

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-10.png "image")](https://www.leeholmes.com/images/2019/01/image-16.png)

So this tuple has two elements. The first element looks to be the path to the script that was executed, and the second element looks to be the content that was in that script. Let’s see what the [PowerShell Source](https://github.com/powershell/powershell) has to say about these data structures. I’ll [search for ConcurrentDictionary](https://github.com/PowerShell/PowerShell/search?p=3&q=ConcurrentDictionary&unscoped_q=ConcurrentDictionary) to see what I can find. On the third page, we can see exactly what we’re looking at:

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-11.png "image")](https://www.leeholmes.com/images/2019/01/image-17.png)

There’s a class called CompiledScriptBlock. It contains a static (process-wide) cache called “s\_cachedScripts”. This is a dictionary that maps a pair of strings to an instance of a ScriptBlock. And if you read the source, you can see exactly what the Tuple is as well – a mapping of a script’s path to the content it contained at the time the ScriptBlock was cached:

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-12.png "image")](https://www.leeholmes.com/images/2019/01/image-18.png)

This data structure is what we ended up poking around in. For performance reasons, PowerShell maintains an internal script block cache so that it doesn’t need to re-compile the script blocks every time it sees a script. That cache is keyed off of the path and script contents. The thing stored in the cache is an instance of a ScriptBlock class, which contains  (among other things) the AST of the script that was compiled.

So now that we know this thing exists, we can be much smarter in our automation and extract this stuff intentionally! Now we’re getting into real scripting, so this is what we’ll do:

1.  Use **!dumpheap** to find instances of this Tuple class. The dumpheap command does a substring search, so we’ll do a bit of post-processing with a regex.
2.  This gives us the MT of the tuple class that we actually want to investigate.
3.  Run !dumpheap again with that MT as a filter

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-13.png "image")](https://www.leeholmes.com/images/2019/01/image-19.png)

Now we can explore one of these nodes. It has a m\_key that we can dive into.

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-14.png "image")](https://www.leeholmes.com/images/2019/01/image-20.png)

Almost there! Let’s extract out the two items from those resulting keys, and emit a pretty PowerShell object:

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-15.png "image")](https://www.leeholmes.com/images/2019/01/image-21.png)

It’s been a long journey. But: we investigated a hypothesis from scratch, followed it through, and now are able to forensically recover the content of all scripts from the PowerShell process memory even if you no longer have access to the files in question. Awesome ![Smile](https://www.leeholmes.com/images/2019/01/wlEmoticon-smile.png)

Here’s a script that packages all of this into a function.

```powershell
function Get-ScriptBlockCache { $nodeType = dbg !dumpheap -type ConcurrentDictionary | Select-String 'ConcurrentDictionary.*Node.*Tuple.*String.*String.*\]\]$' $nodeMT = $nodeType | ConvertFrom-String | Foreach-Object P1 $nodeAddresses = dbg !dumpheap -mt $nodeMT -short $keys = $nodeAddresses | % { dbg !do $_ } | Select-String m_key $keyAddresses = $keys | ConvertFrom-String | Foreach-Object P7 foreach($keyAddress in $keyAddresses) { $keyObject = dbg !do $keyAddress $item1 = $keyObject | Select-String m_Item1 | ConvertFrom-String | % P7 $string1 = dbg !do $item1 | Select-String 'String:\s+(.*)' | % { $_.Matches.Groups[1].Value } $item2 = $keyObject | Select-String m_Item2 | ConvertFrom-String | % P7 $string2 = dbg !do $item2 | Select-String 'String:\s+(.*)' | % { $_.Matches.Groups[1].Value } [PSCustomObject] @{ Path = $string1; Content = $string2 } } }
```
