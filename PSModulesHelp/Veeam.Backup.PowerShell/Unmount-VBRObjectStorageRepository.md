Unmount-VBRObjectStorageRepository
----------------------------------

### Synopsis
Unmounts object storage and archive repositories.

---

### Description

This cmdlet unmounts object storage and archive repositories.

---

### Related Links
* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

---

### Examples
> Unmounting Object Storage Repository

$repository = Get-VBRObjectStorageRepository -Name "Amazon OS"
Unmount-VBRObjectStorageRepository -Repository $repository -Force
This example shows how to unmount the Amazon OS object storage repository. The cmdlet will skip all notifications and warnings.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Unmount-VBRObjectStorageRepository cmdlet. Set the $repository variable as the Repository parameter value. Provide the Force parameter.

---

### Parameters
#### **ArchiveRepository**
Specifies an archive repository. The cmdlet will mount this archive repository.

|Type                                 |Required|Position|PipelineInput                 |
|-------------------------------------|--------|--------|------------------------------|
|`[VBRArchiveObjectStorageRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will unmount an object storage repository and will not show up any warnings or notifications.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Repository**
Specifies an object storage repository. The cmdlet will unmount this repository.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRObjectStorageRepository]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRObjectStorageRepository

Veeam.Backup.PowerShell.Infos.VBRArchiveObjectStorageRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Unmount-VBRObjectStorageRepository -ArchiveRepository <VBRArchiveObjectStorageRepository> [-Force] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Unmount-VBRObjectStorageRepository [-Force] -Repository <VBRObjectStorageRepository> [-Confirm] [-WhatIf] [<CommonParameters>]
```
