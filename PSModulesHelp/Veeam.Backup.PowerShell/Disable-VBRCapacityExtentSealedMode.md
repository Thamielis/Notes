Disable-VBRCapacityExtentSealedMode
-----------------------------------

### Synopsis
Disable Sealed mode for capacity extents.

---

### Description

This cmdlet disables Sealed mode for capacity extents of the scale-out backup repository.
Run the Enable-VBRCapacityExtentSealedMode cmdlet to enable the Sealed mode for capacity extents of the scale-out backup repository.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRCapacityExtent](Get-VBRCapacityExtent)

---

### Examples
> Disabling Sealed Mode for Capacity Extent

$repository = Get-VBRBackupRepository -ScaleOut
$extent = Get-VBRCapacityExtent
Disable-VBRRepositoryExtentSealedMode -Extent $extent
This example shows how to enable Sealed mode for the specified capacity extent of the scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter. Save the result to the $repository variable.
2. Run the Get-VBRCapacityExtent cmdlet. Save the result to the $extent variable.
3. Run the Disable-VBRCapacityExtentSealedMode cmdlet. Set the $extent variable as the CapacityExtent parameter value.

---

### Parameters
#### **CapacityExtent**
Specifies a capacity extents of scale-out backup repository. The cmdlet will disable Sealed mode for the specified capacity extent.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[VBRCapacityExtent[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCapacityExtent[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VBRCapacityExtentSealedMode -CapacityExtent <VBRCapacityExtent[]> [-RunAsync] [<CommonParameters>]
```
