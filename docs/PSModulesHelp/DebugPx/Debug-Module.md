Debug-Module
------------

### Synopsis
Enters the debugger from inside of a script module scope.

---

### Description

The Debug-Module command enters the debugger inside of a script module scope, enabling interactive inspection of a module state from within that module. Entering the debugger this way allows you to check the state of a module, including internal variables and their current values, and internal commands loaded into the module scope.

Debug-Module will also temporarily change the current file system location to the base folder for the script module being debugged. This facilitates faster inspection and modification of files on disk using the command-line.

If the module is not loaded already when Debug-Module is invoked, Debug-Module will load the module automatically.

---

### Related Links
* [Enter-Debugger](Enter-Debugger)

* [Get-Module](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Core/Get-Module)

* [Import-Module](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Core/Import-Module)

* [Set-Location](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Management/Set-Location)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Debug-Module -Name DebugPx
This command sets the current location to the base folder for the DebugPx module and enters the debugger from inside of the DebugPx script module scope.
```
> EXAMPLE 2

[DBG]: PS C:\>> Get-Variable -Scope 0 | Where-Object {-not ($_.Options -band [System.Management.Automation.ScopedItemOptions]::AllScope)}
Once you are in debugger inside of a module, this command allows you to retrieve all variables that are defined in the script scope (at the root) of that module.

---

### Parameters
#### **Name**
The name of the script module where PowerShell will enter the debugger.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |0       |false        |ModuleName|

---

### Inputs
System.String

---

### Outputs
* None

---

### Notes
Debug-Module will not work when the module root scope has either of the System.Diagnostics.DebuggerHidden or System.Diagnostics.DebuggerStepThrough attributes.

---

### Syntax
```PowerShell
Debug-Module [-Name] <String> [<CommonParameters>]
```
