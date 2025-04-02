Mount-VBRObjectStorageRepository
--------------------------------

### Synopsis
Mounts object storage and archive repositories.

---

### Description

This cmdlet mounts object storage and archive repositories. You can use the mounted object storage to import backups from these object storage.

---

### Related Links
* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

* [Get-VBREncryptionKey](Get-VBREncryptionKey)

---

### Examples
> Example 1. Mounting Object Storage Repository

$repository = Get-VBRObjectStorageRepository -Name "Amazon OS"
Mount-VBRObjectStorageRepository -Repository $repository
This example shows how to mount the Amazon OS object storage repository.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Mount-VBRObjectStorageRepository cmdlet. Set the $repository variable as the Repository parameter value.
> Example 2. Mounting Object Storage Repository with Encryption Key

$repository = Get-VBRObjectStorageRepository -Name "Amazon OS"
$key = Get-VBREncryptionKey -Description "Object Storage Key"
Mount-VBRObjectStorageRepository -Repository $repository -EncryptionKey $key
This example shows how to mount the Amazon OS object storage repository. The cmdlet will use the Object Storage Key encryption key to decrypt the data stored on the object storage repository.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter. Save the result to the $key variable.
3. Run the Mount-VBRObjectStorageRepository cmdlet. Set the $repository variable as the Repository parameter value. Set the $key variable as the EncryptionKey parameter value.

---

### Parameters
#### **ArchiveRepository**
Specifies an archive repository. The cmdlet will mount this archive repository.

|Type                                 |Required|Position|PipelineInput                 |
|-------------------------------------|--------|--------|------------------------------|
|`[VBRArchiveObjectStorageRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **EncryptionKey**
Specifies an encryption key. The cmdlet will use this key to decrypt data located on an object storage repository.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PSCryptoKey]`|false   |named   |False        |

#### **Repository**
Specifies an object storage repository. The cmdlet will mount this object storage.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRObjectStorageRepository]`|true    |named   |True (ByPropertyName, ByValue)|

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
Mount-VBRObjectStorageRepository -ArchiveRepository <VBRArchiveObjectStorageRepository> [-EncryptionKey <PSCryptoKey>] [<CommonParameters>]
```
```PowerShell
Mount-VBRObjectStorageRepository [-EncryptionKey <PSCryptoKey>] -Repository <VBRObjectStorageRepository> [<CommonParameters>]
```
