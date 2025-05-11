---
created: 2025-02-20T18:57:11 (UTC +01:00)
tags: []
source: https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction
author: Ondrej Sebela
---

# PowerShell AST, your friend when it comes to PowerShell code analysis & extraction

---
In my previous post about [automating PowerShell module creation](https://doitpsway.com/automate-powershell-module-creation-the-smart-way) I've mentioned usage of AST for code analysis. Mainly for extracting information like function definition, aliases etc.

So today I will show you some basics, plus give you several real world examples, so you can start your own AST journey :).

## Table of contents

-   [Introduction](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#introduction)
-   [What are the necessary steps, to use AST?](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#what-are-the-necessary-steps-to-use-ast)
    -   [1\. Get AST object for your code](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#1-get-ast-object-for-your-code)
    -   [2\. Decide what AST class type you are looking for](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#2-decide-what-ast-class-type-you-are-looking-for)
    -   [3\. Find specific type of AST object](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#3-find-specific-type-of-ast-object)
-   [Real world examples](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#real-world-examples)
    -   [1\. How to get variables](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#1-how-to-get-variables)
    -   [2\. How to get aliases](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#2-how-to-get-aliases)
    -   [3\. How to get function definition](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#3-how-to-get-function-definition)
    -   [4\. How to get function parameters](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#4-how-to-get-function-parameters)
    -   [5\. How to get script requirements](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#5-how-to-get-script-requirements)
-   [Summary](https://doitpshway.com/powershell-ast-your-friend-when-it-comes-to-powershell-code-analysis-and-extraction#summary)

## Introduction

**AST** is abbreviation of **A**bstract **S**yntax **T**ree and it is built-in PowerShell feature for code analysis. In general it will create hierarchic tree of AST objects, representing given code. You can use it for example to extract various information from the code like variables, function definitions, function parameters, aliases, begin/process/end blocks or to self-aware code analysis (code checks itself).

## What are the necessary steps, to use AST?

## 1\. Get AST object for your code

-   get AST object from script file
    
    ```
    <span># get AST object from script file</span>
    $script = <span>'C:\Scripts\SomeScript.ps1'</span>
    $AST = [System.Management.Automation.Language.Parser]::ParseFile($script, [<span>ref</span>]$null, [<span>ref</span>]$null)
    ```
    
-   get AST object from PowerShell code
    
    ```
    <span># get AST object from PowerShell code</span>
    <span># btw to analyze code from which you call this command, use $MyInvocation.MyCommand.ScriptContents instead $code</span>
    $code = @<span>'
    some powershell code here
    '</span>@
    $AST = [System.Management.Automation.Language.Parser]::ParseInput($code, [ref]$null, [ref]$null)
    ```
    
    ## 2\. Decide what AST class type you are looking for
    
    -   for beginners I recommend using great [ShowPSAst module](https://github.com/lzybkr/ShowPSAst)
        
        ```
        <span># install ShowPSAst module</span>
        <span>Install</span>-<span>Module</span> -<span>Name</span> ShowPSAst -<span>Scope</span> CurrentUser -<span>Force</span>
        <span># import commands from ShowPSAst  module</span>
        <span>Import</span>-<span>Module</span> ShowPSAst
        <span># show the AST of a script or script module</span>
        <span>Show</span>-Ast C:\Scripts\someScript.ps1
        ```
        
        It will give you graphical representation of AST object like this ![AST_cover.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1619420083247/ktowNWztF.gif?auto=format,compress&gif-q=60&format=webm) So it is super easy to find AST type. Just go through the middle column items and corresponding counterparts in analyzed code will be highlighted in the right column.
-   Btw there is also more universal tool called [Show-Object](https://devblogs.microsoft.com/scripting/spelunking-with-show-object/), that can visualize **any** PowerShell object

-   Check official documentation [for complete list of AST class types](https://docs.microsoft.com/en-us/dotnet/api/system.management.automation.language?redirectedfrom=MSDN&view=powershellsdk-7.0.0)

Anyway I've chosen to find function parameters i.e. **ParameterAst**, so lets move on to...

## 3\. Find specific type of AST object

-   there are two main methods to search the AST object: `Find()` (return just first result) and `FindAll()` (return all results)
    -   So how to use `FindAll()`? This method needs two parameters. First one (_predicate_) is for filtering the results and second one (_recurse_) is just switch for searching nested scriptBlocks too.

```
<span># search criteria for filtering what AST objects will be returned</span>
<span># it has to be scriptBlock which will be evaluated and if the result will be $true, object will be included</span>
$predicate = {param($astObject) $astObject -is [System.Management.Automation.Language.&lt;placeASTTypeHere&gt;] }

<span># search nested scriptBlocks too</span>
$recurse = $true

<span># traverse the tree and return all AST objects that match $predicate</span>
$AST.FindAll($predicate, $recurse)


<span># to get all AST objects</span>
$AST.FindAll($true, $true)

<span># to get only ParameterAst AST objects</span>
<span># remember this syntax and just customize the last class part (i.e. ParameterAst in this example)</span>
$AST.FindAll({ param($astObject) $astObject -is [System.Management.Automation.Language.ParameterAst] }, $true)
```

![ast_findall.webp](https://cdn.hashnode.com/res/hashnode/image/upload/v1619334006377/Jug3XQ2Pb.webp?auto=compress,format&format=webp)

## Real world examples

> I will use this script Hello-World.ps1 for all examples bellow!

```
<span>#Requires -Version 5.1</span>

<span><span>function</span> <span>Hello</span>-<span>World</span> </span>{
    [Alias(<span>"Invoke-Something"</span>)]
    param (
        [<span>string</span>] $name = <span>"Karel"</span>
        ,
        [<span>switch</span>] $force
    )

    $someInnerVariable = <span>"homeSweetHome"</span>

    Get-Process -Name $name
}

Set-Alias -Name Invoke-SomethingElse -Value Hello-World
```

> And create AST object like this

```
$AST = [System.Management.Automation.Language.Parser]::ParseFile(<span>'C:\Scripts\Hello-World.ps1'</span>, [<span>ref</span>]$null, [<span>ref</span>]$null)
```

-   ### 1\. How to get variables
    
    -   I am using this for [pre-commit validations](https://github.com/ztrhgf/Powershell_CICD_repository) of changes made in our company central Variables.psm1 PowerShell module. Specifically to cancel commit, in case, when newly created variable name, doesn't start with underscore. Or to warn the user, if he modify or delete variable, that is used elsewhere in our central repository.

```
<span><span>function</span> <span>_getVariableAST</span> </span>{
    param ($AST, $varToExclude, [<span>switch</span>] $raw)

    $variable = $AST.FindAll( { $args[<span>0</span>] -is [System.Management.Automation.Language.VariableExpressionAst ] }, $true)
    $variable = $variable | Where-<span>Object</span> { $_.<span>parent</span>.left -<span>or</span> $_.<span>parent</span>.type -<span>and</span> ($_.<span>parent</span>.operator -eq <span>'Equals'</span> -<span>or</span> $_.<span>parent</span>.<span>parent</span>.operator -eq <span>'Equals'</span>) }

    <span>if</span> ($raw) {
        <span>return</span> $variable
    }

    $variable = $variable | Select-<span>Object</span> @{n = <span>"name"</span>; e = { $_.variablepath.userPath } }, @{n = <span>"value"</span>; e = {
            <span>if</span> ($value = $_.<span>parent</span>.right.extent.text) {
                $value
            } <span>else</span> {
                <span># it is typed variable</span>
                $_.<span>parent</span>.<span>parent</span>.right.extent.text
            }
        }
    }

    <span># because of later comparison unify newline symbol (CRLF vs LF)</span>
    $variable = $variable | Select-<span>Object</span> name, @{n = <span>"value"</span>; e = { $_.value.Replace(<span>"`r`n"</span>, <span>"`n"</span>) } }

    <span>if</span> ($varToExclude) {
        $variable = $variable | Where-<span>Object</span> { $_.name -notmatch $varToExclude }
    }

    <span>return</span> $variable
}
```

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1619383804384/0A1Ps9FeF.png?auto=compress,format&format=webp)

### 2\. How to get aliases

This is essential for my [Export-ScriptToModule](https://doitpsway.com/automate-powershell-module-creation-the-smart-way) function to get all aliases defined in script file, to be able to later export them in generated PowerShell module using Export-ModuleMember.

```
<span><span>function</span> <span>_getAliasAST</span> </span>{
    param ($AST, $functionName)

    $alias = @()

    <span># aliases defined by Set-Alias</span>
    $AST.EndBlock.Statements | ? { $_ -match <span>"^\s*Set-Alias .+"</span> -<span>and</span> $_ -match [regex]::Escape($functionName) } | % { $_.extent.text } | % {
        $parts = $_ -split <span>"\s+"</span>

        $content += <span>"`n<span>$_</span>"</span>

        <span>if</span> ($_ -match <span>"-na"</span>) {
            <span># alias set by named parameter</span>
            <span># get parameter value</span>
            $i = <span>0</span>
            $parPosition
            $parts | % {
                <span>if</span> ($_ -match <span>"-na"</span>) {
                    $parPosition = $i
                }
                ++$i
            }

            $alias += $parts[$parPosition + <span>1</span>]
        } <span>else</span> {
            <span># alias set by positional parameter</span>
            $alias += $parts[<span>1</span>]
        }
    }

    <span># aliases defined by [Alias("Some-Alias")]</span>
    $AST.FindAll( {
            param([System.Management.Automation.Language.Ast] $AST)

            $AST -is [System.Management.Automation.Language.AttributeAst]
        }, $true) | ? { $_.<span>parent</span>.extent.text -match <span>'^param'</span> } | Select-<span>Object</span> -ExpandProperty PositionalArguments | Select-<span>Object</span> -ExpandProperty Value -ErrorAction SilentlyContinue | % { $alias += $_ }

    <span>return</span> $alias
}
```

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1619385173214/nAlw75wEK.png?auto=compress,format&format=webp)

### 3\. How to get function definition

This is also essential for my [Export-ScriptToModule](https://doitpsway.com/automate-powershell-module-creation-the-smart-way) function to validate number of defined functions in script file (it has to be exactly one), defined function name (it has to match with ps1 name and will be used in Export-ModuleMember) and content (it will be used to generate PowerShell module).

```
<span><span>function</span> <span>_getFunctionAST</span> </span>{
    param ($AST)

    $AST.FindAll( {
            param([System.Management.Automation.Language.Ast] $AST)

            $AST -is [System.Management.Automation.Language.FunctionDefinitionAst] -<span>and</span>
            <span># Class methods have a FunctionDefinitionAst under them as well, but we don't want them.</span>
            ($PSVersionTable.PSVersion.Major -lt <span>5</span> -<span>or</span>
                $AST.<span>Parent</span> -isnot [System.Management.Automation.Language.FunctionMemberAst])
        }, $true)
}
```

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1619385224112/2edk-GiD0.png?auto=compress,format&format=webp)

### 4\. How to get function parameters

-   I am using this for [pre-commit validations](https://github.com/ztrhgf/Powershell_CICD_repository). In particular to warn the user, in case he made change in parameter of function, that is used elsewhere in our repository. So he can check, this commit won't break anything.
    
    ```
    <span><span>function</span> <span>_getParameterAST</span> </span>{
     param ($AST, $functionName)
    
     $parameter = $AST.FindAll( { $args[<span>0</span>] -is [System.Management.Automation.Language.ParamBlockAst] }, $true) | Where-<span>Object</span> { $_.<span>parent</span>.<span>parent</span>.name -eq $functionName }
    
     $parameter.parameters | Select-<span>Object</span> @{n = <span>'name'</span>; e = { $_.name.variablepath.userpath } }, @{n = <span>'value'</span>; e = { $_.defaultvalue.extent.text } }, @{ n = <span>'type'</span>; e = { $_.staticType.name } }
    }
    ```
    
    ![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1619385286513/K4XELueFR.png?auto=compress,format&format=webp)
    

### 5\. How to get script requirements

Again, this is used in [Export-ScriptToModule](https://doitpsway.com/automate-powershell-module-creation-the-smart-way) function to have option to exclude requirements from generated PowerShell module.

```
$AST.scriptRequirements.requiredModules.name
```

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1619385461705/32MY8DWVa.png?auto=compress,format&format=webp)

## Summary

I hope that you've find some useful new information here. In case of any questions, **don't hesitate to write me some comments**! And for those, who want to go deeper into AST, check this [detailed article about AST](https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree).

PS: I will be talking about GIT hooks automation, and my CI/CD solution in some of upcoming blog posts, don't worry :)
