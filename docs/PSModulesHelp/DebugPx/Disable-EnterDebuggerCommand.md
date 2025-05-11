Disable-EnterDebuggerCommand
----------------------------

### Synopsis
Disables the breakpoint command.

---

### Description

The Disable-EnterDebuggerCommand command disables the breakpoint command in your PowerShell environment.

---

### Related Links
* [Enable-EnterDebuggerCommand](Enable-EnterDebuggerCommand)

* [breakpoint](breakpoint)

---

### Examples
> BEISPIEL 1

```PowerShell
Disable-EnterDebuggerCommand
PS C:\> Get-Service w* | breakpoint {$_.Name -eq 'wuauserv'} | Select-Object -ExpandProperty Name

The first command disables the breakpoint command. When the next command is invoked, the services are output in the console and the breakpoint is skipped entirely.
```
> BEISPIEL 2

Disable-EnterDebuggerCommand
PS C:\> & {'Before breakpoint'; breakpoint; 'After breakpoint'}

The first command disables the breakpoint command. When the next command is invoked, the string "Before breakpoint" will be output to the console, and then the string "After breakpoint" will be output to the console. The breakpoint command does nothing in this scenario.

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
Disable-EnterDebuggerCommand [-WhatIf] [-Confirm] [<CommonParameters>]
```
