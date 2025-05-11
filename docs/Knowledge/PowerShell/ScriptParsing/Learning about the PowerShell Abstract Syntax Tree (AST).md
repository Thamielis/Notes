https://mikefrobbins.com/2018/09/28/learning-about-the-powershell-abstract-syntax-tree-ast/

> This week, I'll continue where I left off in my previous blog article
PowerShell Script Module Design Philosophy.
Moving forward, the development versions of my …

# Learning about the PowerShell Abstract Syntax Tree (AST)
This week, I'll continue where I left off in my previous blog article [PowerShell Script Module Design Philosophy](https://mikefrobbins.com/2018/09/21/powershell-script-module-design-philosophy/).

Moving forward, the development versions of my PowerShell script modules will use a non-monolithic design where each function is dot-sourced from the PSM1 file. When I move them to production, I'll convert them to using a monolithic design where all functions reside in the PSM1 file. In development, each PS1 file uses a [Requires statement](https://docs.microsoft.com/powershell/module/microsoft.powershell.core/about/about_requires) which specifies the requirements from a PowerShell version and required modules standpoint. This is so the requirements are known if someone grabs individual functions instead the entire module from the development version on GitHub. This information needs to be consolidated and placed in the module manifest (PSD1 file) when transitioning to production. The `Requires` statement should be excluded when retrieving the content of the function itself before placing it in the PSM1 file.

Since I didn't want to resort to writing regular expressions and parsing text, I decided to use the Abstract Syntax Tree (AST) to extract the content from the functions that I needed. Beginning with PowerShell version 3.0, script blocks have an AST property.

First, I'll store the content of one of my functions in a variable.

```powershell
$GetVmHost = Get-Content -Path U:\GitHub\Hyper-V\MrHyperV\public\Get-MrVmHost.ps1 -Raw
```

powershell

![ast-property1a.jpg](https://mikefrobbins.com/2018/09/28/learning-about-the-powershell-abstract-syntax-tree-ast/ast-property1a.jpg)

Figure 1: ast-property1a.jpg

Converting it to a script block and piping it to [Get-Member](https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/get-member) shows that it does indeed have an AST property.

![ast-property2a.jpg](https://mikefrobbins.com/2018/09/28/learning-about-the-powershell-abstract-syntax-tree-ast/ast-property2a.jpg)

Figure 2: ast-property2a.jpg

> `Get-Member` is used to perform recon (exploration) on commands in PowerShell. Any command that produces object based output can be piped to `Get-Member`.

I just kept piping to `Get-Member` to see what kind of information could be retrieved.

![ast-property3a.jpg](https://mikefrobbins.com/2018/09/28/learning-about-the-powershell-abstract-syntax-tree-ast/ast-property3a.jpg)

Figure 3: ast-property3a.jpg

The `ScriptRequirements` property returns the information needed about which PowerShell version is required. It also returns the required modules if any were required, which none are for this particular function.

![ast-property4a.jpg](https://mikefrobbins.com/2018/09/28/learning-about-the-powershell-abstract-syntax-tree-ast/ast-property4a.jpg)

Figure 4: ast-property4a.jpg

I kept working with the properties and drilling down into each of them until I determined that the `Ast.EndBlock.Extent.Text` property returns the content of the function without the `Requires` statement.

![ast-property5a.jpg](https://mikefrobbins.com/2018/09/28/learning-about-the-powershell-abstract-syntax-tree-ast/ast-property5a.jpg)

Figure 5: ast-property5a.jpg

That was easy enough, but who really wants to cast everything as a script block just to view the AST for it? If you do, I've created a function named `ConvertTo-MrScriptBlock` that's part of [my ModuleBuildTools repository on GitHub](https://github.com/mikefrobbins/ModuleBuildTools). Otherwise, I'll be showing you an easier way to accomplish the same task in a future blog article.

Be sure to read the continuation to this blog article series:

-   [Learning about the PowerShell Abstract Syntax Tree (AST)](https://mikefrobbins.com/2018/09/28/learning-about-the-powershell-abstract-syntax-tree-ast/)
-   [Learn about the PowerShell Abstract Syntax Tree (AST) – Part 2](https://mikefrobbins.com/2018/10/24/learn-about-the-powershell-abstract-syntax-tree-ast-part-2/)
-   [Learn about the PowerShell Abstract Syntax Tree (AST) – Part 3](https://mikefrobbins.com/2018/10/25/learn-about-the-powershell-abstract-syntax-tree-ast-part-3/)

µ
