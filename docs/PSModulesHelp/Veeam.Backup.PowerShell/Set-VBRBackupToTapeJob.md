Set-VBRBackupToTapeJob
----------------------

### Synopsis
Modifies backup to tape job or a GFS job.

---

### Description

This cmdlet modifies a selected backup to tape job or a GFS job.

To modify settings, specify new values for the necessary parameters. The parameters that you omit will remain unchanged.

NOTE: The cmdlet will not run if the geographical location of the repository where VM backups reside and the target media pool location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBREPJob](Get-VBREPJob)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRTapeMediaPool](Get-VBRTapeMediaPool)

* [New-VBRFullBackupToTapePolicy](New-VBRFullBackupToTapePolicy)

* [New-VBRBackupToTapeScheduleOptions](New-VBRBackupToTapeScheduleOptions)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRNotificationOptions](New-VBRNotificationOptions)

* [New-VBRJobScriptOptions](New-VBRJobScriptOptions)

* [Get-VBRLocation](Get-VBRLocation)

---

### Examples
> Example - Changing Media Pool for Backup to Tape Job  [Using Pipeline]

$newpool = Get-VBRTapeMediaPool -Name "Incremental Backups"
Get-VBRTapeJob -Name "Daily WebApp Backup" | Set-VBRBackupToTapeJob -IncrementalBackupMediaPool $newpool
This example shows how to set a new media pool for the incremental backups.

Perform the following steps:
1. Run the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value. Save the result to the $newpool variable.
2. Run the Get-VBRTapeJob cmdlet. Specify the Name parameter value. Pipe the cmdlet output to the Set-VBRBackupToTapeJob cmdlet. Set the $newpool variable as the IncrementalBackupMediaPool parameter value.

---

### Parameters
#### **AlwaysCopyFromLatestFull**
Defines that on each run the tape job must copy only the latest backup chain. Otherwise, on each run the tape job will copy all restore points produced by the source backup jobs that are available on disk.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Description**
Specifies the description of the backup to tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EjectCurrentMedium**
Defines that the tapes will be automatically ejected from drive after the job finishes. The ejected tape is moved to a standard library slot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableParallelDrivesUsage**
Enables parallel processing of media pools. Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExportCurrentMediaSet**
Defines that the tapes belonging to the media set will be automatically placed to Import/Export (Mail) slot for further export. Use the ExportDays parameter to set days on which you want to export tapes. If you use this parameter, but do not set the ExportDays parameter, the tapes will be exported every day.

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
Specifies the media pool where you want to store full backups produced by this tape job. Accepts the VBRTapeMediaPool object, GUID or string. To get this object, run the Get-VBRTapeMediaPool cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRTapeMediaPool]`|false   |named   |False        |

#### **FullBackupPolicy**
Specifies virtualized synthetic full backup for tape settings. Accepts the VBRFullBackupToTapePolicy object. To create this object, run the New-VBRFullBackupToTapePolicy cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRFullBackupToTapePolicy]`|false   |named   |False        |

#### **GFSMediaPool**
Specifies the target GFS media pool. Accepts the VBRTapeGFSMediaPool object, GUID or string. To get this object, run the Get-VBRTapeMediaPool cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRTapeGFSMediaPool]`|false   |named   |False        |

#### **GFSScheduleOptions**
Specifies the schedule settings for the GFS media pool. Accepts the VBRTapeGFSScheduleOptions object. To create this object, run the New-VBRTapeGFSScheduleOptions cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRTapeGFSScheduleOptions]`|false   |named   |False        |

#### **IncrementalBackupMediaPool**
Used to set media pool for the ProcessIncrementalBackup parameter. Specifies the media pool where you want to store incremental backups produced by this tape job. Accepts the VBRTapeMediaPool object, GUID or string. To get this object, run the Get-VBRTapeMediaPool cmdlet.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRTapeMediaPoolBase]`|false   |named   |False        |

#### **Job**
Specifies the backup to tape job to which you want to apply new settings. Accepts the VBRBackupToTapeJob or TapeJob object, GUID or string. To get this object, run the Get-VBRTapeJob cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRBackupToTapeJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **JobScriptOptions**
Specifies scripting options. Accepts the VBRJobScriptOptions object. To create this object, run the New-VBRJobScriptOptions cmdlet.

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
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies the email notification options. Accepts the VBRNotificationOptions object. To create this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **Object**
Specifies the array of backup to tape job sources. Tape job sources are backup jobs or backup repositories. Accepts the CBackupJob, VBRCloudTenant, VBREPJob or CBackupRepository objects.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PreventInterruption**
Defines that, if the source job starts while the tape job is still running, the source job will be placed on hold instead of interrupting the tape job and resulting in incomplete tape backups. Using this option may result in source backup jobs starting significantly later than their scheduled start time, thus potentially missing recovery point objectives.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ProcessIncrementalBackup**
Defines that this tape job will archive incremental backups. Use the IncrementalBackupMediaPool parameter to specify a separate media pool for storing incremental backups. If you do not set the IncrementalBackupMediaPool parameter, incremental backups will be stored to the media pool the you set for full backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies backup to tape job schedule. Accepts the VBRBackupToTapeScheduleOptions object. By default, the following settings are applied:
* Enabled: False
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
Used to set time period for the WaitForBackupJob parameter.  Specifies the time period for which the tape job must wait for the source backup jobs to finish. Can be set to 1-777 minutes. Accepts TipeSpan, integer or string.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRBackupToTapeJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRBackupToTapeJob [-AlwaysCopyFromLatestFull] [-Description <String>] [-EjectCurrentMedium] [-EnableParallelDrivesUsage] [-ExportCurrentMediaSet] [-ExportDays {Sunday | Monday | Tuesday | Wednesday | 
```
```PowerShell
Thursday | Friday | Saturday}] [-Force] [-FullBackupMediaPool <VBRTapeMediaPool>] [-FullBackupPolicy <VBRFullBackupToTapePolicy>] [-IncrementalBackupMediaPool <VBRTapeMediaPoolBase>] -Job <VBRBackupToTapeJob> 
```
```PowerShell
[-JobScriptOptions <VBRJobScriptOptions>] [-LimitTapeDrives <Int32>] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-Object <Object[]>] [-PassThru] [-PreventInterruption] 
```
```PowerShell
[-ProcessIncrementalBackup] [-ScheduleOptions <VBRBackupToTapeScheduleOptions>] [-UseHardwareCompression] [-WaitForBackupJob] [-WaitPeriod <TimeSpan>] [<CommonParameters>]
```
```PowerShell
Set-VBRBackupToTapeJob [-AlwaysCopyFromLatestFull] [-Description <String>] [-EjectCurrentMedium] [-EnableParallelDrivesUsage] [-ExportCurrentMediaSet] [-ExportDays {Sunday | Monday | Tuesday | Wednesday | 
```
```PowerShell
Thursday | Friday | Saturday}] [-Force] [-FullBackupPolicy <VBRFullBackupToTapePolicy>] [-GFSMediaPool <VBRTapeGFSMediaPool>] [-GFSScheduleOptions <VBRTapeGFSScheduleOptions>] -Job <VBRBackupToTapeJob> 
```
```PowerShell
[-JobScriptOptions <VBRJobScriptOptions>] [-LimitTapeDrives <Int32>] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-Object <Object[]>] [-PassThru] [-PreventInterruption] 
```
```PowerShell
[-ProcessIncrementalBackup] [-ScheduleOptions <VBRBackupToTapeScheduleOptions>] [-UseHardwareCompression] [-WaitForBackupJob] [-WaitPeriod <TimeSpan>] [<CommonParameters>]
```
