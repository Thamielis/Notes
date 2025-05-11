Set-VBRFileToTapeJob
--------------------

### Synopsis
Modifies a file to tape job.

---

### Description

This cmdlet modifies a selected file to tape job that was created before. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRTapeJob](Get-VBRTapeJob)

* [Get-VBRTapeMediaPool](Get-VBRTapeMediaPool)

* [New-VBRFileToTapeBackupPolicy](New-VBRFileToTapeBackupPolicy)

* [New-VBRFileToTapeObject](New-VBRFileToTapeObject)

---

### Examples
> Example - Changing Media Pool for File to Tape Job [Using Pipeline]

$newpool = Get-VBRTapeMediaPool -Name "File Backups"
Get-VBRTapeJob -Name "File Backup to Tape" | Set-VBRFileToTapeJob -FullBackupMediaPool $newpool
This example shows how to set a new media pool for the full backups for the File Backup to Tape job.

Perform the following steps:
1. Run the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value. Save it to the $newpool variable.
2. Run the Get-VBRTapeJob cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Set-VBRFileToTapeJob cmdlet. Set the $newpool variable as the FullBackupMediaPool parameter value.

---

### Parameters
#### **Description**
Specifies the new description you want to assign to the tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EjectCurrentMedium**
Defines that the tapes will be automatically ejected from drive after the job finishes. The ejected tape is moved to a standard library slot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableFileAclChangeTracking**
Enables backup of permissions and attributes for files. Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableParallelDrivesUsage**
Enables parallel processing of media pools. Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExportCurrentMediaSet**
Defines that the tapes belonging to the media set will be automatically placed to Import/Export (Mail) slot for further export.  Use the ExportDays parameter to set days on which you want to export tapes. If you do not set the ExportDays parameter, the tapes will be exported every day.

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
Defines that the cmdlet will update a job even if the geographic location of the repositories where VM backups reside and the target media pool location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FullBackupMediaPool**
Specifies the media pool where you want to store full backups produced by this tape job. Accepts the VBRTapeMediaPool object, GUID or string. To get this object, run the Get-VBRTapeMediaPool cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRTapeMediaPool]`|false   |named   |False        |

#### **FullBackupPolicy**
Specifies virtualized synthetic full backup for tape settings. Accepts the VBRFileToTapeBackupPolicy object. By default, the following settings are applied:
* Type: Daily
* DailyOptions: Type: SelectedDays, Period: 18:00, DayOfWeek: Saturday
* MonthlyOptions: Period: 22:00, DayNumberInMonth: Fourth, DayOfWeek: Saturday, Months: January, February, March, April, May, June, July, August, September, October, November, December
* Enabled: false

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRFileToTapeBackupPolicy]`|false   |named   |False        |

#### **IncrementalBackupMediaPool**
Used to set media pool for the ProcessIncrementalBackup parameter. Specifies the media pool where you want to store incremental backups produced by this tape job. If you do not specify a media pool, incremental backups will be stored to the media pool the you set for full backups. Accepts the VBRTapeMediaPool object, GUID or string. To get this object, run the Get-VBRTapeMediaPool cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRTapeMediaPool]`|false   |named   |False        |

#### **IncrementalBackupPolicy**
Specifies incremental backup settings. Accepts the VBRFileToTapeBackupPolicy object. By default, the following settings are applied:
* Type: Daily
* DailyOptions: Type: SelectedDays, Period: 18:00, DayOfWeek: Saturday
* MonthlyOptions: Period: 22:00, DayNumberInMonth: Fourth, DayOfWeek: Saturday, Months: January, February, March, April, May, June, July, August, September, October, November, December
* Enabled: false

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRFileToTapeBackupPolicy]`|false   |named   |False        |

#### **Job**
Specifies the file to tape job to which you want to apply new settings. Accepts the VBRFileToTapeJob or TapeJob object, GUID or string.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRFileToTapeJob]`|true    |named   |True (ByPropertyName, ByValue)|

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
Specifies the new name you want to assign to the tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NdmpObject**
Specifies an array of NDMP server volumes. Accepts the VBRNDMPVolume[] object. Run the Get-VBRNDMPVolume cmdlet to get this object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRNDMPVolume[]]`|false   |named   |False        |

#### **NotificationOptions**
Specifies the email notification options. Accepts the VBRNotificationOptions object. To create this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **Object**
Specifies the array of file to tape job sources.  Accepts the VBRFileToTapeObject[] object.  To get this object, run the Get-VBRTapeJob cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRFileToTapeObject[]]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UseHardwareCompression**
Defines that tape library must perform hardware compression for archives. Do not use this option for archiving Veeam backups or other already compressed files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UseVSS**
Defines that the VSS (Microsoft Volume Shadow Copy) must be used. Default: true. To disable this option, set the parameter value to $false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRFileToTapeJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRFileToTapeJob [-Description <String>] [-EjectCurrentMedium] [-EnableFileAclChangeTracking] [-EnableParallelDrivesUsage] [-ExportCurrentMediaSet] [-ExportDays {Sunday | Monday | Tuesday | Wednesday | 
```
```PowerShell
Thursday | Friday | Saturday}] [-Force] [-FullBackupMediaPool <VBRTapeMediaPool>] [-FullBackupPolicy <VBRFileToTapeBackupPolicy>] [-IncrementalBackupMediaPool <VBRTapeMediaPool>] [-IncrementalBackupPolicy 
```
```PowerShell
<VBRFileToTapeBackupPolicy>] -Job <VBRFileToTapeJob> [-JobScriptOptions <VBRJobScriptOptions>] [-LimitTapeDrives <Int32>] [-Name <String>] [-NdmpObject <VBRNDMPVolume[]>] [-NotificationOptions 
```
```PowerShell
<VBRNotificationOptions>] [-Object <VBRFileToTapeObject[]>] [-PassThru] [-UseHardwareCompression] [-UseVSS] [<CommonParameters>]
```
