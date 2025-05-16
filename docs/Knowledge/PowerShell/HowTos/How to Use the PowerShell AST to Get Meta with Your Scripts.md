---
created: 2022-09-22T19:30:19 (UTC +02:00)
tags: []
source: https://adamtheautomator.com/powershell-ast/
author: 
---

# How to Use the PowerShell AST to Get Meta with Your Scripts

> ## Excerpt
> Learn how to get meta with your PowerShell scripts using the PowerShell AST. Use PowerShell to read PowerShell in this tutorial!

---
The PowerShell AST essentially breaks down the code into a hierarchical tree with each element representing a part of the tree, making the scripts self aware.

Imagine a PowerShell script that is self-aware. Imagine a PowerShell script that can read itself, or even generate other scripts based on what’s contained in itself. Think of it as meta-scripting. It’s a neat concept and has a lot of practical uses! This is what the PowerShell AST can do. The PowerShell AST essentially breaks down the code into a hierarchical tree with each element representing a part of the tree.

In this article, I’m going to go over how you can use the PowerShell AST and go over a few examples of how it works to parse PowerShell code.

## Understanding the Language.Parser Class

To get started, you’ll need to get familiar with the [System.Management.Automation.Language.Parser class][2]. This is a class that contains a few applicable static methods that we can use to read scripts and code. This class has two methods that you’ll routinely use called `ParseInput()` and `ParseFile()`, which essentially do the same thing. `ParseInput()` reads code as a big string while `ParseFile()` assists you in converting a text file containing PowerShell code and converts it into a string for parsing. Both end up with the same result.

Let’s say I have a simple script with the following lines:

```powershell
Write-Host 'I am doing something here'
Write-Verbose 'I am doing something here too'
Write-Host 'Again, doing something.'
$var1 = 'abc'
$var2 = '123'
```

From within the script itself, I’d like to determine all the references to each cmdlet I have and each variable. To do this, I’ll first need to figure out a way to get the entire script contents as one, big string. I can do that by using the PowerShell AST object’s `$MyInvocation.MyCommand.ScriptContents` property. I’ll just add this as the last line in the script and execute it.

Once I have the script contents, I can then pass this to the `ParseInput()` method as mentioned above to build a “tree” from my script. I’ll replace that `$MyInvocation.MyCommand.ScriptContents` reference with below:

```powershell
[System.Management.Automation.Language.Parser]::ParseInput($MyInvocation.MyCommand.ScriptContents, [ref]$null, [ref]$null)
```

This gets me an output that looks like this:

```powershell
PS> C:\test.ps1
 I am doing something here
 Again, doing something.
 
 
 Attributes         : {}
 UsingStatements    : {}
 ParamBlock         :
 BeginBlock         :
 ProcessBlock       :
 EndBlock           : Write-Host 'I am doing something here'
                      Write-Verbose 'I am doing something here too'
                      Write-Host 'Again, doing something.'
                      $var1 = 'abc'
                      $var2 = '123'
                      [System.Management.Automation.Language.Parser]::ParseInput($MyInvocation.MyCommand.ScriptContents,
                       [ref]$null, [ref]$null)
 DynamicParamBlock  :
 ScriptRequirements :
 Extent             : Write-Host 'I am doing something here'
                      Write-Verbose 'I am doing something here too'
                      Write-Host 'Again, doing something.'
                      $var1 = 'abc'
                      $var2 = '123'
                      [System.Management.Automation.Language.Parser]::ParseInput($MyInvocation.MyCommand.ScriptContents,
                       [ref]$null, [ref]$null)
 
 Parent             
```

This doesn’t do much good, though. I’d like a way to look into this and find only the function and variables contained in my script. To do that, I’ll need to assign our AST to a variable. I’ll call mine `$ast`.

`PS> $ast = C:\test.ps1`

This gets me an object that has various methods and properties I can now use.

```powershell
PS> $ast | gm
 
 
    TypeName: System.Management.Automation.Language.ScriptBlockAst
 
 Name               MemberType Definition
 ----               ---------- ----------
 Copy               Method     System.Management.Automation.Language.Ast Copy()
 Equals             Method     bool Equals(System.Object obj)
 Find               Method     System.Management.Automation.Language.Ast Find(System.Func[System.Management.Automatio...
 FindAll            Method     System.Collections.Generic.IEnumerable[System.Management.Automation.Language.Ast] Find...
 -- SNIP --
```

## Finding Items with the FindAll() Method

The most useful method to use is the `FindAll()` method. This is a method that allows you to query the AST itself looking for particular types of language constructs. In our case, we’re looking for function calls and variable assignments.

To only find the language constructs we’re looking for, we must first figure out what class is represented by each type. In our examples, those classes are `CommandAst` for function calls and `VariableExpression` for variable assignments. You can view all of the different class types at the [MSDN System.Management.Automation.Language namespace page][3].

Here I will find all of the function references.

```powershell
PS> $ast.FindAll({$args[0] -is [System.Management.Automation.Language.CommandAst]}, $true)
 
 CommandElements    : {Write-Host, 'I am doing something here'}
 InvocationOperator : Unknown
 DefiningKeyword    :
 Redirections       : {}
 Extent             : Write-Host 'I am doing something here'
 Parent             : Write-Host 'I am doing something here'
 
 CommandElements    : {Write-Verbose, 'I am doing something here too'}
 InvocationOperator : Unknown
 DefiningKeyword    :
 Redirections       : {}
 Extent             : Write-Verbose 'I am doing something here too'
 Parent             : Write-Verbose 'I am doing something here too'
 
 CommandElements    : {Write-Host, 'Again, doing something.'}
 InvocationOperator : Unknown
 DefiningKeyword    :
 Redirections       : {}
 Extent             : Write-Host 'Again, doing something.'
 Parent             : Write-Host 'Again, doing something.'

```

Let’s now find all of the variable assignments as well.

```powershell
PS> $ast.FindAll({$args[0] -is [System.Management.Automation.Language.VariableExpressionAst]},$true)
 
 ariablePath : var1
 Splatted.   : False
 StaticType  : System.Object
 Extent.     : $var1
 Parent.     : $var1 = 'abc'
 
 VariablePath : var2
 Splatted.    : False
 StaticType.  : System.Object
 Extent.      : $var2
 Parent.      : $var2 = '123'
 
 VariablePath : MyInvocation
 Splatted.    : False
 StaticType.  : System.Object
 Extent.      : $MyInvocation
 Parent.      : $MyInvocation.MyCommand
 
 VariablePath : null
 Splatted.    : False
 StaticType.  : System.Object
 Extent.      : $null
 Parent.      : [ref]$null
 
 VariablePath : null
 Splatted.    : False
 StaticType.  : System.Object
 Extent.      : $null
 Parent.      : [ref]$null
```

You can see that each construct now becomes an object you can work with. You now have the knowledge to break apart your script in just about any way you’d like. By using the AST, your PowerShell scripts now can become self-aware. Just don’t blame me when your scripts start trying to take your job themselves!

[1]: https://adamtheautomator.com/tag/powershell/
[2]: https://msdn.microsoft.com/en-us/library/system.management.automation.language.parser(v=vs.85).aspx
[3]: https://msdn.microsoft.com/en-us/library/system.management.automation.language(v=vs.85).aspx
