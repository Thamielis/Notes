Uninstall-VBRLicense
--------------------

### Synopsis
Removes a license from a backup server.

---

### Description

This cmdlet removes a license from a backup server.
NOTE: By default, details about both per-instance and per-socket objects are removed. To remove details about either per-instance or per-socket objects, you must specify the necessary parameter.

---

### Examples
> Removing License from Backup Server

```PowerShell
Uninstall-VBRLicense
This command removes a license from a backup server. The details about both per-instance and per-socket objects are removed.
```

---

### Parameters
#### **Instance**
Defines that the cmdlet will remove details about per-instance objects from the license scope.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Socket**
Defines that the cmdlet will remove details about per-socket objects from the license scope.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Uninstall-VBRLicense [-Instance] [-Socket] [-Confirm] [-WhatIf] [<CommonParameters>]
```
