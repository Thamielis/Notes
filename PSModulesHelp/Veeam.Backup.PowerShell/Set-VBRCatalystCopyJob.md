Set-VBRCatalystCopyJob
----------------------

### Synopsis
Modifies backup copy jobs for HPE StoreOnce repositories.

---

### Description

This cmdlet modifies backup copy jobs that are created for HPE StoreOnce repositories.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCatalystCopyJob](Get-VBRCatalystCopyJob)

* [New-VBRBackupWindowOptions](New-VBRBackupWindowOptions)

---

### Examples
> Example 1. Modifying Backup Copy Job Schedule to Run at Specific Time

$job = Get-VBRCatalystCopyJob -Name "Backup Copy StoreOnce 05"
$windowoptions = New-VBRBackupWindowOptions -FromDay Monday -ToDay Friday -FromHour 20 -ToHour 22 -Enabled
Set-VBRCatalystCopyJob -Job $job -BackupWindowOptions $windowoptions
This example shows how to modify backup window settings for a backup copy job. The backup copy job will run from 20:00 to 22:59 every day from Monday to Friday.
Perform the following steps:
1. Run the Get-VBRCatalystCopyJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRBackupWindowOptions cmdlet. Specify the necessary parameters. Save the result to the $windowoptions variable.
3. Run the Set-VBRCatalystCopyJob cmdlet. Set the $job variable as the Job parameter value. Set the $windowoptions variable as the BackupWindowOptions parameter value.
> Example 2. Modifying Backup Copy Job Schedule to Run Continuously

$job = Get-VBRCatalystCopyJob -Name "Backup Copy StoreOnce 05"
Set-VBRCatalystCopyJob -Job $job -BackupWindowOptions $windowoptions -AnyTime
This example shows how to modify schedule settings for a backup copy job. The backup copy job will run continuously.
Perform the following steps:
1. Run the Get-VBRCatalystCopyJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Set-VBRCatalystCopyJob cmdlet. Set the $job variable as the Job parameter value. Set the $windowoptions variable as the BackupWindowOptions parameter value. Provide the AnyTime parameter.

---

### Parameters
#### **AnyTime**
Defines that Veeam Backup & Replication will run a backup job continuously.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **BackupWindowOptions**
Specifies backup window settings for a job. The cmdlet will create the the backup copy job with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Description**
Specifies a description of a backup copy job. The cmdlet will create the backup copy job with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableHealthCheck**
Defines that the cmdlet will enable the Health check option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify backup copy jobs that are created for HPE StoreOnce repositories without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specify a backup copy job for an HPE StoreOnce repository. The cmdlet will modify the settings of this job.

|Type                  |Required|Position|PipelineInput |
|----------------------|--------|--------|--------------|
|`[VBRCatalystCopyJob]`|true    |named   |True (ByValue)|

#### **KeepSecondaryCopies**
Defines that the cmdlet will enable retention policy for the backup files in the target location.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a name of a backup copy job. The cmdlet will create the backup copy job with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings. The cmdlet will create the backup copy job with these settings

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **ScriptOptions**
Specifies job scrip options. The cmdlet will create a copy job with these script options.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRJobScriptOptions]`|false   |named   |False        |

#### **SecondaryCopiesRetentionPeriod**
Specifies a number of days for which you want to store backup files in the target location.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SourceRepository**
Specifies an array of source HPE StoreOnce repositories. The cmdlet will copy backup files from these repositories.
You can specify the following types of repositories:
* HPE StoreOnce repositories.
* HPE StoreOnce repositories added as extents to a Scale-Out Backup Repository.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

#### **TargetRepository**
Specifies an array of target HPE StoreOnce repositories. The cmdlet will copy backup files to these repositories.
You can specify the following types of repositories:
* HPE StoreOnce repositories.
* HPE StoreOnce repositories added as extents to a Scale-Out Backup Repository.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCatalystCopyJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCatalystCopyJob [-AnyTime] [-Description <String>] [-EnableHealthCheck] [-Force] -Job <VBRCatalystCopyJob> [-KeepSecondaryCopies] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] 
```
```PowerShell
[-ScriptOptions <VBRJobScriptOptions>] [-SecondaryCopiesRetentionPeriod <Int32>] [-SourceRepository <CBackupRepository[]>] [-TargetRepository <CBackupRepository[]>] [<CommonParameters>]
```
```PowerShell
Set-VBRCatalystCopyJob [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] [-EnableHealthCheck] [-Force] -Job <VBRCatalystCopyJob> [-KeepSecondaryCopies] [-Name <String>] 
```
```PowerShell
[-NotificationOptions <VBRNotificationOptions>] [-ScriptOptions <VBRJobScriptOptions>] [-SecondaryCopiesRetentionPeriod <Int32>] [-SourceRepository <CBackupRepository[]>] [-TargetRepository 
```
```PowerShell
<CBackupRepository[]>] [<CommonParameters>]
```
