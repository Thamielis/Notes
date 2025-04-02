Set-VBRSureBackupContentScanJob
-------------------------------

### Synopsis
Modifies settings of a SureBackup job that runs in the backup content scan verification mode.

---

### Description

This cmdlet modifies settings of a SureBackup job that runs in the backup content scan verification mode.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRSureBackupJob](Get-VBRSureBackupJob)

* [New-VBRDailyOptions](New-VBRDailyOptions)

* [New-VBRSureBackupJobScheduleOptions](New-VBRSureBackupJobScheduleOptions)

---

### Examples
> Example 1. Modifying Name and Description for Backup Content Scan SureBackup Job

$surejob = Get-VBRSureBackupJob -Name "Exchange Job"
Set-VBRSureBackupContentScanJob -Job $surejob -Name "New Exchange Job" -Description "Job for DNS"
This example shows how to modify name and description for the backup content scan SureBackup job named Exchange Job.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Specify the Name parameter value. Save the result to the $surejob variable.
2. Run the Set-VBRSureBackupContentScanJob cmdlet. Set the $surejob variable as the Job parameter value. Specify the Name parameter value. Specify the Description parameter value.
> Example 2. Modifying Schedule Settings for Backup Content Scan SureBackup Job

$surejob = Get-VBRSureBackupJob -Name "Exchange Job"
$daily = New-VBRDailyOptions -DayOfWeek "Friday" -Period "23:00"
$schedule = New-VBRSureBackupJobScheduleOptions -Type "Daily" -DailyOptions $daily
Set-VBRSureBackupContentScanJob -Job $surejob -ScheduleOptions $schedule
This example shows how to modify schedule settings for the backup content scan SureBackup job named Exchange Job.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Specify the Name parameter value. Save the result to the $surejob variable.
2. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek parameter and the Period parameter values. Save the result to the $daily variable.
3. Run the New-VBRSureBackupJobScheduleOptions cmdlet. Specify the Type parameter value. Set the $daily variable as the DailyOptions parameter value. Save the result to the $schedule variable.
4. Run the Set-VBRSureBackupContentScanJob cmdlet. Set the $surejob variable as the Job parameter value. Set the $schedule variable as the ScheduleOptions parameter value.

---

### Parameters
#### **Description**
Specifies a description for a SureBackup job. The cmdlet will create a SureBackup job with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableSchedule**
Defines that Veeam Backup & Replication will run the job according to schedule.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will not show any warnings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies a SureBackup job. The cmdlet will modify settings of this job.

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRSureBackupContentScanJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **LinkedJob**
Specifies a backup or replication job. The cmdlet will verify VMs that are added to this job with the SureBackup job.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRSureBackupLinkedJob[]]`|false   |named   |False        |

#### **MaxConcurrentVMs**
Specifies the maximum number of VMs that can be started at the same time.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Name**
Specifies a name for a SureBackup job. The cmdlet will create a SureBackup job with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ProcessRandomMachines**
Defines that the cmdlet will randomly test the specified number of machines from the linked job.
Use the RandomMachinesMaxCount parameter to specify the number of machines to randomly test.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RandomMachinesMaxCount**
Specifies the number of machines to randomly test during each run. The cmdlet will randomly test the specified number of machines from the linked job.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies schedule settings of a SureBackup job. Veeam Backup & Replication will run the job according to these settings.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRSureBackupJobScheduleOptions]`|false   |named   |False        |

#### **VerificationOptions**
Specifies verification settings for a SureBackup job.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRSureBackupJobVerificationOptions]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSureBackupContentScanJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSureBackupContentScanJob [-Description <String>] [-EnableSchedule] [-Force] -Job <VBRSureBackupContentScanJob> [-LinkedJob <VBRSureBackupLinkedJob[]>] [-MaxConcurrentVMs <Int32>] [-Name <String>] 
```
```PowerShell
[-ProcessRandomMachines] [-RandomMachinesMaxCount <Int32>] [-ScheduleOptions <VBRSureBackupJobScheduleOptions>] [-VerificationOptions <VBRSureBackupJobVerificationOptions>] [<CommonParameters>]
```
