Restart-PSMDShell
-----------------

### Synopsis
A swift way to restart the PowerShell console.

---

### Description

A swift way to restart the PowerShell console.
- Allows increasing elevation
- Allows keeping the current process, thus in effect adding a new PowerShell process

---

### Examples
> EXAMPLE 1

```PowerShell
Restart-PSMDShell
Restarts the current PowerShell process.
```
> EXAMPLE 2

```PowerShell
Restart-PSMDShell -Admin -NoExit
Creates a new PowerShell process, run with elevation, while keeping the current console around.
```

---

### Parameters
#### **NoExit**
The current console will not terminate.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Admin**
The new PowerShell process will be run as admin.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoProfile**
The new PowerShell process will not load its profile.

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

### Syntax
```PowerShell
Restart-PSMDShell [-NoExit] [-Admin] [-NoProfile] [-WhatIf] [-Confirm] [<CommonParameters>]
```
