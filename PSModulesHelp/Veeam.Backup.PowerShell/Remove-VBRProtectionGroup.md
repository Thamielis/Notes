Remove-VBRProtectionGroup
-------------------------

### Synopsis
Removes protection groups.

---

### Description

This cmdlet removes selected protection groups from the Veeam Backup & Replication database. When you remove a protection group, Veeam Backup & Replication removes Veeam Agent and Veeam Plug-in from all computers of this group. You cannot undo this operation. Backups created for protected computers remain in backup repositories.
NOTE:
- You cannot remove a protection group if the entire protection group or a separate computer included in this protection group is added to a Veeam Agent backup job.
- You cannot remove default protection groups, such as Manually Added, Unmanaged, and so on.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

---

### Examples
> Example 1. Removing Protection Group

$group = Get-VBRProtectionGroup -Name "Support_East"
Remove-VBRProtectionGroup -ProtectionGroup $groups
This example shows how to remove a protection group from Veeam Backup & Replication.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Remove-VBRProtectionGroup cmdlet. Set the $group variable as the ProtectionGroup parameter value.
> Example 2. Removing All Protection Groups by Name

$groups = Get-VBRProtectionGroup -Name *Support*
Remove-VBRProtectionGroup -ProtectionGroup $groups
This example shows how to remove all protection groups with names containing Support.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $groups variable.
2. Run the Remove-VBRProtectionGroup cmdlet. Set the $groups variable as the ProtectionGroup parameter value.

---

### Parameters
#### **ProtectionGroup**
Specifies an array of protection groups. The cmdlet will remove these protection groups from Veeam Backup & Replication.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRProtectionGroup[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **UninstallEverything**
Defines that the cmdlet will remove an array of protection groups from the configuration database. Additionally, the cmdlet will uninstall the following entities from every computer in the deleted protection group:
* Veeam Agent
* Veeam Installer Service
* Veeam Plug-in

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
Veeam.Backup.PowerShell.Infos.VBRProtectionGroup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRProtectionGroup -ProtectionGroup <VBRProtectionGroup[]> [-UninstallEverything] [-Confirm] [-WhatIf] [<CommonParameters>]
```
