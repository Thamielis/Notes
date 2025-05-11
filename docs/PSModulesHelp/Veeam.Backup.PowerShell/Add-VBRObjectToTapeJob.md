Add-VBRObjectToTapeJob
----------------------

### Synopsis
Creates an object to tape job.

---

### Description

This cmdlet creates a new object to tape job.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [New-VBRObjectStorageBackupJobObject](New-VBRObjectStorageBackupJobObject)

* [Get-VBRTapeMediaPool](Get-VBRTapeMediaPool)

* [New-VBRFileToTapeBackupPolicy](New-VBRFileToTapeBackupPolicy)

* [New-VBRNotificationOptions](New-VBRNotificationOptions)

* [New-VBRJobScriptOptions](New-VBRJobScriptOptions)

---

### Examples
> Example - Creating Object to Tape Job

$server = Get-VBRUnstructuredServer -Name "Azure Blob Storage"
$object = New-VBRObjectStorageBackupJobObject -Server $server -Container "Sydney Container"
$mediapool = Get-VBRTapeMediaPool -Name "Object Storage Backup Media Pool"
$monthlyoptions = New-VBRMonthlyOptions -DayNumberInMonth Last -DayOfWeek Sunday -Period 22:00
$monthlypolicy = New-VBRFileToTapeBackupPolicy -Type Monthly -MonthlyOptions $monthlyoptions -Enabled
$dailyoptions = New-VBRDailyOptions -Type Everyday -Period 22:00
$dailypolicy = New-VBRFileToTapeBackupPolicy -Type Daily -DailyOptions $dailyoptions -Enabled
Add-VBRObjectToTapeJob -Name "Sydney Container to Tape" -Description "Backing up Sydney Azure Container" -Object $object -FullBackupMediaPool $mediapool -FullBackupPolicy $monthlypolicy -IncrementalBackupMediaPool $mediapool -IncrementalBackupPolicy $dailypolicy
This example shows how to create an object to tape job that backs up the "Sydney Container Microsoft Azure" container. The full backup runs every last Sunday of the month and incremental backups run daily at 22:00.

Perform the following steps:
1. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the New-VBRObjectStorageBackupJobObject cmdlet. Set the $server variable as the Server parameter value. Specify the Container parameter value. Save the result to the $object variable.
3. Run the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value. Save it to the $mediapool variable.
4. Run the New-VBRMonthlyOptions cmdlet. Set Last as the DayNumberInMonth parameter value and Sunday as the DayOfWeek parameter value. Save the result to the $monthlyoptions variable.
5. Run the New-VBRFileToTapeBackupPolicy cmdlet. Set Monthly as the Type parameter value. Set the $monthlyoptions variable as the MonthlyOptions parameter value. Provide the Enabled parameter. Save the result to the $monthlypolicy variable.
6. Run the New-VBRDailyOptions cmdlet. Set Everyday as the Type parameter value and 22:00 as the Period parameter value. Save the result to the $dailyoptions variable.
7. Run the New-VBRFileToTapeBackupPolicy cmdlet. Set Daily as the Type parameter value. Set the $dailyoptions variable as the DailyOptions parameter value. Provide the Enabled parameter. Save the result to the $dailypolicy variable.
8. Run the Add-VBRObjectToTapeJob cmdlet. Specify the following settings:
- Specify the Name and the Description parameter value.
- Set the $object variable as the Object parameter value.
- Set the $mediapool variable as the FullBackupMediaPool parameter value.
- Set the $monthlypolicy variable as the FullBackupPolicy parameter value.
- Set the $mediapool variable as the IncrementalBackupMediaPool parameter value.
- Set the $dailypolicy variable as the IncrementalBackupPolicy parameter value.

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
|`[VBRTapeMediaPool]`|true    |named   |False        |

#### **FullBackupPolicy**
Specifies virtual synthetic full backup for tape settings. Accepts the VBRFullBackupToTapePolicy object. Default:
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
Specifies incremental backup settings. Accepts the VBRFileToTapeBackupPolicy object. Default:
* Type: Daily
* DailyOptions: Type: SelectedDays, Period: 18:00, DayOfWeek: Saturday
* MonthlyOptions: Period: 22:00, DayNumberInMonth: Fourth, DayOfWeek: Saturday, Months: January, February, March, April, May, June, July, August, September, October, November, December
* Enabled: False

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRFileToTapeBackupPolicy]`|false   |named   |False        |

#### **JobScriptOptions**
Specifies scripting options. Accepts the VBRJobScriptOptions object. To create this object, run the New-VBRJobScriptOptions cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRJobScriptOptions]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the object to tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **NotificationOptions**
Specifies the email notification options. Accepts the VBRNotificationOptions object. To create this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **Object**
Specifies the array of object to tape job sources. Accepts the VBRObjectStorageBackupJobObject[] object, GUID or string. To create this object, run the New-VBRObjectStorageBackupJobObject cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRObjectStorageBackupJobObject[]]`|true    |named   |False        |

#### **UseHardwareCompression**
Defines that tape library must perform hardware compression for archives. Do not use this option for archiving Veeam backups or other already compressed files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Add-VBRObjectToTapeJob [-Description <String>] [-EjectCurrentMedium] [-EnableFileAclChangeTracking] [-ExportCurrentMediaSet] [-ExportDays {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] 
```
```PowerShell
-FullBackupMediaPool <VBRTapeMediaPool> [-FullBackupPolicy <VBRFileToTapeBackupPolicy>] [-IncrementalBackupMediaPool <VBRTapeMediaPool>] [-IncrementalBackupPolicy <VBRFileToTapeBackupPolicy>] [-JobScriptOptions 
```
```PowerShell
<VBRJobScriptOptions>] -Name <String> [-NotificationOptions <VBRNotificationOptions>] -Object <VBRObjectStorageBackupJobObject[]> [-UseHardwareCompression] [<CommonParameters>]
```
