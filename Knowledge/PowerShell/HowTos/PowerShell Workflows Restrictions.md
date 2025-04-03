---
created: 2022-03-04T14:46:36 (UTC +01:00)
tags: []
source: https://devblogs.microsoft.com/scripting/powershell-workflows-restrictions/
author: Dr Scripto
---

# PowerShell Workflows: Restrictions - Scripting Blog

> ## Excerpt
> Summary: Windows PowerShell MVP Richard Siddaway talks about restrictions on Windows PowerShell workflows. Microsoft Scripting Guy, Ed Wilson, is here. Today, we have the second in a series of guest blog posts written by Windows PowerShell MVP Richard Siddaway dealing with Windows PowerShell workflow.

---
![](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2018/09/dr_scripto-102x150.gif)

Dr Scripto

January 2nd, 2013

**Summary:** Windows PowerShell MVP Richard Siddaway talks about restrictions on Windows PowerShell workflows. Microsoft Scripting Guy, Ed Wilson, is here. Today, we have the second in a series of guest blog posts written by Windows PowerShell MVP Richard Siddaway dealing with Windows PowerShell workflow.

**Note**   The first article, [PowerShell Workflows: The Basics](http://blogs.technet.com/b/heyscriptingguy/archive/2012/12/26/powershell-workflows-the-basics.aspx), introduced the basic concepts of Windows PowerShell workflow. You should read that article prior to reading today’s article. Richard has written a [number of guest Hey, Scripting Guy! Blog posts](http://blogs.technet.com/b/heyscriptingguy/archive/tags/richard+siddaway/) and has also written two books on Windows PowerShell. His most recent book, [PowerShell in Depth](http://www.manning.com/jones2/), is co-written with fellow MVPs Don Jones and Jeffrey Hicks. Now, take it away, Richard … In the last post, I introduced the basics of Windows PowerShell workflows. I mentioned a number of restrictions around workflows. It’s time to look at those restrictions and discover how they can be overcome. Workflow restrictions tend to fall into the following groups:

-   Unsupported Windows PowerShell activities
-   Scope of variables
-   Objects are de-serialized
-   Cmdlets that haven’t had workflow activities created

## Unsupported Windows PowerShell activities[](https://devblogs.microsoft.com/scripting/powershell-workflows-restrictions/#unsupported-windows-powershell-activities)

A number of Windows PowerShell keywords and techniques aren’t supported in workflows. The following table provides a summary.

<table><tbody><tr><td colspan="3"><strong>Unsupported PowerShell techniques</strong></td></tr><tr><td><p>Begin,Process,End</p></td><td><p>Break,Continue</p></td><td><p>Subexpressions</p></td></tr><tr><td><p>Multiple assignment</p></td><td><p>Modify loop variable</p></td><td><p>Dynamic parameters</p></td></tr><tr><td><p>Set properties</p></td><td><p>Dot sourcing</p></td><td><p>Advanced parameter validation</p></td></tr><tr><td><p>Positional parameters</p></td><td><p>Switch statement</p></td><td><p>Trap statement</p></td></tr><tr><td><p>Inline help</p></td><td><p>Setting drive qualified variables</p></td><td><p>Method invocation on objects</p></td></tr><tr><td><p>Single #requires</p></td><td></td><td></td></tr></tbody></table>

  One other issue I’ve see regards using custom Windows PowerShell drives—workflows may fail if they are present. Some of these restrictions—such using the trap statement—aren’t too much of an issue. In this case, you should be using a try-catch block. Other restrictions will be more awkward such as not being able to use a switch statement. If you try what looks like a perfectly valid switch statement (try replacing “workflow” with “function“ and see what happens).

```powerhell
workflow testswitch {

 param (
  [string]$os
 )

 switch ($os) {
  “XP”        {“Time to upgrade”}
  “Windows7”  {“OK – but not the lastest”}
  “Windows 8” {“Latest and greatest”}
 }

}   
```

You will get a sea of red error messages:

At line:5 char:2
+  switch ($os) {
+  ~~~~~~~~~~~~~~   Case-insensitive switch statements are not supported in a Windows PowerShell workflow. Supply the -CaseSensitive flag, and ensure that case clauses are written appropriately. To write a case-insensitive case statement, first convert the input to either uppercase or lowercase, and update the case clauses to match.
    + CategoryInfo          : ParserError: (:) \[\], ParentContainsErrorRecordEx
   ception
    + FullyQualifiedErrorId : SwitchCaseSensitive   

So you might think you can do this:

```powerhell
workflow testswitchi {

 param (
  [string]$os
 )

 switch -CaseSensitive ($os.ToUpper())  {
  “XP”        {“Time to upgrade”}
  “WINDOWS7”  {“OK – but not the lastest”}
  “WINDOWS 8” {“Latest and greatest”}
 }

}
```

  Nope. More red.

At line:5 char:25
+  switch -CaseSensitive ($os.ToUpper())  {
+                         ~~~~~~~~~~~~~   Method invocation is not supported in a Windows PowerShell Workflow. To use .NET Framework scripting, place your commands in an inline script:

InlineScript {

<commands> }.

    + CategoryInfo          : ParserError: (:) \[\], ParentContainsErrorRecordEx

   ception

    + FullyQualifiedErrorId : MethodInvocationNotSupported

  So time to trot out the workflow “get out of jail card” – InlineScript

```powerhell
workflow testswitch {

     param (
        [string]$os
     )

     InlineScript {
        switch ($using:os) {
            “XP”        {“Time to upgrade”}
            “Windows7”  {“OK – but not the lastest”}
            “Windows 8” {“Latest and greatest”}
        }
    }

}   
```

This works as you would expect. Other restrictions such as the BEGIN, PROCESS, and END blocks that you can use in functions impact features that don’t really fit with the workflow concept. The other restriction that can have a big impact is that you can’t use inline comment-based Help. You have to use XML-based Help files. There are a number of ways to generate these files—one of the easiest is [through InfoPath as described by James O’Neill](http://blogs.technet.com/b/jamesone/archive/2009/07/24/powershell-on-line-help-a-change-you-should-make-for-v2-3-and-how-to-author-maml-help-files-for-powershell.aspx). Not having parameter validation available could be a big problem if your workflows are heavily parameterized. This restriction doesn’t appear to have a workaround unless you create the validation code inside the workflow. You will have noticed the $using:computer I used last time and $using:os in the code demonstrating the switch statement. This syntax is part of the solution to overcoming the second restriction that is the scope of variables.

## Scope of variables[](https://devblogs.microsoft.com/scripting/powershell-workflows-restrictions/#scope-of-variables)

In workflows, the following restrictions on the use of variables occur:

-   Variables defined in a higher scope are visible to lower workflow scopes but not Inlinescript scopes
-   CANNOT have a variable in a lower scope with same name as a variable in higher scope
-   if define or redefine variable can use it in that scope without problems
-   there is no $global scope
-   use “$using” in InlineScript blocks to access variables defined in a higher scope
-   modification of a variable from a higher scope in an InlineScript requires the use of a temporary variable
-   use “$workflow” to modify variable defined in a higher scope
-   CANNOT use subexpressions

That probably looks very confusing but this demonstration should help clear things up_. I recommend that you run this and work through the output._

```powerhell
workflow demo-scope {
    # This is a workflow top-level variable
    $a = 22

    “Initial value of A is: $a”

    # Access $a from Inlinescript (bringing a workflow variable to the Windows PowerShell session) using $using
    inlinescript {“PowerShell variable A is: $a”}
    inlinescript {“Workflow variable A is: $using:a”}

    ## changing a variable value
    $a = InlineScript {$b = $Using:a+5; $b}

    “Workflow variable A after InlineScript change is: $a”

    parallel {
        sequence {
            # Reading a top-level variable (no $workflow: needed)
            “Value of A inside parallel is: $a”

            # Updating a top-level variable with $workflow:<variable name>
            $workflow:a = 3
        }

    }

    “Updated value of A is: $a”

}
```

demo-scope You should see something like this as your output:

Initial value of A is: 22
PowerShell variable A is:
Workflow variable A is: 22
Workflow variable A after InlineScript change is: 27
Value of A inside parallel is: 27

Updated value of A is: 3 The workflow starts by defining a variable, $a = 22, and then displaying its value. In an InlineScript, if you try to access a variable defined in a higher scope, you get nothing as shown in the second line of the output. You have to use $using:a to access the variable. If you want to change that variable you have to use a second variable and return it to the original variable:

```powerhell
$a = InlineScript {$b = $Using:a+5; $b} 
```
The output shows the variable now has a value of 27. Moving into the parallel block you can read the variable without any scope issues. If you need to change the variable’s value you access via the $workflow scope. Bottom line with variables: keep it simple and be careful.

## Objects are de-serialized[](https://devblogs.microsoft.com/scripting/powershell-workflows-restrictions/#objects-are-de-serialized)

The third restriction is that objects in workflows are de-serialized. This is similar to the position in Windows PowerShell remoting (which is not surprising as workflows use the same transport mechanism). As an aside object de-serialization is becoming much more prevalent in Windows PowerShell. It appears in:

-   Windows PowerShell remoting
-   Remote access via CIM sessions
-   WSMAN cmdlets
-   Workflows

Perhaps it’s time for the normal approach to become one of working in this manner. A de-serialized object gives you the properties of the object BUT not the methods. In other words, it is inert. Lots of Windows PowerShell code does something like these examples:

$string = “abcde”

$string.ToUpper()

$os = Get-WmiObject -Class Win32\_OperatingSystem

$os.ConvertToDateTime($os.LastBootUpTime)   This approach isn’t going to work.

workflow test2 {

$string = “abcde”

$string.ToUpper()

$os = Get-WmiObject -Class Win32\_OperatingSystem

$os.ConvertToDateTime($os.LastBootUpTime)

}

  Will throw an error about method invocation not being supported. You can however do this:

workflow test2 {

inlinescript {

$string = “abcde”

$string.ToUpper()

$os = Get-WmiObject -Class Win32\_OperatingSystem

$os.ConvertToDateTime($os.LastBootUpTime)

}

} Don’t try and access variables from a higher scope that represent objects and then invoke methods—it won’t work. Bottom line on de-serialized objects—if you need the methods of an object, access it through an inlinescript. Remember that you can nest InlineScript blocks in parallel blocks!

## Cmdlets that haven’t had workflow activities created[](https://devblogs.microsoft.com/scripting/powershell-workflows-restrictions/#cmdlets-that-havent-had-workflow-activities-created)

The final restriction is around the cmdlets that haven’t been turned into workflows. Remember last time there was a problem with using the **Format\*** cmdlets in workflows. The way around it is to use the InlineScript keyword like this:

workflow foreachpitest {

   param(\[string\[\]\]$computers)

   foreach –parallel ($computer in $computers){

     InlineScript {

       Get-WmiObject –Class Win32\_OperatingSystem –ComputerName $using:computer |

       Format-List

     }

   }

}  Other cmdlets that haven’t been turned into workflow activities are shown in the following table. You can use them in InlineScript blocks.

<table><tbody><tr><td><strong>Unsupported cmdlet (group)</strong></td><td><p><strong>Reason</strong></p></td></tr><tr><td><p>*Alias, *FormatData, *History, *Location, *PSDrive, *Transcript, *TypeDate, *Variable, Connect/Disconnect-Wsman</p></td><td><p>Only change Windows PowerShell session so not needed in workflow</p></td></tr><tr><td><p>Show-Command, Show-ControlPanelItem, Get-Credential, Show-EventLog, Out-Gridview, Read-Host, Debug-Process</p></td><td><p>Workflows don’t support interactive cmdlets</p></td></tr><tr><td><p>*BreakPoint, Get-PSCallStack, Set-PSDebug</p></td><td><p>Workflows don’t support script debugging</p></td></tr><tr><td><p>*Transaction</p></td><td><p>Workflows don’t support transactions</p></td></tr><tr><td><p>Format*</p></td><td><p>No formatting support</p></td></tr><tr><td><p>*PSsession, *PSsessionoption</p></td><td><p>Remoting controlled by workflow</p></td></tr><tr><td><p>Export-Console,Get-ControlPanelItem, Out-Default, Out-Null, Write-Host, Export-ModuleMember, Add-PSSnapin, Get-PSSnapin, Remove-PSSnapin, Trace-Command</p></td><td></td></tr></tbody></table>

  There are a number of cmdlets that are local execution only in workflows.

<table><tbody><tr><td><strong>Add-Member&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</strong></td><td><p><strong>Compare-Object&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</strong></p></td><td><p><strong>ConvertFrom-Csv&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</strong></p></td><td><p><strong>ConvertFrom-Json&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</strong></p></td></tr><tr><td><p>ConvertFrom-StringData&nbsp;&nbsp;</p></td><td><p>Convert-Path&nbsp;</p></td><td><p>ConvertTo-Csv&nbsp;</p></td><td><p>ConvertTo-Html&nbsp;</p></td></tr><tr><td><p>ConvertTo-Json&nbsp;&nbsp;</p></td><td><p>ConvertTo-Xml&nbsp;&nbsp;&nbsp;</p></td><td><p>ForEach-Object&nbsp;&nbsp;</p></td><td><p>Get-Host</p></td></tr><tr><td><p>Get-Member&nbsp;</p></td><td><p>Get-Random&nbsp;&nbsp;</p></td><td><p>Get-Unique&nbsp;&nbsp;</p></td><td><p>Group-Object&nbsp;</p></td></tr><tr><td><p>Measure-Command&nbsp;</p></td><td><p>Measure-Object</p></td><td><p>New-PSSessionOption&nbsp;</p></td><td><p>New-PSTransportOption&nbsp;</p></td></tr><tr><td><p>New-TimeSpan&nbsp;</p></td><td><p>Out-Default&nbsp;</p></td><td><p>Out-Host&nbsp;</p></td><td><p>Out-Null</p></td></tr><tr><td><p>Out-String</p></td><td><p>Select-Object&nbsp;</p></td><td><p>Sort-Object&nbsp;</p></td><td><p>Update-List&nbsp;</p></td></tr><tr><td><p>Where-Object&nbsp;</p></td><td><p>Write-Debug&nbsp;</p></td><td><p>Write-Error&nbsp;</p></td><td><p>Write-Host&nbsp;</p></td></tr><tr><td><p>Write-Output&nbsp;</p></td><td><p>Write-Progress&nbsp;</p></td><td><p>Write-Verbose&nbsp;</p></td><td></td></tr></tbody></table>

  If you want to use them remotely—you’ve guessed it—use an InlineScript. You can find out more about workflow restrictions in the Help files:

about\_ActivityCommonParameters

about\_Checkpoint-Workflow

about\_Foreach-Parallel

about\_InlineScript

about\_Parallel

about\_Sequence

about\_Suspend-Workflow

about\_WorkflowCommonParameters

about\_Workflows You may not see them when you first load Windows PowerShell. Import the **PSWorkflow** module and they will become visible. I’ve tried to cover the restrictions you will face when using workflows. As I said in the first article in the series, [PowerShell Workflows: The Basics](http://blogs.technet.com/b/heyscriptingguy/archive/2012/12/26/powershell-workflows-the-basics.aspx), if you don’t understand the restrictions they will trip you up. Next time, we’ll look at nesting workflows and using Windows PowerShell functions with workflows. ~Richard Thank you, Richard, for another great article. Join me tomorrow for more cool Windows PowerShell stuff. I invite you to follow me on [Twitter](http://bit.ly/scriptingguystwitter) and [Facebook](http://bit.ly/scriptingguysfacebook). If you have any questions, send email to me at [scripter@microsoft.com](http://blogs.technet.commailto:scripter@microsoft.com/), or post your questions on the [Official Scripting Guys Forum](http://bit.ly/scriptingforum). See you tomorrow. Until then, peace. **Ed Wilson, Microsoft Scripting Guy**

![](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2018/09/dr_scripto-102x150.gif)
