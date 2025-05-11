https://mikefrobbins.com/2022/05/12/use-the-abstract-syntax-tree-ast-to-list-parameters-and-variables-in-powershell-functions/

> One thing I've missed during the past couple of years with virtual-only conferences is the hallway
track. While at the PowerShell + DevOps Global Summit 2022, …

# Use the Abstract Syntax Tree (AST) to list parameters and variables in PowerShell functions
One thing I've missed during the past couple of years with virtual-only conferences is the hallway track. While at the PowerShell + DevOps Global Summit 2022, there was a discussion about using *PascalCase* for parameter names and *camelCase* for user-defined variables in your PowerShell functions.

Specifying different casings depending on the usage seems like a great idea. Determining where you defined your variables would be self-explanatory. The only problem is you need something to verify that you've specified them in the correct case.

This scenario is a perfect opportunity to use the Abstract Syntax Tree (AST) to verify the casing is correct depending on usage.

I started using the `Get-MrAst` function in my [MrModuleTools PowerShell module](https://www.powershellgallery.com/packages/MrModuleTools/) from my [ModuleTools GitHub repo](https://github.com/mikefrobbins/ModuleTools) to retrieve the AST from a file or script block.

```powershell
Get-MrAst -Path C:\MrGit\Inspector\MrInspector\public\Get-MrSyntax.ps1
```

powershell

![variable-type1a.jpg](https://mikefrobbins.com/2022/05/12/use-the-abstract-syntax-tree-ast-to-list-parameters-and-variables-in-powershell-functions/variable-type1a.jpg)

Figure 1: variable-type1a.jpg

I used another one of my functions named `Get-MrAstType` in the same module to determine the different options for filtering the AST. This part was straightforward since they're named `ParameterAst` and `VariableExpressionAst`.

```powershell
Get-MrAstType | Format-Wide -Property {$_} -Column 3 -Force
```

powershell

![variable-type2a.jpg](https://mikefrobbins.com/2022/05/12/use-the-abstract-syntax-tree-ast-to-list-parameters-and-variables-in-powershell-functions/variable-type2a.jpg)

Figure 2: variable-type2a.jpg

There are two different ways to obtain the parameters and variables. One contains the dollar sign and the other, only the variable name. I opted for the one with only the variable name. I filtered out the underscore to prevent current object variables from showing up in the list unless you're using `PSItem`.

The list of variables also contains the parameters because they're specified in the body of the function. I used `Compare-Object` to determine which items are duplicated in both lists. An `If` statement identifies the duplicates as parameters and the non-duplicated items as user-defined variables.

I included the line and column numbers in the output to know where the variables are used. Sometimes they're specified more than once on the same line.

```powershell
#Requires -Version 4.0 function Get-MrVariableType { <# .SYNOPSIS List variables and whether they're defined as parameters or in the body of a function. .DESCRIPTION Get-MrVariableType is an advanced function that returns a list of variables defined in a function and whether they are parameters or user defined within the body of the function. .PARAMETER Ast Provide a ScriptBlockAst object via parameter or pipeline input. Use Get-MrAst to create this object. .EXAMPLE Get-MrAST -Path 'C:\Scripts' | Get-MrVariableType .EXAMPLE Get-MrVariableType -Ast (Get-MrAST -Path 'C:\Scripts') .NOTES Author: Mike F Robbins Website: http://mikefrobbins.com Twitter: @mikefrobbins #> [CmdletBinding()] param ( [Parameter(Mandatory, ValueFromPipeline)] [System.Management.Automation.Language.ScriptBlockAst]$Ast ) PROCESS { $variables = $Ast.FindAll({$args[0].GetType().Name -like 'VariableExpressionAst'}, $true).Where({$_.VariablePath.UserPath -ne '_'}) $parameters = $Ast.FindAll({$args[0].GetType().Name -like 'ParameterAst'}, $true) $diff = Compare-Object -ReferenceObject $parameters.Name.VariablePath.UserPath -DifferenceObject $variables.VariablePath.UserPath -IncludeEqual foreach ($variable in $variables) { [pscustomobject]@{ Name = $variable.VariablePath.UserPath Type = if ($variable.VariablePath.UserPath -in $diff.Where({$_.SideIndicator -eq '=='}).InputObject) { 'Parameter' } else { 'UserDefined' } LineNumber = $variable.Extent.StartLineNumber Column = $variable.Extent.StartColumnNumber } } } }
```

powershell

You can pipe the output of `Get-MrAst` to `Get-MrVariableType` or provide the results via parameter input with the `Ast` parameter.

```powershell
Get-MrAst -Path C:\MrGit\Inspector\MrInspector\public\Get-MrSyntax.ps1 | Get-MrVariableType
```

powershell

![variable-type3a.jpg](https://mikefrobbins.com/2022/05/12/use-the-abstract-syntax-tree-ast-to-list-parameters-and-variables-in-powershell-functions/variable-type3a.jpg)

Figure 3: variable-type3a.jpg

You can also sort the output with `Sort-Object` to see where you've specified variables in a different case. Notice the differences with the `file` and `true` variables in the following results.

```powershell
Get-MrAst -Path C:\MrGit\Inspector\MrInspector\public\Get-MrSyntax.ps1 | Get-MrVariableType | Sort-Object -Property Name
```

powershell

![variable-type4a.jpg](https://mikefrobbins.com/2022/05/12/use-the-abstract-syntax-tree-ast-to-list-parameters-and-variables-in-powershell-functions/variable-type4a.jpg)

Figure 4: variable-type4a.jpg

You could write a unit test using [Pester](https://pester.dev/) to identity when parameters and variables don't adhere to your standards. You could also write code that uses the output of `Get-MrVariableType` to automate the remediation of variable casing.

The `Get-MrVariableType` function shown in this blog article is part of my [MrModuleTools PowerShell module](https://www.powershellgallery.com/packages/MrModuleTools/). You can install it from the PowerShell Gallery using the following command:

```powershell
Install-Module -Name MrModuleTools
```

powershell

The [video](https://youtu.be/mswKIFrDts4) shown below demonstrates how to use the `Get-MrVariableType` function.

<iframe src="https://www.youtube.com/embed/mswKIFrDts4?controls=1&amp;rel=0" loading="lazy"></iframe>

You can download the source code from my [ModuleTools GitHub repo](https://github.com/mikefrobbins/ModuleTools). Feel free to submit a GitHub issue if you have suggestions or find problems. I accept pull requests if you would like to contribute.

µ
