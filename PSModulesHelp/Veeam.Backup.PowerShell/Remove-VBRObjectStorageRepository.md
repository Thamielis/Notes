Remove-VBRObjectStorageRepository
---------------------------------

### Synopsis
Removes object storage added as backup repository to Veeam Backup & Replication.
Note: If the four-eyes authorization is enabled, you cannot run this cmdlet. For more information, see the Four-Eyes Authorization section in the User Guide for VMware vSphere.

---

### Description

This cmdlet removes object storage added as backup repositories to Veeam Backup & Replication. You can remove types the following types of these backup repositories:
- Amazon S3
- Amazon S3 Compatible
- Azure Blob
You will not be able to connect to object storage after removing them from Veeam Backup & Replication.

---

### Related Links
* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

---

### Examples
> Removing All S3 Compatible Object Storage Added as Backup Repositories

$repository = Get-VBRObjectStorageRepository -Type AmazonS3Compatible
Remove-VBRObjectStorageRepository -Repository $repository
This example shows how to remove all S3 compatible object storage added as backup repositories from Veeam Backup & Replication.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Set the AmazonS3Compatible option for the Type parameter. Save the result to the $repository variable.
2. Run the Remove-VBRObjectStorageRepository cmdlet. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Repository**
Specifies a backup repository that you want to remove.

|Type                            |Required|Position|PipelineInput |
|--------------------------------|--------|--------|--------------|
|`[VBRObjectStorageRepository[]]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRObjectStorageRepository[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRObjectStorageRepository -Repository <VBRObjectStorageRepository[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
