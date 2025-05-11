Send-VBRScaleOutBackupRepositoryReport
--------------------------------------

### Synopsis
Sends reports on processing results of scale-out backup repositories.

---

### Description

This cmdlet sends reports that contain information on processing results of scale-out backup repositories.
For more information on reports for scale-out backup repositories, see the Receiving Scale-Out Backup Repository Reports section of User Guide for VMware vSphere.
IMPORTANT!
Before running this cmdlet, you must configure global email notification settings. For more information on setting global email notification settings, see the Configuring Global Email Notification Settings section of the User Guide for VMware vSphere.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Sending Report on Scale-Out Repository Processing Results

$scaleoutrepository = Get-VBRBackupRepository -ScaleOut -Name "Amazon S3"
Send-VBRScaleOutBackupRepositoryReport -Repository $scaleoutrepository
This example shows how to send a report on processing results of a scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter. Specify the Name parameter value. Save the result to the $scaleoutrepository variable.
2. Run the Send-VBRScaleOutBackupRepositoryReport cmdlet. Set the $scaleoutrepository variable as the Repository parameter value.

---

### Parameters
#### **Repository**
Specifies a scale-out backup repository. The cmdlet will send a report on processing results of this scale-out backup repository.

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRScaleOutBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Send-VBRScaleOutBackupRepositoryReport -Repository <VBRScaleOutBackupRepository> [<CommonParameters>]
```
