Add-VBRFileToTapeJob
--------------------

### Synopsis
Creates a file to tape job.

---

### Description

This cmdlet creates a new file to tape job.

---

### Related Links
* [Get-VBRTapeMediaPool](Get-VBRTapeMediaPool)

* [New-VBRFileToTapeBackupPolicy](New-VBRFileToTapeBackupPolicy)

* [New-VBRFileToTapeObject](New-VBRFileToTapeObject)

* [New-VBRNotificationOptions](New-VBRNotificationOptions)

* [New-VBRJobScriptOptions](New-VBRJobScriptOptions)

---

### Examples
> Example - Creating File to Tape Job

$server = Get-VBRServer -Name "fileserver08.tech.local"
$creds = Get-VBRCredentials -Description "Fileserver08 Adminisrator"
$object = New-VBRFileToTapeObject -Server $server -Path "D:\Summary Reports\Payroll Reports" -Credentials $creds
$mediapool = Get-VBRTapeMediaPool -Name "File Backup Media Pool"
$monthlyoptions = New-VBRMonthlyOptions -DayNumberInMonth Last -DayOfWeek Sunday Period 22:00
$policy = New-VBRFileToTapeBackupPolicy -Type Monthly -MonthlyOptions $monthlyoptions -Enabled
Add-VBRFileToTapeJob -Name "Payroll Reports to Tape" -Description "Finance reports: summary reports" -Object $object -FullBackupMediaPool $mediapool -FullBackupPolicy $policy
This example shows how to create a file to tape job that backs up the Payroll Reports folder. The job runs once a month and creates only full backups.

Perform the following steps:
1. Run the Get-VBRServer cmdlet to get the server where the files are located. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRCredentials cmdlet. Specify the Description parameter value. Save the result to the $creds variable.
3. Run the New-VBRFileToTapeObject cmdlet. Set the $server variable as the Server parameter value. Specify the Path parameter value. Set the $creds variable as the Credentials parameter value.
4. Run the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value. Save it to the $mediapool variable.
5. Run the New-VBRMonthlyOptions cmdlet. Specify the DayNumberInMonth, DayOfWeek and Period parameter values. Save the result to the $monthlyoptions variable.
6. Run the New-VBRFileToTapeBackupPolicy cmdlet. Set the Monthly option for the Type parameter. Set the $monthlyoptions variable as the MonthlyOptions parameter value. Provide the Enabled parameter. Save the result to the $policy variable.
7. Run the Add-VBRFileToTapeJob cmdlet. Specify the following settings:
- Specify the Name and the Description parameter value.
- Set the $object variable as the Object parameter value.
- Set the $mediapool variable as the FullBackupMediaPool parameter value.
- Set the $policy variable as the FullBackupPolicy parameter value.

---

### Parameters
#### **Description**
Specifies the description of the file to tape job.

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
Defines that the tapes belonging to the media set will be automatically placed to Import/Export (Mail) slot for further export. Use the ExportDays parameter to set days on which you want to export tapes.  If you use this parameter, but do not set the ExportDays parameter, the tapes will be exported every day.

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
|`[VBRTapeMediaPool]`|true    |named   |False        |

#### **FullBackupPolicy**
Specifies virtualized synthetic full backup for tape settings. Accepts VBRFileToTapeBackupPolicy object.
By default, the following settings are applied:
* Type: Daily
* DailyOptions: Type: SelectedDays, Period: 18:00, DayOfWeek: Saturday
* MonthlyOptions: Period: 22:00, DayNumberInMonth: Fourth, DayOfWeek: Saturday, Months: January, February, March, April, May, June, July, August, September, October, November, December
* Enabled: False

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRFileToTapeBackupPolicy]`|false   |named   |False        |

#### **IncrementalBackupMediaPool**
Used to set media pool for the ProcessIncrementalBackup parameter. Specifies the media pool where you want to store incremental backups produced by this tape job. If you do not specify a media pool, incremental backups will be stored to the media pool the you set for full backups. Accepts the VBRTapeMediaPool obejct, GUID or string. To get this object, run the Get-VBRTapeMediaPool cmdlet.

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
Specifies the name you want to assign to the file to tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Specifies the array of file to tape job sources. Accepts the VBRFileToTapeObject[] object. To create this object, run the New-VBRFileToTapeObject cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRFileToTapeObject[]]`|false   |named   |False        |

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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRFileToTapeJob [-Description <String>] [-EjectCurrentMedium] [-EnableFileAclChangeTracking] [-EnableParallelDrivesUsage] [-ExportCurrentMediaSet] [-ExportDays {Sunday | Monday | Tuesday | Wednesday | 
```
```PowerShell
Thursday | Friday | Saturday}] [-Force] -FullBackupMediaPool <VBRTapeMediaPool> [-FullBackupPolicy <VBRFileToTapeBackupPolicy>] [-IncrementalBackupMediaPool <VBRTapeMediaPool>] [-IncrementalBackupPolicy 
```
```PowerShell
<VBRFileToTapeBackupPolicy>] [-JobScriptOptions <VBRJobScriptOptions>] [-LimitTapeDrives <Int32>] -Name <String> [-NdmpObject <VBRNDMPVolume[]>] [-NotificationOptions <VBRNotificationOptions>] [-Object 
```
```PowerShell
<VBRFileToTapeObject[]>] [-UseHardwareCompression] [-UseVSS] [<CommonParameters>]
```
