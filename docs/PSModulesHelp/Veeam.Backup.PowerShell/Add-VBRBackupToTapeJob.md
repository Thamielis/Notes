Add-VBRBackupToTapeJob
----------------------

### Synopsis
Creates a backup to tape job or a GFS job.

---

### Description

This cmdlet creates a new backup to tape job or a GFS job. You can target the job to a simple or a GFS media pool.

NOTE

Consider the following:
- The cmdlet checks if the data of the VMs added to the job changes its geographic location.
- The cmdlet will not run if the geographic location of the repository where VM backups reside and the target media pool location do not match. If you still want to run the cmdlet, use the Force parameter.
- If you choose to archive data from backup repositories, the backup to tape job will process only the backups that were created with backup jobs configured on this Veeam backup server. Imported backups and configuration backups will be skipped from processing.

---

### Related Links
* [Get-VBRTapeMediaPool](Get-VBRTapeMediaPool)

* [New-VBRFullBackupToTapePolicy](New-VBRFullBackupToTapePolicy)

* [New-VBRBackupToTapeScheduleOptions](New-VBRBackupToTapeScheduleOptions)

* [Get-VBRJob](Get-VBRJob)

* [Get-VBREPJob](Get-VBREPJob)

* [New-VBRNotificationOptions](New-VBRNotificationOptions)

* [New-VBRJobScriptOptions](New-VBRJobScriptOptions)

* [New-VBRBackupToTapeScheduleOptions](New-VBRBackupToTapeScheduleOptions)

* [New-VBRTapeGFSScheduleOptions](New-VBRTapeGFSScheduleOptions)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRLocation](Get-VBRLocation)

---

### Examples
> Example Creating Backup to Tape Job with Backup Job as Source

$job = Get-VBRJob -Name "SQL 1 Backup"
$mediapool = Get-VBRTapeMediaPool -Name "SQL Backups Media Pool"
$dailyoptions = New-VBRDailyOptions -DayOfWeek Friday -Period 23:00
$scheduleoptions = New-VBRBackupToTapeScheduleOptions -DailyOptions $dailyoptions -Enabled
Add-VBRBackupToTapeJob -Name "SQL to Tape" -Description "SQL archive" -Object $job -FullBackupMediaPool $mediapool -ProcessIncrementalBackup -IncrementalBackupMediaPool $mediapool -ExportDays Monday -ScheduleOptions $scheduleoptions
This example shows how to create a backup to tape job for SQL 1 Backup source job. The tape job will use the same media pool to back up full and incremental backups.

Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value. Save the result to the $mediapool variable.
3. Run the New-VBRDailyOptions cmdlet. Set Friday as the DayOfWeek parameter value and 23:00 as the Period parameter value. Save the result to the $dailyoptions variable.
4. Run the New-VBRBackupToTapeScheduleOptions cmdlet. Set the $dailyoptions variable as the DailyOptions parameter value. Provide the Enabled parameter. Save the result to the $scheduleoptions variable.
5. Run the Add-VBRBackupToTapeJob cmdlet. Specify the following settings:
- Specify the Name and the Description parameter value.
- Set the $job variable as the Object parameter value.
- Set the $mediapool variable as the FullBackupMediaPool and IncrementalBackupMediaPool parameters value.
- Provide the ProcessIncrementalBackup parameter.
- Specify the ExportDays parameter value.
- Set the $scheduleoptions variable as the ScheduleOptions parameter value.

---

### Parameters
#### **AlwaysCopyFromLatestFull**
Defines that on each run the tape job must copy only the latest backup chain. Otherwise, on each run the tape job will copy all restore points produced by the source backup jobs that are available on disk.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **CopyFromLatestFull**
Defines that on the first run the tape job must copy only the latest backup chain. Otherwise,on the first run the job will copy all restore points produced by the source backup jobs that are available on disk.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Description**
Specifies the description of the backup to tape job. If not set, Veeam Backup & Replication will enter date and time of creation by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EjectCurrentMedium**
Defines that the tapes will be automatically ejected from drive after the job finishes. The ejected tape is moved to a standard library slot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableParallelDrivesUsage**
Enables parallel processing of media pools. Default: False

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExportCurrentMediaSet**
Defines that the tapes belonging to the media set will be automatically placed to Import/Export (Mail) slot for further export. Use the ExportDays parameter to set days on which you want to export tapes.
If you use this parameter, but do not set the ExportDays parameter, the tapes will be exported every day.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExportDays**
Used to set days for exporting tapes for the ExportCurrentMediaSet parameter. Specifies days on which the tapes written by this tape job will be automatically exported: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday.
Valid Values:

* Sunday
* Monday
* Tuesday
* Wednesday
* Thursday
* Friday
* Saturday

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[DayOfWeek[]]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will create a job even if the geographic location of the repositories where VM backups reside and the target media pool location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FullBackupMediaPool**
For non-GFS jobs. Specifies the media pool where you want to store full backups produced by this tape job. Accepts the VBRTapeMediaPool object, GUID or string.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRTapeMediaPool]`|true    |named   |False        |

#### **FullBackupPolicy**
Specifies virtual full settings. Accepts the VBRFullBackupToTapePolicy object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRFullBackupToTapePolicy]`|false   |named   |False        |

#### **GFSMediaPool**
For GFS jobs. Specifies the target GFS media pool. Accepts the VBRTapeGFSMediaPool object, GUID or string.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRTapeGFSMediaPool]`|true    |named   |False        |

#### **GFSScheduleOptions**
Specifies the schedule settings for the GFS media pool. Accepts the VBRTapeGFSScheduleOptions object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRTapeGFSScheduleOptions]`|false   |named   |False        |

#### **IncrementalBackupMediaPool**
For non-GFS jobs. Used to set media pool for the ProcessIncrementalBackup parameter. Specifies the media pool where you want to store incremental backups produced by this tape job. Accepts the VBRTapeMediaPool object, GUID or string.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRTapeMediaPool]`|false   |named   |False        |

#### **JobScriptOptions**
Specifies scripting options. Accepts the VBRJobScriptOptions object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRJobScriptOptions]`|false   |named   |False        |

#### **LimitTapeDrives**
Defines that the cmdlet will limit the number of drives to use for processing this tape job. Default: 2 drives.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the backup to tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **NotificationOptions**
Specifies the email notification options. Accepts the VBRNotificationOptions object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **Object**
Specifies the array of backup jobs or backup repositories that will be the source for this tape job. Accepts the CBackupJob, CBackupRepository, VBRComputerBackupJob, VBREPJob, VBRCloudTenant or VBRCloudTenantResourcey objects.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |False        |

#### **PreventInterruption**
Defines that, if the source job starts while the tape job is still running, the source job will be placed on hold instead of interrupting the tape job and resulting in incomplete tape backups. Using this option may result in source backup jobs starting significantly later than their scheduled start time, thus potentially missing recovery point objectives.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ProcessIncrementalBackup**
Defines that this tape job will archive incremental backups. Use the IncrementalBackupMediaPool to specify a separate media pool for storing incremental backups. If you do not set the IncrementalBackupMediaPool parameter, incremental backups will be stored to the media pool the you set for full backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies backup to tape job schedule. By default, the following settings are applied: - Enabled: false
* Type: Daily
* DailyOptions: Type: SelectedDays, Period: 18:00, DayOfWeek: Saturday
* MonthlyOptions: Period: 22:00, DayNumberInMonth: Fourth, DayOfWeek: Saturday, Months: January, February, March, April, May, June, July, August, September, October, November, December
* ScheduleOptions: From Sunday to Saturday, from 00:00 to 23:00, Enabled: true
* JobId: null

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRBackupToTapeScheduleOptions]`|false   |named   |False        |

#### **UseHardwareCompression**
Defines that tape library must perform hardware compression for archives. Do not use this option for archiving Veeam backups or other already compressed files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **WaitForBackupJob**
Defines that the tape job must wait for the source backup job to finish. Use the WaitPeriod parameter to set the time period.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **WaitPeriod**
Used to set time period for the WaitForBackupJob parameter.  Specifies the time period for which the tape job must wait for the source backup jobs to finish. Allowed values: 1-777 minutes. Accepts TimeSpan, int or string.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRBackupToTapeJob [-AlwaysCopyFromLatestFull] [-CopyFromLatestFull] [-Description <String>] [-EjectCurrentMedium] [-EnableParallelDrivesUsage] [-ExportCurrentMediaSet] [-ExportDays {Sunday | Monday | 
```
```PowerShell
Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Force] -FullBackupMediaPool <VBRTapeMediaPool> [-FullBackupPolicy <VBRFullBackupToTapePolicy>] [-IncrementalBackupMediaPool <VBRTapeMediaPool>] 
```
```PowerShell
[-JobScriptOptions <VBRJobScriptOptions>] [-LimitTapeDrives <Int32>] -Name <String> [-NotificationOptions <VBRNotificationOptions>] [-Object <Object[]>] [-PreventInterruption] [-ProcessIncrementalBackup] 
```
```PowerShell
[-ScheduleOptions <VBRBackupToTapeScheduleOptions>] [-UseHardwareCompression] [-WaitForBackupJob] [-WaitPeriod <TimeSpan>] [<CommonParameters>]
```
```PowerShell
Add-VBRBackupToTapeJob [-AlwaysCopyFromLatestFull] [-CopyFromLatestFull] [-Description <String>] [-EjectCurrentMedium] [-EnableParallelDrivesUsage] [-ExportCurrentMediaSet] [-ExportDays {Sunday | Monday | 
```
```PowerShell
Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Force] [-FullBackupPolicy <VBRFullBackupToTapePolicy>] -GFSMediaPool <VBRTapeGFSMediaPool> [-GFSScheduleOptions <VBRTapeGFSScheduleOptions>] 
```
```PowerShell
[-JobScriptOptions <VBRJobScriptOptions>] [-LimitTapeDrives <Int32>] -Name <String> [-NotificationOptions <VBRNotificationOptions>] [-Object <Object[]>] [-PreventInterruption] [-ProcessIncrementalBackup] 
```
```PowerShell
[-ScheduleOptions <VBRBackupToTapeScheduleOptions>] [-UseHardwareCompression] [-WaitForBackupJob] [-WaitPeriod <TimeSpan>] [<CommonParameters>]
```
