Get-VBRCapacityExtent
---------------------

### Synopsis
Returns the capacity extents.

---

### Description

This cmdlet returns the capacity extent of scale-out backup repositories. The capacity extent is an object storage repository that is added to the scale-out backup repository and constitutes a capacity tier.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Getting Capacity Extents Added to Scale-Out Backup Repository

$repository = Get-VBRBackupRepository -ScaleOut
Get-VBRCapacityExtent -Repository $repository
This example shows how to get the capacity extents added to the scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter. Save the result to the $repository variable.
2. Run the Get-VBRCapacityExtent cmdlet. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Repository**
Specifies an array of scale-out backup repositories. The cmdlet will return the capacity extent added to this repository.

|Type                             |Required|Position|PipelineInput                 |
|---------------------------------|--------|--------|------------------------------|
|`[VBRScaleOutBackupRepository[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepository[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCapacityExtent -Repository <VBRScaleOutBackupRepository[]> [<CommonParameters>]
```
