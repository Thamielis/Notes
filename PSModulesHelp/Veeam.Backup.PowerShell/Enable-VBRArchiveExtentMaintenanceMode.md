Enable-VBRArchiveExtentMaintenanceMode
--------------------------------------

### Synopsis
Enables the Maintenance mode for the archive extent.

---

### Description

This cmdlet enables the Maintenance mode for the archive extent of the scale-out backup repository.
Run the Disable-VBRArchiveExtentMaintenanceMode cmdlet to disable the Maintenance mode.

---

### Related Links
* [Get-VBRArchiveExtent](Get-VBRArchiveExtent)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Enabling Maintenance Mode for Archive Extent

$scaleoutrepository = Get-VBRBackupRepository -ScaleOut -Name "Amazon S3"
$extent = Get-VBRArchiveExtent -Repository $scaleoutrepository
Enable-VBRArchiveExtentMaintenanceMode -ArchiveExtent $extent
This example shows how to set the Maintenance mode for the archive extent.
Perform the following actions:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter. Specify the Name parameter value. Save the result to the $scaleoutrepository variable.
2. Run the Get-VBRArchiveExtent cmdlet. Set the $scaleoutrepository variable as the Repository parameter value. Save the result to the $extent variable.
3. Run the Enable-VBRArchiveExtentMaintenanceMode cmdlet. Set the $extent variable as the ArchiveExtent parameter value.

---

### Parameters
#### **ArchiveExtent**
Specifies the archive extent. The cmdlet will set this extent to the Maintenance mode.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRArchiveExtent[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRArchiveExtent[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRArchiveExtentMaintenanceMode -ArchiveExtent <VBRArchiveExtent[]> [-RunAsync] [<CommonParameters>]
```
