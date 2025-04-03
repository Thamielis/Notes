https://mikefrobbins.com/2018/10/24/learn-about-the-powershell-abstract-syntax-tree-ast-part-2/

> In my previous blog article a few weeks ago on
Learning about the PowerShell Abstract Syntax Tree (AST),
I mentioned there was an easier way to retrieve the AST …

# Learn about the PowerShell Abstract Syntax Tree (AST) – Part 2
In my previous blog article a few weeks ago on [Learning about the PowerShell Abstract Syntax Tree (AST)](https://mikefrobbins.com/2018/09/28/learning-about-the-powershell-abstract-syntax-tree-ast/), I mentioned there was an easier way to retrieve the AST so that you didn't have to cast everything to a script block. There are two .NET static methods, [ParseFile](https://docs.microsoft.com/dotnet/api/system.management.automation.language.parser.parsefile) and [ParseInput](https://docs.microsoft.com/dotnet/api/system.management.automation.language.parser.parseinput), that are part of the [Parser Class](https://docs.microsoft.com/dotnet/api/system.management.automation.language.parser) in the `System.Management.Automation.Language` namespace which can be used to retrieve the AST.

First, I’ll store the content of one of my functions in a variable.

```powershell
$Code = Get-Content -Path U:\GitHub\Hyper-V\MrHyperV\public\Get-MrVmHost.ps1 -Raw
```

powershell

![part2-ast1b.jpg](https://mikefrobbins.com/2018/10/24/learn-about-the-powershell-abstract-syntax-tree-ast-part-2/part2-ast1b.jpg)

Figure 1: part2-ast1b.jpg

The `ParseInput` static method can be used with the content of the function from the previous example to retrieve things like the function itself without the [Requires statement](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_requires) (no Regular Expression needed).

```powershell
$Tokens = $null $Errors = $null [System.Management.Automation.Language.Parser]::ParseInput($Code, [ref]$Tokens, [ref]$Errors)
```

powershell

![part2-ast2b.jpg](https://mikefrobbins.com/2018/10/24/learn-about-the-powershell-abstract-syntax-tree-ast-part-2/part2-ast2b.jpg)

Figure 2: part2-ast2b.jpg

Due to the way that .NET works, you'll first need to define the variable used for `Tokens` and `Errors` otherwise an error will be generated.

```powershell
[System.Management.Automation.Language.Parser]::ParseInput($Code, [ref]$Tokens, [ref]$Errors)
```

powershell

![part2-ast3b.jpg](https://mikefrobbins.com/2018/10/24/learn-about-the-powershell-abstract-syntax-tree-ast-part-2/part2-ast3b.jpg)

Figure 3: part2-ast3b.jpg

```gdscript3
[ref] cannot be applied to a variable that does not exist. At line:1 char:1 + [System.Management.Automation.Language.Parser]::ParseInput($Code, [re … + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ + CategoryInfo : InvalidOperation: (Tokens:VariablePath) [], RuntimeException + FullyQualifiedErrorId : NonExistingVariableReference
```

gdscript3

If you don't need the information contained in them, instead of setting a variable to `$null` and then using it, you can reduce the number of steps necessary by simply using `$null` for them when calling the .NET method.

```powershell
[System.Management.Automation.Language.Parser]::ParseInput($Code, [ref]$null, [ref]$null)
```

powershell

![part2-ast4b.jpg](https://mikefrobbins.com/2018/10/24/learn-about-the-powershell-abstract-syntax-tree-ast-part-2/part2-ast4b.jpg)

Figure 4: part2-ast4b.jpg

One last tip before moving onto the `ParseFile` static method. If you're going to use the [Get-Content](https://docs.microsoft.com/powershell/module/microsoft.powershell.management/get-content) cmdlet to retrieve the code for working with `ParseInput`, be sure to add its `Raw` parameter otherwise the formatting of the code in the results will be skewed as shown in the following example.

```powershell
$Code = Get-Content -Path U:\GitHub\Hyper-V\MrHyperV\public\Get-MrVmHost.ps1 [System.Management.Automation.Language.Parser]::ParseInput($Code, [ref]$null, [ref]$null)
```

powershell

![part2-ast5a.jpg](https://mikefrobbins.com/2018/10/24/learn-about-the-powershell-abstract-syntax-tree-ast-part-2/part2-ast5a.jpg)

Figure 5: part2-ast5a.jpg

If you're going to retrieve all of the content from a file similarly to what I've shown so far in this blog article, save yourself a step or two by simply using the `ParseFile` static method instead of `ParseInput`.

```powershell
$FilePath = 'U:\GitHub\Hyper-V\MrHyperV\public\Get-MrVmHost.ps1' [System.Management.Automation.Language.Parser]::ParseFile($FilePath, [ref]$null, [ref]$null)
```

powershell

![part2-ast6a.jpg](https://mikefrobbins.com/2018/10/24/learn-about-the-powershell-abstract-syntax-tree-ast-part-2/part2-ast6a.jpg)

Figure 6: part2-ast6a.jpg

Consider storing the results in a variable while prototyping with this or any command. Remember that any command that produces object based output can be piped to [Get-Member](https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/get-member) to determine its methods and properties.

```powershell
$Results = [System.Management.Automation.Language.Parser]::ParseFile($FilePath, [ref]$null, [ref]$null) $Results | Get-Member
```

powershell

![part2-ast7a.jpg](https://mikefrobbins.com/2018/10/24/learn-about-the-powershell-abstract-syntax-tree-ast-part-2/part2-ast7a.jpg)

Figure 7: part2-ast7a.jpg

Note that the `System.Management.Automation.Language` namespace only exists in Windows PowerShell version 3.0 or higher, although that shouldn't be a problem since [Windows PowerShell version 2.0 is deprecated](https://blogs.msdn.microsoft.com/powershell/2017/08/24/windows-powershell-2-0-deprecation/). All examples shown in this blog article were tested on Windows 10 Enterprise Edition version 1809 with both Windows PowerShell 5.1 and [PowerShell Core 6.1](https://blogs.msdn.microsoft.com/powershell/2018/09/13/announcing-powershell-core-6-1/) (PowerShell Core installs side by side on Windows based systems).

The examples shown in this blog article only return the top level AST. In Part 3 of this blog article series, I'll dive into searching for AST instances recursively.

-   [Learning about the PowerShell Abstract Syntax Tree (AST)](https://mikefrobbins.com/2018/09/28/learning-about-the-powershell-abstract-syntax-tree-ast/)
-   [Learn about the PowerShell Abstract Syntax Tree (AST) – Part 2](https://mikefrobbins.com/2018/10/24/learn-about-the-powershell-abstract-syntax-tree-ast-part-2/)
-   [Learn about the PowerShell Abstract Syntax Tree (AST) – Part 3](https://mikefrobbins.com/2018/10/25/learn-about-the-powershell-abstract-syntax-tree-ast-part-3/)

µ
