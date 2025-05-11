Enable-VBRRepositoryExtentSealedMode
------------------------------------

### Synopsis
Enables Sealed mode for extents of a scale-out backup repository.

---

### Description

This cmdlet enables Sealed mode for extents of a scale-out backup repository.
Run the Disable-VBRRepositoryExtentSealedMode cmdlet to disable Sealed mode for extents of a scale-out backup repository.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRCapacityExtent](Get-VBRCapacityExtent)

---

### Examples
> Enabling Sealed Mode for Capacity Extents

$repository = Get-VBRBackupRepository -ScaleOut
$extent = Get-VBRCapacityExtent -Repository $repository
Enable-VBRRepositoryExtentSealedMode -Extent $extent
This example shows how to enable Sealed mode for capacity extents of a scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter value. Save the result to the $repository variable.
2. Run the Get-VBRCapacityExtent cmdlet. Set the Repository variable as the Repository parameter value. Save the result to the $extent variable.
3. Run the Enable-VBRRepositoryExtentSealedMode cmdlet. Set the $extent variable as the Extent parameter value.

---

### Parameters
#### **Extent**
Specifies an array of scale-out repository extents. The cmdlet will enable the Sealed mode for these extents.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRRepositoryExtent[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRRepositoryExtent[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRRepositoryExtentSealedMode -Extent <VBRRepositoryExtent[]> [-RunAsync] [<CommonParameters>]
```
