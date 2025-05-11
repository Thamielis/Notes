Add-VBRArchiveBackupAvailabilityPeriod
--------------------------------------

### Synopsis
Extends the availability period of the backup files from the archive storage.

---

### Description

This cmdlet extends the availability of the backup files retrieved from the archive extent of the scale-out backup repository.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Retrieving Backup Files from Amazon S3 Glacier Archive Extent

$backup = Get-VBRBackup -Name "NEW_YEAR_JOB_2"
$rp = Get-VBRRestorePoint -Backup $backup | sort creation_time | select -First 1 
Add-VBRArchiveBackupAvailabilityPeriod -RestorePoint $rp[0] -AvailabilityPeriodDays 2
This example shows how to extend the availability of the backup files retrieved from the archive extent of the scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $rp variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the first restore point in the array).
3. Run the Add-VBRArchiveBackupAvailabilityPeriod cmdlet. Set the $rp variable as the RestorePoint parameter value. Specify the AvailabilityPeriodDays parameter value.

---

### Parameters
#### **AvailabilityPeriodDays**
Specifies a period (in days) during which the retrieved archive backup files will be available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|true    |named   |False        |

#### **RestorePoint**
Specifies the restore point for which you want to extend the availability.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRPublishedBackupSession

---

### Notes

---

### Syntax
```PowerShell
Add-VBRArchiveBackupAvailabilityPeriod -AvailabilityPeriodDays <UInt32> -RestorePoint <COib> [-RunAsync] [<CommonParameters>]
```
