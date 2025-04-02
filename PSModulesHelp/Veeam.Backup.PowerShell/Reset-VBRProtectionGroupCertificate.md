Reset-VBRProtectionGroupCertificate
-----------------------------------

### Synopsis
Removes a certificate associated with a protection group with a flexible scope.

---

### Description

This cmdlet removes a certificate associated with a protection group with a flexible scope.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

---

### Examples
> Removing Certificate Associated with Specific Protection Groups

$protectiongroup = Get-VBRProtectionGroup -Name "LinuxPG, macOSPG"
Reset-VBRProtectionGroupCertificate -ProtectionGroup $protectiongroup
This example shows how to remove a certificate associated with the LinuxPG, macOSPG protection groups with a flexible scope.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $protectiongroup variable.
2. Run the Reset-VBRProtectionGroupCertificate cmdlet. Set the $protectiongroup variable as the ProtectionGroup parameter value.

---

### Parameters
#### **ProtectionGroup**
Specifies an array of protection groups for which you want to remove certificates.

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
Reset-VBRProtectionGroupCertificate -ProtectionGroup <VBRProtectionGroup[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
