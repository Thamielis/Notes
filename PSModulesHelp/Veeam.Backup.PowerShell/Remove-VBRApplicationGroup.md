Remove-VBRApplicationGroup
--------------------------

### Synopsis
Removes application groups from the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet removes application groups from the Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRApplicationGroup](Get-VBRApplicationGroup)

---

### Examples
> Removing Application Groups

$group = Get-VBRApplicationGroup -Name "Exchange Application Group"
Remove-VBRApplicationGroup -ApplicationGroup $group
This example shows how to remove an application group from the Veeam Backup & Replication infrastructure.
Perform the following steps:
1. Run the Get-VBRApplicationGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Remove-VBRApplicationGroup cmdlet. Set the $group variable as the ApplicationGroup parameter value.

---

### Parameters
#### **ApplicationGroup**
Specifies an application group. The cmdlet will remove this application group the Veeam Backup & Replication infrastructure.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[VBRApplicationGroup]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRApplicationGroup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRApplicationGroup -ApplicationGroup <VBRApplicationGroup> [-Confirm] [-WhatIf] [<CommonParameters>]
```
