Disable-VBRProtectionGroup
--------------------------

### Synopsis
Disables automatic discovery for the protection group computers.

---

### Description

This cmdlet disables automatic discovery for the computers of selected protection groups.
Run the Enable-VBRProtectionGroup cmdlet to enable automatic discovery.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Enable-VBRProtectionGroup](Enable-VBRProtectionGroup)

---

### Examples
> Disabling Automatic Discovery for Computers of Protection Group

$group = Get-VBRProtectionGroup -Name "East Computers"
Disable-VBRProtectionGroup -ProtectionGroup $group
This example shows how to disable automatic discovery for the computers of a protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Disable-VBRProtectionGroup cmdlet. Set the $group variable as the ProtectionGroup parameter value.

---

### Parameters
#### **ProtectionGroup**
Specifies the array of protection groups. The cmdlet will disable automatic discovery for the computers of these protection groups.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRProtectionGroup[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Disable-VBRProtectionGroup -ProtectionGroup <VBRProtectionGroup[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
