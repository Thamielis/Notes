https://www.leeholmes.com/a-poor-mans-profiler-with-powershell-and-cdb/

> Precision Computing - Software Design and Development

# A Poor Man's Profiler with PowerShell and CDB
### A Poor Man's Profiler with PowerShell and CDB

Thu, Aug 23, 2012 5-minute read

[Will Steele](https://learningpcs.blogspot.com/) asked today on Twitter how we did the analysis to come up with [this post](http://blogs.msdn.com/b/powershell/archive/2009/11/04/why-is-get-childitem-so-slow.aspx) on the PowerShell blog in 2009. In brief, it’s a blog post that addressed some performance issues in the .NET framework that were causing Get-ChildItem to be slow. How did we know it was the .NET APIs slowing us down?

The answer came from Visual Studio by way of Software Profiling. Surprisingly, there aren’t many resources for this on the Internet – but here’s a good one: [http://msdn.microsoft.com/en-us/magazine/cc337887.aspx](http://msdn.microsoft.com/en-us/magazine/cc337887.aspx).

> *(Aside: we worked with the .NET team to make some [higher-performance APIs](http://blogs.msdn.com/b/bclteam/archive/2008/11/04/what-s-new-in-the-bcl-in-net-4-0-justin-van-patten.aspx) after we discovered this issue, and we were able to start using them in PowerShell version three.)*

At it’s core, software performance profiling takes one of two approaches:

-   **Instrumented**. While compiling (or as a separate stage), a tool injects markers into the beginning and end of every function in your program. These markers measure how much time each function takes, and then you can do fancy reports based on this data. This approach is very accurate, but also very invasive. It significantly slows down the target application, and requires code injection into potentially off-limits binaries.
-   **Sampled.** This type of profiler runs a program, but then pauses it every once in a while to investigate what it’s doing. If it answers “*Filling directory attributes*” 50% of the time, then it is statistically spending about 50% of its time filling directory attributes. This approach is not as accurate as instrumentation-based profiles, but has far less system impact. There are many great tools out there for software profiling, and most of them offer both of these approaches. However, if you don’t have one handy, what is an alternative?

The answer is commonly called a “*poor man’s profiler*”.

Most systems have a debugger installed, or can get one installed easily. Microsoft ships a few in an excellent kit called the “[Debugging Tools for Windows](http://msdn.microsoft.com/en-us/windows/hardware/gg463009.aspx)”.

In a poor man’s profiler, you attach to the process in question, extract a stack trace, and then detach. A stack trace tells you you what internal function the program is executing, and which functions were called along the way. For example, attaching the WinDbg debugger to PowerShell during a directory listing shows something like this:

```
0:008&gt; !loadby sos mscorwks
0:002&gt; ~*e !CLRStack

OS Thread Id: 0x2c78 (8)
Child-SP         RetAddr          Call Site
000000ea3753d830 000007fe0a45cc5c DomainNeutralILStubClass.IL_STUB(System(...).
000000ea3753d9b0 000007fe0a46603b System.IO.File.FillAttributeInfo(System(...).
000000ea3753dae0 000007fe0aae86fd System.IO.FileSystemInfo.Refresh()   
000000ea3753db10 000007fe093633b2 System.IO.FileSystemInfo.get_Attributes()
000000ea3753db40 000007fe09363585 Microsoft.PowerShell.Commands.FileSyste((...))
(...)
```

Now, you can’t really get a good answer from doing this just once. Doing this hundreds of times is the secret, but doing that by hand gets old pretty quick.

When automation is the question, PowerShell is the answer, of course. Here’s an example of profiling Internet Explorer as it chews up my CPU using [HTML5 to emulate fire](https://www.leeholmes.com/projects/Burn-Browser.html):

```
PS C:\Windows\system32&gt; $frames =
    C:\temp\Get-ProcessProfile.ps1 -ProcessId 12656 -UseNativeDebugging
PS C:\Windows\system32&gt; $frames | % { $_[0] } | group |
    sort Count | Select Count,Name | ft -auto

Count Name
----- ----
    1 JSCRIPT9!JsVarRelease
    1 ntdll!ZwFreeVirtualMemory
    1 ntdll!NtAlpcSendWaitReceivePort
    1 msvcrt!ftol2\_sse
    1 msvcrt!isatty
    2 msvcrt!memcmp
    2 nvwgf2um!NVAPI\_Thunk
    2 MSHTML!RunHTMLApplication
    7 JSCRIPT9!DllCanUnloadNow
   15 JSCRIPT9!DllGetClassObject
   27 JSCRIPT9!JsVarToScriptDirect
  100 ntdll!DbgBreakPoint
  200 wow64!Wow64SystemServiceEx
  799 ntdll!NtWaitForWorkViaWorkerFactory
 1487 wow64cpu!TurboDispatchJumpAddressEnd 
```

And the script:

```powershell
############################################################################## ## ## Get-ProcessProfile ## ############################################################################## <# .SYNOPSIS Uses cdb.exe from the Debugging Tools for Windows to create a sample-based profile of .NET or native applications. .EXAMPLE $frames = C:\temp\Get-ProcessProfile.ps1 -ProcessId 11844 $frames | % { $_[0] } | group | sort Count | Select Count,Name | ft -auto Runs a sampling profile on process ID 1184. Then, it extracts out the top (current) stack entry from each call frame and groups it by the resulting text. This gives a report like the following, which was taken while PowerShell version 2 was slowly enumerating a network share. The output below demonstrates that PowerShell was spending the majority of its time invoking a pipeline, and calling the .NET System.IO.FillAttributeInfo API: Count Name ----- ---- 1 System.Collections.Specialized.HybridDictionary.set_Item(System.Object... 1 System.Text.StringBuilder..ctor(System.String, Int32, Int32, Int32) 1 System.Management.Automation.Provider.CmdletProvider.WrapOutputInPSObj... 1 System.Management.Automation.Provider.NavigationCmdletProvider.GetPare... 1 System.Management.Automation.Provider.CmdletProvider.get_Force() 1 System.Management.Automation.Cmdlet.WriteObject(System.Object) 1 System.String.AppendInPlace(Char[], Int32, Int32, Int32) 1 Microsoft.PowerShell.ConsoleHostRawUserInterface.LengthInBufferCells(C... 1 System.Security.Util.StringExpressionSet.CanonicalizePath(System.Strin... 1 Microsoft.PowerShell.ConsoleControl.GetConsoleScreenBufferInfo(Microso... 1 System.IO.DirectoryInfo..ctor(System.String, Boolean) 1 System.Security.Permissions.FileIOPermission.AddPathList(System.Securi... 2 System.IO.Path.InternalCombine(System.String, System.String) 2 System.Runtime.InteropServices.SafeHandle.Dispose(Boolean) 18 System.IO.Directory.InternalGetFileDirectoryNames(System.String, Syste... 66 System.IO.File.FillAttributeInfo(System.String, WIN32_FILE_ATTRIBUTE_D... 100 System.Management.Automation.Runspaces.PipelineBase.Invoke(System.Coll... #> param( ## The process ID to attach to [Parameter(Mandatory = $true)] $ProcessId, ## How many samples to retrieve $SampleCount = 100, ## Switch parameter to debug a native process [Switch] $UseNativeDebugging, ## Path to CDB. Will be detected if not supplied. $CdbPath ) ## If the user didn't specify a path to CDB, see if we can find it in the ## standard locations. if(-not $CdbPath) { $cdbPaths = "C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x64\cdb.exe", "C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x86\cdb.exe", "C:\Program Files\Debugging Tools for Windows (x64)\cdb.exe", "C:\Program Files\Debugging Tools for Windows (x86)\cdb.exe" foreach($path in $CdbPaths) { if(Test-Path $path) { ## If we found it, remember it and break. $CdbPath = $path break } } if(-not $CdbPath) { throw "Could not find cdb.exe from the Debugging Tools for Windows package" } } if(-not (Get-Process -Id $ProcessId)) { throw "Could not find process ID $ProcessId" } ## Prepare the command we will send to cdb.exe. We use one command for ## managed applications, and another for native. $debuggingCommand = "" $managedDebuggingCommand = ".loadby sos mscorwks; .loadby sos clr; ~*e !CLRStack" $nativeDebuggingCommand = "~*k" if($UseNativeDebugging) { $debuggingCommand = $nativeDebuggingCommand } else { $debuggingCommand = $managedDebuggingCommand } ## Create the info to start cdb.exe, redirecting its standard input and output ## so that we can automate it. $startInfo = [System.Diagnostics.ProcessStartInfo] @{ FileName = $CdbPath; Arguments = "-p $processId -noinh -c `"$debuggingCommand`""; UseShellExecute = $false; RedirectStandardInput = $true RedirectStandardOutput = $true } $frames = @() ## Start sampling the process by launching cdb.exe, taking the stack trace, ## and detaching. 1..$SampleCount | % { $process = [System.Diagnostics.Process]::Start($startInfo) $process.StandardInput.WriteLine("qd") $process.StandardInput.Close() $r = $process.StandardOutput.ReadToEnd() -split "`n" ## Go through the output data, extracting the actual stack trace text ## data. $frame = @() $capture = $false switch -regex ($r) { 'Child SP|Child-SP' { $capture = $true; continue; } 'OS Thread Id|^\s*$' { $capture = $false; if($frame) { $frames += ,$frame; $frame = @() } } { $capture -and ($_ -match '\)$|!') } { $frame += $_ -replace ".*? .*? ([^+]*).*",'$1' } } if($frame) { $frames += ,$frame } ## Sleep a little bit (with randomness) so that we get accurate ## samples Start-Sleep -m (100 + (Get-Random 100)) } ## Output the frames we retrieved. ,$frames
```
