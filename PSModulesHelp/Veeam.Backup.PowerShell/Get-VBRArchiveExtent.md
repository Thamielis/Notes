Get-VBRArchiveExtent
--------------------

### Synopsis
Returns the archive extent.

---

### Description

This cmdlet returns the archive extent of scale-out backup repositories. The archive extent is an archive object storage repository that is added to the scale-out backup repository.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Getting Archive Extent

$repository = Get-VBRBackupRepository -ScaleOut
Get-VBRArchiveExtent -Repository $repository
This example shows how to get the archive extents added to the scale-out backup repositories.
Perform the following actions:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter. Save the result to the $repository variable.
2. Run the Get-VBRCArchiveExtent cmdlet. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Repository**
Specifies an array of scale-out backup repositories. The cmdlet will return the archive extent added to this repository.

|Type                             |Required|Position|PipelineInput                 |
|---------------------------------|--------|--------|------------------------------|
|`[VBRScaleOutBackupRepository[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepository[]

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRArchiveExtent

---

### Notes

---

### Syntax
```PowerShell
Get-VBRArchiveExtent -Repository <VBRScaleOutBackupRepository[]> [<CommonParameters>]
```
