https://www.leeholmes.com/scripting-windbg-with-powershell/

> Precision Computing - Software Design and Development

# Scripting WinDbg with PowerShell
### Scripting WinDbg with PowerShell

Wed, Jan 21, 2009 2-minute read

A while back, Roberto Farah published a script library to help control [WinDbg through PowerShell](http://blogs.msdn.com/debuggingtoolbox/archive/2007/09/05/powershell-script-powerdbg-using-powershell-to-control-windbg.aspx). I’ve been using WinDbg for more debugging lately, and decided (after following one to many object references by hand) that I needed to script my investigations.

PowerDbg is definitely helpful – Roberto has tons of great scripts published that help analyze all kinds of interesting data. It also made me think of an alternative approach that works around some of the problem areas – PowerDbg uses SendKeys, window focusing, and used WinDbg logging as the communication mechanism. After some investigation, I thought that automation of the command-line version (cdb.exe) through its input and output streams might be easier and more efficient – which indeed it was.

You set up a remote from the Windbg instance you want to control, and then the WinDbg module (below) connects to the remote session (by manipulating standard in / standard out of cdb.exe) to manage its output.

I’ve shared this module now in the [PowerShell Gallery](https://www.powershellgallery.com/packages/WinDbg/1.0). To run it, just run:

> Install-Module WinDbg –Scope CurrentUser

Let’s see how it works!

Here’s an example program that we want to debug:

[![image](https://www.leeholmes.com/images/2019/01/image_thumb.png "image")](https://www.leeholmes.com/images/2019/01/image-6.png)

First, import our module, launch the program, and then connect. If you’ve got the module, you can follow along at home :)

```powershell
Import-Module WinDbg Set-Location (Get-Module WinDbg).ModuleBase cd tests $app = Start-Process .\TestApplication.exe -PassThru -WindowStyle Hidden New-DbgSession -Id $app.Id
```

Now, we can use **Invoke-DbgCommand** to do all of our usual debugging things, like enumerating threads, switching them, etc. Invoke-DbgCommand has an alias, **dbg**.

```powershell
Invoke-DbgCommand !threads Invoke-DbgCommand ~5s dbg !ClrStack dbg k
```

Now that you have these in PowerShell, you can do any kind of text-based manipulation you’d like.

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-1.png "image")](https://www.leeholmes.com/images/2019/01/image-7.png)

What does the debugger know about our TestClass?

```powershell
dbg !dumpheap -type TestClass
```

Turns out, it knows some cool stuff. Again, you can do some more amazing text parsing and automation:

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-4.png "image")](https://www.leeholmes.com/images/2019/01/image-10.png)

One thing that the WinDbg module includes is a few basic scripts that automate some of this parsing for you. For example, **Search-DbgHeap** and **Get-DbgObject**. Explore, and have fun!

[![image](https://www.leeholmes.com/images/2019/01/image_thumb-3.png "image")](https://www.leeholmes.com/images/2019/01/image-9.png)

Also, if this project interests you, should definitely check out [DbgShell](https://github.com/Microsoft/DbgShell). This is the hobby-time project of [@JazzDelightsMe](https://twitter.com/jazzdelightsme), and exposes much of the debugging engine into PowerShell as PowerShell objects. Incredible! I can’t wait to see that module continue to grow.

*(Edit: 05/13/09 - Updated to support local kernel debugging)  
*(Edit: 01/11/19 – Improved over the last 10 years. Published to PowerShell Gallery, and completely rewrote post)**
