Now, it is easy to provide professional-quality documentation for PowerShell cmdlets, and to keep it in sync when you make changes, whether they are written in PowerShell or C#. Whereas this has always been easy to do in PowerShell, it was always painful to do in C# or VB because it meant having to build your own MAML file. Michael completes his three-part series by summarising, in a wallchart, how to go about it.

PowerShell’s **Get-Help** cmdlet is the conduit for getting details of a cmdlet, whether that cmdlet is written in C# or in PowerShell. Thus, one needs to be able to provide content for that help when writing in either language. From its early days, PowerShell has provided full support for documentation comments (“doc-comments”) in PowerShell code: you could instrument your functions with doc-comments and **Get-Help** would use those to generate its help. Until recently though, this has been rather arduous to do in C# code. Essentially, you had to perform a laborious and error-prone process to build your own MAML documentation file: Even with custom editors built for the task, it was a chore to keep your documentation in sync with your code.

Then in 2015, **XmlDoc2Cmd****letDoc** came along and filled in the crucial gap: you can now instrument your C# cmdlet code just like any other C# code, and just like PowerShell code. Therefore, you can nowadays easily support **Get-He****lp** from either C# or PowerShell and keep your documentation maintained right alongside your code.

That much allows you to feed proper details to **Get-Help** to show help for a single command. This follows in the venerable tradition of the Unix “man” command or the DOS “help” command, presenting documentation for a single command. Unlike those other environments, however, PowerShell is not just a shell language, but also a rich programming language. Therefore, PowerShell needs to be able to provide a navigable documentation tree such as is provided by Sandcastle for C# or by Javadoc for Java. To give you the same ease of use, you can use the **DocTreeGenerator** utility, which supports this key capability for PowerShell. It supports modules written in C# or in PowerShell, or in a combination of both.

The accompanying wallchart shows at a glance all the pieces you need to build your documentation using the above tools in concert with Visual Studio and PowerShell.

[![2407-1-5728ddc3-433a-4b82-a6dc-84f5f450b][fig1]][1]

To download the full sized wallchart, either click on the thumbnail above, or [click here][2].

[fig1]: Unified%20Approach%20to%20Generating%20Documentation%20for%20PowerShell%20Cmdlets%20-%20Simple%20Talk/2407-1-5728ddc3-433a-4b82-a6dc-84f5f450b519.png

[1]: https://www.simple-talk.com/content/file.ashx?file=12790
[2]: https://www.simple-talk.com/content/file.ashx?file=12790