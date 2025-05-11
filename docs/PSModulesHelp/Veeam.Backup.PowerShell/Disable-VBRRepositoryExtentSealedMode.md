Disable-VBRRepositoryExtentSealedMode
-------------------------------------

### Synopsis
Disables Sealed mode for extents of a scale-out backup repository.

---

### Description

This cmdlet disables Sealed mode for extents of a scale-out backup repository.
Run the Enable-VBRRepositoryExtentSealedMode cmdlet to enable Sealed mode for extents of a scale-out backup repository.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRCapacityExtent](Get-VBRCapacityExtent)

---

### Examples
> Disabling Sealed Mode for Extents

$repository = Get-VBRBackupRepository -ScaleOut
$extent = Get-VBRCapacityExtent -Repository $repository
Disable-VBRRepositoryExtentSealedMode -Extent $extent
This example shows how to disable Sealed mode for capacity extents of a scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter value. Save the result to the $repository variable.
2. Run the Get-VBRCapacityExtent cmdlet. Set the $repository variable as the Repository parameter value. Save the result to the $extent variable.
3. Run the Disable-VBRRepositoryExtentSealedMode cmdlet. Set the $extent variable as the Extent parameter value.

---

### Parameters
#### **Extent**
Specifies an array of scale-out repository extents. The cmdlet will disable the Sealed mode for these extents.

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
Disable-VBRRepositoryExtentSealedMode -Extent <VBRRepositoryExtent[]> [-RunAsync] [<CommonParameters>]
```
