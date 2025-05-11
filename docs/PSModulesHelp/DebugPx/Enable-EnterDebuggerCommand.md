Enable-EnterDebuggerCommand
---------------------------

### Synopsis
Enables the breakpoint command.

---

### Description

The Enable-EnterDebuggerCommand command enables the breakpoint command in your PowerShell environment.

---

### Related Links
* [Disable-EnterDebuggerCommand](Disable-EnterDebuggerCommand)

* [breakpoint](breakpoint)

---

### Examples
> BEISPIEL 1

```PowerShell
Enable-EnterDebuggerCommand
PS C:\> Get-Service w* | breakpoint {$_.Name -eq 'wuauserv'} | Select-Object -ExpandProperty Name

The first command enables the breakpoint command. When the next command is invoked, a breakpoint will be hit when the Windows Update service is passed down the pipeline.
```
> BEISPIEL 2

Enable-EnterDebuggerCommand
PS C:\> & {'Before breakpoint'; breakpoint; 'After breakpoint'}

The first command enables the breakpoint command. When the next command is invoked, the string "Before breakpoint" will be output to the console, and then the debugger will stop on the breakpoint command. "After breakpoint" will only be output to the console when the debugger is told to step or continue execution.

---

### Parameters
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
None

---

### Outputs
* None

---

### Notes
When the breakpoint command is enabled, invoking breakpoint, bp, or Enter-Debugger may result in a script that is running stopping on a breakpoint on that line. For 
more information, invoke Get-Help breakpoint.

---

### Syntax
```PowerShell
Enable-EnterDebuggerCommand [-WhatIf] [-Confirm] [<CommonParameters>]
```
