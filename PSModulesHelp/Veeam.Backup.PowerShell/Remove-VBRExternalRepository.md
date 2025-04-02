Remove-VBRExternalRepository
----------------------------

### Synopsis
Removes external repositories from the backup infrastructure.
Note: If the four-eyes authorization is enabled, you cannot run this cmdlet. For more information, see the Four-Eyes Authorization section in the User Guide for VMware vSphere.

---

### Description

This cmdlet removes external repositories from the backup infrastructure. You can remove the following types of external repositories:
- Amazon S3 object storage.
- Microsoft Azure object storage.

---

### Related Links
* [Get-VBRExternalRepository](Get-VBRExternalRepository)

---

### Examples
> Removing External Repository

$repository = Get-VBRExternalRepository -Name "External repository"
Remove-VBRExternalRepository -ExternalRepository $repository
This example shows how to remove an external repository named External Repository from the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRExternalRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Remove-VBRExternalRepository cmdlet. Set the $repository variable as the ExternalRepository parameter value.

---

### Parameters
#### **ExternalRepository**
Specifies the external repository that you want to remove.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRExternalRepository]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRExternalRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRExternalRepository -ExternalRepository <VBRExternalRepository> [-Confirm] [-WhatIf] [<CommonParameters>]
```
