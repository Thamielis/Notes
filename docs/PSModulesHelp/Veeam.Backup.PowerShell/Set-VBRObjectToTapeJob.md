Set-VBRObjectToTapeJob
----------------------

### Synopsis
Modifies an object to tape job.

---

### Description

This cmdlet modifies a selected object to tape job that was created before.

---

### Related Links
* [Get-VBRTapeJob](Get-VBRTapeJob)

* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [New-VBRObjectStorageBackupJobObject](New-VBRObjectStorageBackupJobObject)

* [Get-VBRTapeMediaPool](Get-VBRTapeMediaPool)

* [New-VBRFileToTapeBackupPolicy](New-VBRFileToTapeBackupPolicy)

* [New-VBRNotificationOptions](New-VBRNotificationOptions)

* [New-VBRJobScriptOptions](New-VBRJobScriptOptions)

---

### Examples
> Example - Modifying Object to Tape Job [Using Pipeline]

$newpool = Get-VBRTapeMediaPool -Name "Azure Blob Storage Backups"
Get-VBRTapeJob -Name "Sydney Container to Tape" | Set-VBRObjectToTapeJob -IncrementalBackupMediaPool $newpool
This example shows how to set a new media pool for the incremental backups for the "Sydney Container to Tape" job.

Perform the following steps:
1. Run the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value. Save it to the $newpool variable.
2. Run the Get-VBRTapeJob cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Set-VBRObjectToTapeJob cmdlet. Set the $newpool variable as the IncrementalBackupMediaPool parameter value.

---

### Parameters
#### **Description**
Specifies the description of the object to tape job.

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

#### **FullBackupMediaPool**
Specifies the media pool where you want to store full backups produced by this tape job. Accepts the VBRTapeMediaPool object, GUID or string. To get this object, run the Get-VBRTapeMediaPool cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRTapeMediaPool]`|false   |named   |False        |

#### **FullBackupPolicy**
Specifies virtual synthetic full backup for tape settings. Default:
* Type: Daily
* DailyOptions: Type: SelectedDays, Period: 18:00, DayOfWeek: Saturday
* MonthlyOptions: Period: 22:00, DayNumberInMonth: Fourth, DayOfWeek: Saturday, Months: January, February, March, April, May, June, July, August, September, October, November, December
* Enabled: False

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRFileToTapeBackupPolicy]`|false   |named   |False        |

#### **IncrementalBackupMediaPool**
Specifies the media pool where you want to store incremental backups produced by this tape job. Accepts the VBRTapeMediaPool object, GUID or string. To get this object, run the Get-VBRTapeMediaPool cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRTapeMediaPool]`|false   |named   |False        |

#### **IncrementalBackupPolicy**
Specifies incremental backup settings. Default:
* Type: Daily
* DailyOptions: Type: SelectedDays, Period: 18:00, DayOfWeek: Saturday
* MonthlyOptions: Period: 22:00, DayNumberInMonth: Fourth, DayOfWeek: Saturday, Months: January, February, March, April, May, June, July, August, September, October, November, December
* Enabled: False

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRFileToTapeBackupPolicy]`|false   |named   |False        |

#### **Job**
Specifies the object to tape job to which you want to apply new settings. Accepts the VBRObjectToTapeJob object, GUID and string. To get this object, run the Get-VBRTapeJob cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRObjectToTapeJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **JobScriptOptions**
Specifies scripting options. Accepts the VBRJobScriptOptions object. To create this object, run the New-VBRJobScriptOptions cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRJobScriptOptions]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the object to tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies the email notification options. Accepts the VBRNotificationOptions object. To create this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **Object**
Specifies the array of object to tape job sources. Accepts the VBRObjectStorageBackupJobObject[] object, GUID or string. To create this object, run the New-VBRObjectStorageBackupJobObject cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRObjectStorageBackupJobObject[]]`|false   |named   |False        |

#### **UseHardwareCompression**
Defines that tape library must perform hardware compression for archives. Do not use this option for archiving Veeam backups or other already compressed files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRObjectToTapeJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRObjectToTapeJob [-Description <String>] [-EjectCurrentMedium] [-EnableFileAclChangeTracking] [-ExportCurrentMediaSet] [-ExportDays {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] 
```
```PowerShell
[-FullBackupMediaPool <VBRTapeMediaPool>] [-FullBackupPolicy <VBRFileToTapeBackupPolicy>] [-IncrementalBackupMediaPool <VBRTapeMediaPool>] [-IncrementalBackupPolicy <VBRFileToTapeBackupPolicy>] -Job 
```
```PowerShell
<VBRObjectToTapeJob> [-JobScriptOptions <VBRJobScriptOptions>] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-Object <VBRObjectStorageBackupJobObject[]>] [-UseHardwareCompression] 
```
```PowerShell
[<CommonParameters>]
```
