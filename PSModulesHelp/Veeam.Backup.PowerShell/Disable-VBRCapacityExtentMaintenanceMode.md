Disable-VBRCapacityExtentMaintenanceMode
----------------------------------------

### Synopsis
Disables the Maintenance mode for capacity extents.

---

### Description

This cmdlet disables the Maintenance mode for capacity extents of the scale-out backup repository.
Run the Enable-VBRCapacityExtentMaintenanceMode cmdlet to enable the Maintenance mode.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRCapacityExtent](Get-VBRCapacityExtent)

---

### Examples
> Disabling Maintenance Mode for Capacity Extent

$scaleoutrepository = Get-VBRBackupRepository -ScaleOut -Name "Amazon S3"
$extent = Get-VBRCapacityExtent -Repository $scaleoutrepository
Disable-VBRCapacityExtentMaintenanceMode -CapacityExtent $extent
This example shows how to disable the Maintenance mode for the capacity extent.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value and provide ScaleOut parameter. Save the result to the $scaleoutrepository variable.
2. Run the Get-VBRCapacityExtent cmdlet. Set the $scaleoutrepository variable as Repository parameter value. Save the result to the $extent variable.
3. Run the Disable-VBRCapacityExtentMaintenanceMode cmdlet. Set the $extent variable as the CapacityExtent parameter value.

---

### Parameters
#### **CapacityExtent**
Specifies the capacity extent. The cmdlet will disable the Maintenance mode for this extent.

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
Disable-VBRCapacityExtentMaintenanceMode -CapacityExtent <VBRCapacityExtent[]> [-RunAsync] [<CommonParameters>]
```
