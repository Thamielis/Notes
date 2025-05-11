Remove-VBRArchiveObjectStorageRepository
----------------------------------------

### Synopsis
Removes archive repositories added to the backup infrastructure.
Note: If the four-eyes authorization is enabled, you cannot run this cmdlet. For more information, see the Four-Eyes Authorization section in the User Guide for VMware vSphere.

---

### Description

This cmdlet removes archive repositories added to the backup infrastructure. You can remove the following types of these backup repositories:
- Amazon S3 Glacier
- Azure Archive
- S3 compatible object storage with data archiving

---

### Related Links
* [Get-VBRArchiveObjectStorageRepository](Get-VBRArchiveObjectStorageRepository)

---

### Examples
> Removing All Archive Repositories from Backup Infrastructure

$repository = Get-VBRArchiveObjectStorageRepository
Remove-VBRArchiveObjectStorageRepository -Repository $repository
This example shows how to remove all archive repositories from Veeam Backup & Replication.
Perform the following steps:
1. Run the Get-VBRArchiveObjectStorageRepository cmdlet. Save the result to the $repository variable.
2. Run the Remove-VBRArchiveObjectStorageRepository cmdlet. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Repository**
Specifies an archive repository that you want to remove.

|Type                                   |Required|Position|PipelineInput |
|---------------------------------------|--------|--------|--------------|
|`[VBRArchiveObjectStorageRepository[]]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRArchiveObjectStorageRepository[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRArchiveObjectStorageRepository -Repository <VBRArchiveObjectStorageRepository[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
