Disable-VBRRepositoryExtentMaintenanceMode
------------------------------------------

### Synopsis
Disables Maintenance mode for extents of a scale-out backup repository.

---

### Description

This cmdlet disables Maintenance mode for a selected extent or several extents of scale-out backup repositories. You can disable the Maintenance mode that was enabled with the Enable-VBRRepositoryExtentMaintenanceMode cmdlet. When you disable the Maintenance mode, the extents return to normal operation.
With one command, you can disable the Maintenance mode for multiple extents.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRrepositoryExtent](Get-VBRrepositoryExtent)

---

### Examples
> Disabling Maintenance Mode for Performance Extents

$scaleoutrepository = Get-VBRBackupRepository -ScaleOut -Name "Amazon S3"
$extent = Get-VBRrepositoryExtent -Repository $scaleoutrepository
Disable-VBRRepositoryExtentMaintenanceMode -Extent $extent[2]
This example shows how to disable the Maintenance mode for the performance extents.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value and provide the ScaleOut parameter. Save the result to the $scaleoutrepository variable.
2. Run the Get-VBRrepositoryExtent cmdlet. Set the $scaleoutrepository as the Repository parameter value. Save the result to the $extent variable.
The Get-VBRrepositoryExtent cmdlet will return an array of extents. Mind the ordinal number of the necessary extent (in our example, it is the second extent in the array).
3. Run the Disable-VBRRepositoryExtentMaintenanceMode cmdlet. Set the $extent variable as the Extent parameter value.

---

### Parameters
#### **Extent**
Specifies the array of scale-out repository extents. The cmdlet will disable the Maintenance mode for these extents.
Accepts extents with different policies and of different scale-out repositories.

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
Disable-VBRRepositoryExtentMaintenanceMode -Extent <VBRRepositoryExtent[]> [-RunAsync] [<CommonParameters>]
```
