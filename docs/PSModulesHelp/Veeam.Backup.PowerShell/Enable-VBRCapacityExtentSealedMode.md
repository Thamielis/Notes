Enable-VBRCapacityExtentSealedMode
----------------------------------

### Synopsis
Enables Sealed mode for capacity extents.

---

### Description

This cmdlet enables Sealed mode for capacity extents.
Run the Disable-VBRCapacityExtentSealedMode cmdlet to disable the Sealed mode for capacity extent of the scale-out backup repository.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRCapacityExtent](Get-VBRCapacityExtent)

---

### Examples
> Enabling Sealed Mode for Capacity Extent

$repository = Get-VBRBackupRepository -ScaleOut
$extent = Get-VBRCapacityExtent
Enable-VBRCapacityExtentSealedMode -CapacityExtent $extent
This example shows how to enable Sealed mode for the specified capacity extent of the scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter. Save the result to the $repository variable.
2. Run the Get-VBRCapacityExtent cmdlet. Save the result to the $extent variable.
3. Run the Enable-VBRCapacityExtentSealedMode cmdlet. Set the $extent variable as the CapacityExtent parameter value.

---

### Parameters
#### **CapacityExtent**
Specifies a capacity extent of scale-out backup repositories. The cmdlet will enable Sealed mode for the specified capacity extent.

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
Enable-VBRCapacityExtentSealedMode -CapacityExtent <VBRCapacityExtent[]> [-RunAsync] [<CommonParameters>]
```
