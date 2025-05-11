https://mikefrobbins.com/2022/04/08/use-the-abstract-syntax-tree-ast-to-inspect-powershell-command-syntax-in-scripts/

> I recently needed to determine the PowerShell commands and parameters used in multiple scripts. What
better way to accomplish this task than to use the Abstract …

# Use the Abstract Syntax Tree (AST) to inspect PowerShell command syntax in scripts
I recently needed to determine the PowerShell commands and parameters used in multiple scripts. What better way to accomplish this task than to use the Abstract Syntax Tree (AST)?

The `Get-MrSyntax` function begins by requiring at least PowerShell version 3.0. This is the oldest version that exposes the AST.

The `Path` parameter uses `ValidateScript` for parameter validation to only accept files with a PS1 or PSM1 extension. The path(s) to the script files can be specified via pipeline or parameter input.

The function iterates through each file and each command within the file to return the results. For a more concise list of results, I decided not to unroll the parameters used by the commands.

```powershell
#Requires -Version 3.0 function Get-MrSyntax { <# .SYNOPSIS List PowerShell commands and parameters in the specified PowerShell script. .DESCRIPTION Get-MrSyntax is a PowerShell function that uses the Abstract Syntax Tree (AST) to determine the commands and parameters within a PowerShell script. .PARAMETER Path Path to one of more PowerShell PS1 or PSM1 script files. .EXAMPLE Get-MrSyntax -Path C:\Scripts\MyScript.ps1 .EXAMPLE Get-ChildItem -Path C:\Scripts\*.ps1 | Get-MrSyntax .EXAMPLE Get-MrSyntax -Path (Get-ChildItem -Path C:\Scripts\*.ps1) .NOTES Author: Mike F Robbins Website: https://mikefrobbins.com Twitter: @mikefrobbins #> [CmdletBinding()] param ( [Parameter(ValueFromPipeline)] [ValidateScript({ If (Test-Path -Path $_ -PathType Leaf -Include *.ps1, *.psm1) { $True } else { Throw "'$_' is not a valid PowerShell PS1 or PSM1 script file." } })] [string[]]$Path ) PROCESS { foreach ($file in $Path) { $AST = [System.Management.Automation.Language.Parser]::ParseFile($File, [ref]$null, [ref]$null) $AST.FindAll({$args[0].GetType().Name -like 'CommandAst'}, $true) | ForEach-Object { [pscustomobject]@{ Cmdlet = $_.CommandElements[0].Value Parameters = $_.CommandElements.ParameterName File = $file } } } } }
```

powershell

![script-functions-and-parameters1a.jpg](https://mikefrobbins.com/2022/04/08/use-the-abstract-syntax-tree-ast-to-inspect-powershell-command-syntax-in-scripts/script-functions-and-parameters1a.jpg)

Figure 1: script-functions-and-parameters1a.jpg

The `Get-MrSyntax` function shown in this blog article is part of [my MrInspector PowerShell module](https://www.powershellgallery.com/packages/MrInspector/). You can install it from the PowerShell Gallery using the following command.

```powershell
Install-Module -Name MrInspector
```

powershell

The [video](https://youtu.be/2qsuqTGy99k) shown below demonstrates how to use this module.

<iframe src="https://www.youtube.com/embed/2qsuqTGy99k?controls=1&amp;rel=0" loading="lazy"></iframe>

You can download the source code from [my Inspector GitHub repo](https://github.com/mikefrobbins/Inspector). Feel free to submit a GitHub issue if you have suggestions or find problems. I accept pull requests if you would like to contribute.

µ
