Enable-VBRRepositoryExtentMaintenanceMode
-----------------------------------------

### Synopsis
Enables Maintenance mode for a performance extent or capacity extent of a scale-out backup repository.

---

### Description

This cmdlet enables Maintenance mode for a selected performance extent or extents of scale-out backup repositories.
With one command, you can switch to Maintenance mode multiple performance extents: the extents can be of mixed policies and belong to several scale-out repositories.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRRepositoryExtent](Get-VBRRepositoryExtent)

---

### Examples
> Enabling Maintenance Mode for Performance Extents

$scaleoutrepository = Get-VBRBackupRepository -ScaleOut -Name "Amazon S3"
$extent = Get-VBRRepositoryExtent -Repository $scaleoutrepository
Enable-VBRRepositoryExtentMaintenanceMode -Extent $extent[2]
This example shows how to enable the Maintenance mode for the performance extents.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value and provide the ScaleOut parameter. Save the result to the $scaleoutrepository variable.
2. Run the Get-VBRRepositoryExtent cmdlet. Set the $scaleoutrepository variable as the Repository parameter value. Save the result to the $extent variable.
The Get-VBRRepositoryExtent cmdlet will return an array of extents. Mind the ordinal number of the necessary extent (in our example, it is the second extent in the array).
3. Run the Enable-VBRRepositoryExtentMaintenanceMode cmdlet. Set the $extent variable as the Extent parameter value.

---

### Parameters
#### **Extent**
Specifies the array of scale-out repository extents. The cmdlet will enable the Maintenance mode for these extents.
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
Enable-VBRRepositoryExtentMaintenanceMode -Extent <VBRRepositoryExtent[]> [-RunAsync] [<CommonParameters>]
```
