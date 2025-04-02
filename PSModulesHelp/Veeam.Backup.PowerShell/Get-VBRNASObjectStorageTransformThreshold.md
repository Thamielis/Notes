Get-VBRNASObjectStorageTransformThreshold
-----------------------------------------

### Synopsis
Returns the blob transformation threshold defined for an object storage repository that stores NAS backups.

---

### Description

This cmdlet returns the value of the blob transformation threshold for an object storage repository that stores NAS backups. As soon as the amount of the outdated data in a separate blob reaches the threshold specified for this object storage repository, such a blob undergoes the transformation operation. The threshold is specified as the percentage of the blob size.

---

### Related Links
* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

* [Set-VBRNASObjectStorageTransformThreshold](Set-VBRNASObjectStorageTransformThreshold)

---

### Examples
> Example - Getting Blob Transformation Threshold for Object Storage Repository with NAS Backups

$objectstorage = Get-VBRObjectStorageRepository -Name "S3 Storage 1"
Get-VBRNASObjectStorageTransformThreshold -Repository $objectstorage
This example shows how to get the blob transformation threshold defined for the S3 Storage 1 object storage repository.

Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $objectstorage variable.
2. Run the Get-VBRNASObjectStorageTransformThreshold cmdlet. Set the $objectstorage variable as the Repository parameter value.

---

### Parameters
#### **Repository**
Specifies an object storage. Veeam Backup & Replication will return the blob transformation threshold specified for this object storage repository. Accepts the VBRObjectStorageRepository object. To get this object, run the Get-VBRObjectStorageRepository cmdlet.

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[VBRObjectStorageRepository]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRObjectStorageRepository

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRNASObjectStorageTransformThreshold

---

### Notes

---

### Syntax
```PowerShell
Get-VBRNASObjectStorageTransformThreshold -Repository <VBRObjectStorageRepository> [<CommonParameters>]
```
