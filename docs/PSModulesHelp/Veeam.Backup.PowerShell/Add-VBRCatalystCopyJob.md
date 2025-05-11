Add-VBRCatalystCopyJob
----------------------

### Synopsis
Creates backup copy jobs for HPE StoreOnce repositories.

---

### Description

This cmdlet creates backup copy jobs for HPE StoreOnce repositories.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRBackupWindowOptions](New-VBRBackupWindowOptions)

---

### Examples
> Example 1. Creating Backup Copy Job for Specific HPE StoreOnce Repositories

$source = Get-VBRBackupRepository -Name "HPE StoreOnce 1"
$target = Get-VBRBackupRepository -Name "HPE StoreOnce 2"
Add-VBRCatalystCopyJob -Name "StoreOnce copy job" -SourceRepository $source -TargetRepository $target -Description "Copy job for StoreOnce repository"
This example shows how to create a backup copy job that will copy data from the source HPE StoreOnce 1 repository to the target HPE StoreOnce 2 repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $source variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $target variable.
3. Run the Add-VBRCatalystCopyJob cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $source variable as the SourceRepository parameter value.
- Set the $target variable as the TargetRepository parameter value.
- Specify the Description parameter value.
> Example 2. Creating Backup Copy Job for HPE StoreOnce Repository with Backup Window Options

$source = Get-VBRBackupRepository -Name "HPE SO 05"
$target = Get-VBRBackupRepository -Name "HPE SO 07"
$windowoptions = New-VBRBackupWindowOptions -FromDay Friday -FromHour 22 -ToDay Saturday -ToHour 22 -Enabled
Add-VBRCatalystCopyJob -Name "StoreOnce copy job" -SourceRepository $source -TargetRepository $target -Description "Copy job for StoreOnce repository" -BackupWindowOptions $windowoptions
This example shows how to create a backup copy job for an HPE StoreOnce repository. The job will run during the following period of time:
- From 22:00 to 22:59 on Friday
- From 22:00 to 22:59 on Saturday
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $source variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $target variable.
3. Run the New-VBRBackupWindowOptions cmdlet. Specify the necessary parameters. Save the result to the $windowoptions variable.
4. Run the Add-VBRCatalystCopyJob cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $source variable as the SourceRepository parameter value.
- Set the $target variable as the TargetRepository parameter value.
- Specify the Description  parameter value.
- Set the $windowoptions variable as the BackupWindowOptions parameter value.
> Example 3. Creating Backup Copy Job for List of HPE StoreOnce Repositories

$source = Get-VBRBackupRepository -Name "HPE StoreOnce 1", "HPE StoreOnce 2", "HPE StoreOnce 3"
$target = Get-VBRBackupRepository -Name "HPE StoreOnce 4", "HPE StoreOnce 5", "HPE StoreOnce 6"
Add-VBRCatalystCopyJob -Name "StoreOnce copy job" -SourceRepository $source -TargetRepository $target -Description "Copy job for StoreOnce repository"
This example shows how to create a backup copy job that will copy data from a list of source repositories to a list of the target repositories. Veeam Backup & Replication will copy data according to the following scheme:
- From HPE StoreOnce 1 to HPE StoreOnce 4
- From HPE StoreOnce 2 to HPE StoreOnce 5
- From HPE StoreOnce 3 to HPE StoreOnce 6
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $source variable.
The Get-VBRBackupRepository cmdlet will return an array of source HPE StoreOnce repositories.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $target variable.
The Get-VBRBackupRepository cmdlet will return an array of target HPE StoreOnce repositories.
3. Run the Add-VBRCatalystCopyJob cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $source variable as the SourceRepository parameter value.
- Set the $target variable as the TargetRepository parameter value.
- Specify the Description parameter value.

---

### Parameters
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
Defines that the cmdlet will create backup copy jobs without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **KeepSecondaryCopies**
Defines that the cmdlet will enable retention policy for the backup files in the target location.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a name of a backup copy job. The cmdlet will create the copy job with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |False        |

#### **NotificationOptions**
Specifies notification settings. The cmdlet will create the backup copy job with these settings.

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
Note: The array of source repositories must contain the same number of the repositories as the array of the target repositories.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|true    |named   |False        |

#### **TargetRepository**
Specifies an array of target HPE StoreOnce repositories. The cmdlet will copy backup files to these repositories.
You can specify the following types of repositories:
* HPE StoreOnce repositories.
* HPE StoreOnce repositories added as extents to a Scale-Out Backup Repository.
Note: The array of target repositories must contain the same number of the repositories as the array of the source repositories.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|true    |named   |False        |

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
Add-VBRCatalystCopyJob [-Name] <String> [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] [-EnableHealthCheck] [-Force] [-KeepSecondaryCopies] [-NotificationOptions 
```
```PowerShell
<VBRNotificationOptions>] [-ScriptOptions <VBRJobScriptOptions>] [-SecondaryCopiesRetentionPeriod <Int32>] -SourceRepository <CBackupRepository[]> -TargetRepository <CBackupRepository[]> [<CommonParameters>]
```
