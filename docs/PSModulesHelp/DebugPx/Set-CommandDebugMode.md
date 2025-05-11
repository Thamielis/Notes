Set-CommandDebugMode
--------------------

### Synopsis
Sets the current debug mode for a command.

---

### Description

The Set-CommandDebugMode command sets the current debug mode for a command. Debug modes include DebuggerHidden and DebuggerStepThrough.

---

### Related Links
* [Get-CommandDebugMode](Get-CommandDebugMode)

* [Get-Command](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Core/Get-Command)

---

### Examples
> BEISPIEL 1

Set-CommandDebugMode -Module FormatPx -DebuggerHidden
This command sets the debug mode for all functions in the FormatPx module to DebuggerHidden. By invoking this command, you're instructing the PowerShell debugger to keep these command internals hidden from the debugger, such that the debugger will not step into them.
> BEISPIEL 2

```PowerShell
function Invoke-ScriptBlock {param([ScriptBlock]$ScriptBlock) breakpoint; $ScriptBlock.Invoke()}
PS C:\> Invoke-ScriptBlock {'When you run this, the debugger will stop inside the Invoke-ScriptBlock function on the breakpoint. Press c to let it finish executing.'}
PS C:\> Set-CommandDebugMode -Name Invoke-ScriptBlock -DebuggerHidden
PS C:\> Invoke-ScriptBlock {'This time the debugger will skip over any breakpoints in the Invoke-ScriptBlock function because the internals are hidden from the debugger, but it will still stop on breakpoints in the script block passed into the function because that script block is not hidden from the debugger. Press c to let it finish executing.'; breakpoint}

The first command creates a function that invokes a script block that is passed into it. This function has a breakpoint set on the first line. The second command invokes that function, which stops on a breakpoint, as expected. After pressing c to continue, you can invoke the third command. The third command configures that function so that its internals are hidden from the debugger. The last command invokes the function again, but this time the breakpoint inside the function is ignored because it is hidden from the debugger. Note however that breakpoints in the script block that it invokes are not ignored unless those script blocks themselves have the debugger hidden attribute set on them.
```
> BEISPIEL 3

```PowerShell
function Test-Function {'Command 1'; 'Command 2'}
PS C:\> function Test-DebuggerStepThrough {'Press s twice to step into the next command and note how you can only step into Test-Function when the DebuggerStepThrough attribute is not present or when that attribute is present and there is a breakpoint in that function. Press c to let it finish executing.'; breakpoint; Test-Function}
PS C:\> Test-DebuggerStepThrough
PS C:\> Set-CommandDebugMode -Name Test-Function -DebuggerStepThrough
PS C:\> Test-DebuggerStepThrough
PS C:\> function Test-Function {'Command 1'; breakpoint; 'Command 2'}
PS C:\> Set-CommandDebugMode -Name Test-Function -DebuggerStepThrough
PS C:\> Test-DebuggerStepThrough

The first command creates a test function with two commands. The second command creates a test function to see how the DebuggerStepThrough attribute works. The third command invokes that function, and you can step into the first function using the debugger.

The fourth command configures Test-Function such that the debugger will not step into it unless a breakpoint is set. The fifth command invokes the Test-DebuggerStepThrough function again, and this time stepping results in the debugger stepping over Test-Function.

The sixth command redefines the test function with a breakpoint. The seventh command sets DebuggerStepThrough mode on that redefined function. When the last command is invoked, and you step through using the debugger, the debugger will step over the Test-Function however since there is a breakpoint, the debugger stops on the breakpoint in that function. From this point, stepping through the rest of the function works as normal.
```
> BEISPIEL 4

```PowerShell
Set-CommandDebugMode -Module DebugPx -DebuggerHidden:$false -DebuggerStepThrough:$false
This command removes all debug mode options from all functions and filters that are exported by the DebugPx module. With these options removed, the debugger can then step into these functions if necessary.
```
> BEISPIEL 5

```PowerShell
Set-CommandDebugMode -Module DebugPx
This command removes all debug mode options from all functions and filters that are exported by the DebugPx module. With these options removed, the debugger can then step into these functions if necessary.
```

---

### Parameters
#### **Name**
Sets the debug mode for commands with the specified name. Enter a name or name pattern. Wildcards are permitted.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |1       |true (ByValue, ByPropertyName)|

#### **Module**
Sets the debug mode for commands that came from the specified modules. Enter the names of modules, or pass in module objects.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|ModuleName|

#### **DebuggerHidden**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DebuggerStepThrough**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Inputs
String

---

### Outputs
* None

---

### Notes
The Get-/Set-CommandDebugMode commands are used to manage the debug mode settings on Windows PowerShell functions and filters. They have no effect on other types of 
commands.

When a command is in DebuggerHidden mode, the debugger will not step into that command. When a command is in DebuggerStepThrough mode, the debugger will step 
through that command into other commands that it invoked that are not hidden from the debugger, without stepping into the lines within that command.

To enable DebuggerHidden or DebuggerStepThrough on a function or script block, set the System.Diagnostics.DebuggerHidden or System.Diagnostics.DebuggerStepThrough 
attributes for that function or script block, respectively.

---

### Syntax
```PowerShell
Set-CommandDebugMode [[-Name] <String[]>] [[-Module] <String[]>] [-DebuggerHidden] [-DebuggerStepThrough] [-WhatIf] [-Confirm] [<CommonParameters>]
```
