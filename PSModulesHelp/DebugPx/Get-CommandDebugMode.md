Get-CommandDebugMode
--------------------

### Synopsis
Gets the current debug mode for a command.

---

### Description

The Get-CommandDebugMode command gets the current debug mode for a command. Debug modes include DebuggerHidden and DebuggerStepThrough.

---

### Related Links
* [Set-CommandDebugMode](Set-CommandDebugMode)

* [Get-Command](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Core/Get-Command)

---

### Examples
> BEISPIEL 1

```PowerShell
Get-CommandDebugMode
This command returns the current debug mode for all functions and filters that are available in PowerShell.
```
> BEISPIEL 2

```PowerShell
Get-CommandDebugMode -Module DebugPx
This command returns the current debug mode for all functions and filters that are exported by the DebugPx module.
```

---

### Parameters
#### **Name**
Gets the debug mode for commands with the specified name. Enter a name or name pattern. Wildcards are permitted.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |1       |true (ByValue, ByPropertyName)|

#### **Module**
Gets the debug mode for commands that came from the specified modules. Enter the names of modules, or pass in module objects.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|ModuleName|

---

### Inputs
String

---

### Outputs
* DebugPx.CommandDebugMode

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
Get-CommandDebugMode [[-Name] <String[]>] [[-Module] <String[]>] [<CommonParameters>]
```
