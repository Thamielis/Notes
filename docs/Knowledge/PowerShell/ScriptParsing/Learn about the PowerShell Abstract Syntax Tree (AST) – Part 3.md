https://mikefrobbins.com/2018/10/25/learn-about-the-powershell-abstract-syntax-tree-ast-part-3/

> This blog article is the third in a series of learning about the PowerShell Abstract Syntax Tree
(AST). Be sure to read the other two if you haven't already. …

# Learn about the PowerShell Abstract Syntax Tree (AST) – Part 3
This blog article is the third in a series of learning about the PowerShell Abstract Syntax Tree (AST). Be sure to read the other two if you haven't already.

-   [Learning about the PowerShell Abstract Syntax Tree (AST)](https://mikefrobbins.com/2018/09/28/learning-about-the-powershell-abstract-syntax-tree-ast/)
-   [Learn about the PowerShell Abstract Syntax Tree (AST) – Part 2](https://mikefrobbins.com/2018/10/24/learn-about-the-powershell-abstract-syntax-tree-ast-part-2/)
-   [Learn about the PowerShell Abstract Syntax Tree (AST) – Part 3](https://mikefrobbins.com/2018/10/25/learn-about-the-powershell-abstract-syntax-tree-ast-part-3/)

In this blog article, I'll be specifically focusing on finding the AST recursively.

I'll start off by storing the path to one of my functions in a variable.

```powershell
$FilePath = 'U:\GitHub\Hyper-V\MrHyperV\public\Get-MrVmHost.ps1'
```

powershell

![part3-ast2a.jpg](https://mikefrobbins.com/2018/10/25/learn-about-the-powershell-abstract-syntax-tree-ast-part-3/part3-ast2a.jpg)

Figure 1: part3-ast2a.jpg

I'll store the AST in a variable and output what's in the variable just to confirm that it contains the AST.

```powershell
$AST = [System.Management.Automation.Language.Parser]::ParseFile($FilePath, [ref]$null, [ref]$null) $AST
```

powershell

![part3-ast3b.jpg](https://mikefrobbins.com/2018/10/25/learn-about-the-powershell-abstract-syntax-tree-ast-part-3/part3-ast3b.jpg)

Figure 2: part3-ast3b.jpg

Now to return the AST recursively. Although this command appears to return the same results based on the following screenshot, it actually returns much more.

```powershell
$AST.FindAll({$true}, $true)
```

powershell

![part3-ast4a.jpg](https://mikefrobbins.com/2018/10/25/learn-about-the-powershell-abstract-syntax-tree-ast-part-3/part3-ast4a.jpg)

Figure 3: part3-ast4a.jpg

The following example gives a better idea of the results. Just returning the top level AST only returns one item, whereas querying the AST recursively returns 118 items, or 26 different unique types.

```powershell
($AST | Get-Member).TypeName | Sort-Object -Unique ($AST.FindAll({$true}, $true) | Get-Member).TypeName | Sort-Object -Unique
```

powershell

![part3-ast5a.jpg](https://mikefrobbins.com/2018/10/25/learn-about-the-powershell-abstract-syntax-tree-ast-part-3/part3-ast5a.jpg)

Figure 4: part3-ast5a.jpg

You'll probably be overwhelmed by all of the AST that's returned when querying it recursively. The solution is to narrow down the results. What are the AST type possibilities that can be used to narrow down the results?

A list of them can be retrieved by querying the [System.Management.Automation.Language.ArrayExpressionAst](https://docs.microsoft.com/dotnet/api/system.management.automation.language.arrayexpressionast) .NET class. I ended up using a regular expression to cleanup the results and while I’ve seen others do this without a regex, they typically end up removing `Expression` from the list which makes it incomplete.

```powershell
([System.Management.Automation.Language.ArrayExpressionAst].Assembly.GetTypes() | Where-Object {$_.Name.EndsWith('Ast') -and $_.Name -ne 'Ast'}).Name -replace '(?<!^)ExpressionAst$|Ast$' | Sort-Object -Unique
```

powershell

![part3-ast1a.jpg](https://mikefrobbins.com/2018/10/25/learn-about-the-powershell-abstract-syntax-tree-ast-part-3/part3-ast1a.jpg)

Figure 5: part3-ast1a.jpg

I'll use one of the items (Variable) from the previous list to return only the AST information for the variables used in my function.

```powershell
$AST.FindAll({$args[0].GetType().Name -like "*Variable*Ast"}, $true)
```

powershell

![part3-ast6a.jpg](https://mikefrobbins.com/2018/10/25/learn-about-the-powershell-abstract-syntax-tree-ast-part-3/part3-ast6a.jpg)

Figure 6: part3-ast6a.jpg

Finally, I'll return a unique list of only the variables themselves that are used in the function.

```powershell
$AST.FindAll({$args[0].GetType().Name -like "*Variable*Ast"}, $true) | Select-Object -Property Extent -Unique
```

powershell

![part3-ast7a.jpg](https://mikefrobbins.com/2018/10/25/learn-about-the-powershell-abstract-syntax-tree-ast-part-3/part3-ast7a.jpg)

Figure 7: part3-ast7a.jpg

As you can see, there's a lot of power in using the AST.

In my next blog article, I'll share and demonstrate functions that I've created that use the AST to help automate my script module build process.

µ
