Set-VBRNASObjectStorageTransformThreshold
-----------------------------------------

### Synopsis
Modifies the blob transformation threshold for an object storage repository that stores NAS backups.

---

### Description

This cmdlet modifies the blob transformation threshold for an object storage repository that stores NAS backups. As soon as the amount of the outdated data in a separate blob reaches the threshold specified for this object storage repository, such a blob undergo the transformation operation. The threshold is specified as the percentage of the blob size.

---

### Related Links
* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

* [Get-VBRNASObjectStorageTransformThreshold](Get-VBRNASObjectStorageTransformThreshold)

---

### Examples
> Example 1. Setting Blob Transformation Threshold for Object Storage Repository to Default Value

$objectstorage = Get-VBRObjectStorageRepository -Name "S3 Storage 1"
Set-VBRNASObjectStorageTransformThreshold -Repository $objectstorage -Default
This example shows how to set the blob transformation threshold for the object storage repository to its default value.

Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $objectstorage variable.
2. Run the Set-VBRNASObjectStorageTransformThreshold cmdlet. Set the $objectstorage variable as the Repository parameter value. Specify the Default parameter.
> Example 2. Setting Blob Transformation Threshold for Object Storage Repository to Custom Value

$objectstorage = Get-VBRObjectStorageRepository -Name "S3 Storage 1"
Set-VBRNASObjectStorageTransformThreshold -Repository $objectstorage -Threshold "50"
This example shows how to set the blob transformation threshold for the object storage repository to a custom value.

Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $objectstorage variable.
2. Run the Set-VBRNASObjectStorageTransformThreshold cmdlet. Set the $objectstorage variable as the Repository parameter value. Specify the Threshold parameter value.

---

### Parameters
#### **Default**
Defines that the cmdlet will set the blob transformation threshold for the object storage repository to its default value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Repository**
Specifies an object storage. Veeam Backup & Replication will modify the blob transformation threshold for this object storage repository. Accepts the VBRObjectStorageRepository object. To get this object, run the Get-VBRObjectStorageRepository cmdlet.

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[VBRObjectStorageRepository]`|true    |named   |True (ByValue)|

#### **Threshold**
Specifies the threshold value that the cmdlet will set as the blob transformation threshold for the object storage repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRObjectStorageRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNASObjectStorageTransformThreshold -Default -Repository <VBRObjectStorageRepository> [<CommonParameters>]
```
```PowerShell
Set-VBRNASObjectStorageTransformThreshold -Repository <VBRObjectStorageRepository> -Threshold <Int32> [<CommonParameters>]
```
