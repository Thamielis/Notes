Get-VBRRepositoryExtent
-----------------------

### Synopsis
Returns scale-out performance extents.

---

### Description

This cmdlet returns performance extents of scale-out backup repositories.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Getting Performance Extents of Scale-Out Backup Repository

```PowerShell
Get-VBRRepositoryExtent -Repository "Veeam Performance Scale-Out Repository"
This command returns performance extents of the Veeam Performance Scale-Out Repository. The scale-out repository is specified by name.
```
> Example 2. Getting Performance Extents of Scale-Out Backup Repository [Using Pipeline]

Get-VBRBackupRepository -Name "Veeam Performance Scale-Out Repository" -ScaleOut | Get-VBRRepositoryExtent
This example shows how to return performance extents of the Veeam Performance Scale-Out Repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value and provide the ScaleOut parameter.
2. Pipe the cmdlet output to the Get-VBRRepositoryExtent cmdlet.
> Example 3. Getting Performance Extents of Scale-Out Backup Repository [Using Variable]

$scaleoutrepository = Get-VBRBackupRepository -Name "Veeam Performance Scale-Out Repository" -ScaleOut
Get-VBRRepositoryExtent -Repository $scaleoutrepository
This command returns performance extents of the Veeam Performance Scale-Out Repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value and provide the ScaleOut parameter. Save the result to the $scaleoutrepository variable.
2. Run the Get-VBRRepositoryExtent cmdlet. Set the $scaleoutrepository variable as the Repository parameter value.

---

### Parameters
#### **Repository**
Specifies the scale-out backup repository. The cmdlet will return performance extents added to this repository.

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
Get-VBRRepositoryExtent -Repository <VBRScaleOutBackupRepository[]> [<CommonParameters>]
```
