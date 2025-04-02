Add-VBRNASBackupJob
-------------------

### Synopsis
Creates file backup jobs.

---

### Description

This cmdlet creates file backup jobs.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [New-VBRNASBackupJobObject](New-VBRNASBackupJobObject)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRUnstructuredBackupVersionRetentionOptions](New-VBRUnstructuredBackupVersionRetentionOptions)

* [New-VBRStorageOptions](New-VBRStorageOptions)

* [New-VBRUnstructuredBackupArchivalOptions](New-VBRUnstructuredBackupArchivalOptions)

---

### Examples
> Example 1. Creating File Backup Job

$server = Get-VBRUnstructuredServer -Name "\\WinSRV2049\Documents"
$object = New-VBRNASBackupJobObject -Server $server -Path "\\WinSRV2049\Documents\January"
$repository = Get-VBRBackupRepository -Name "Repository05"
Add-VBRNASBackupJob -BackupObject $object -ShortTermBackupRepository $repository
This example shows how to create a file backup job. The job will be created with the following settings:

� The file backup job will process files that are located on the \WinSRV2049 server in the \WinSRV2049\Documents\January folder. � The backup files will be stored on the Repository05 short-term repository.

Perform the following steps:

1. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.   2. Run the New-VBRNASBackupJobObject cmdlet. Set the $server variable as the Server parameter value. Specify the Path parameter value.   3. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.   4. Run the Add-VBRNASBackupJob cmdlet. Set the $object variable as the BackupObject parameter value. Set the $repository variable as the ShortTermBackupRepository parameter value.
> Example 2. Creating File Backup Job with LongTerm Repository

$server = Get-VBRUnstructuredServer -Name "\\WinSRV2049\Documents"
$object = New-VBRNASBackupJobObject -Server $server -Path "\\WinSRV2027\Documents\Reports"
$shortrepository = Get-VBRBackupRepository -Name "Repository07"
$archiverepository = Get-VBRBackupRepository -Name "Repository10"
Add-VBRNASBackupJob -BackupObject $object -ShortTermBackupRepository $repository -LongTermBackupRepository $archiverepository
This example shows how to create a file backup job. The job will be created with the following settings: � The file backup job will process files that are located on the \WinSRV2027 server in the \WinSRV2027\Documents\Reports folder. � The backup files will be stored on the Repository07 short-term repository until the retention period is passed. � After retention period is passed, the backup files will be moved to the Repository10 long-term repository.

Perform the following steps:

1. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.   2. Run the New-VBRNASBackupJobObject cmdlet. Set the $server variable as the Server parameter value. Specify the Path parameter value.   3. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $shortrepository variable.   4. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $archiverepository variable.   5. Run the Add-VBRNASBackupJob cmdlet. Specify the following settings:       o Set the $object variable as the BackupObject parameter value.      o Set the $shortrepository variable as the ShortTermBackupRepository parameter value.      o Set the $archiverepository variable as the LongTermBackupRepository parameter value.

---

### Parameters
#### **BackupObject**
Specifies folders and files. The cmdlet will add these folders and files to the file backup job. Accepts the VBRNASBackupJobObject[] object.  To create this object, run the New-VBRNASBackupJobObject cmdlet.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRNASBackupObject[]]`|true    |named   |False        |

#### **Description**
Specifies a description of the file backup job. The cmdlet will create the file backup job with the specified description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableCopyMode**
Defines that the cmdlet will keep the copy of the data stored in the backup repository in the long-term archive repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableFileACLChangeTracking**
Defines that Veeam Backup & Replication will process attributes and permissions for folders. Files that are added to these folders will inherit permissions of the folders. If you enable this option, Veeam Backup & Replication will back up folder ACL attributes and permissions. Otherwise, they will not be backed up.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableLongTermRetention**
Defines that the cmdlet will keep files on long-term archive repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a file backup without showing warnings or errors in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HealthCheckOptions**
Specifies the healthcheck schedule. The cmdlet will create a file backup job with this healthcheck schedule. Accepts the VBRFullBackupOptions object. To create this object, run the New-VBRFullBackupOptions cmdlet.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRFullBackupOptions]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LongTermArchivalOptions**
Specifies the retention policy for file versions that are located on the long-term repository. The cmdlet will create file backup jobs with the specified retention policy. Accepts the VBRUnstructuredBackupArchivalOptions object.  To create this object, run the New-VBRUnstructuredBackupArchivalOptions cmdlet.

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupArchivalOptions]`|false   |named   |False        |

#### **LongTermBackupRepository**
Specifies the archive repository.  The cmdlet will add this repository as the long-term archive storage. Accepts the CBackupRepository object.  To get this object, run the following cmdlets:
* Get-VBRBackupRepository: use this cmdlet to get backup repositories.
* Get-VBRObjectStorageRepository: use this cmdlet to get object storage repositories.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IRepository]`|false   |named   |False        |

#### **LongTermRetentionPeriod**
For the LongTermRetentionType option. Specifies the period of time to keep data on the short-term repository. When this period is passed, Veeam Backup & Replication will delete this data from the archive repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **LongTermRetentionType**
Specifies a retention policy for the long-term archive repository. You can set the retention policy to either of the following periods:
* Daily: use this option if you want Veeam Backup & Replication to apply retention policy daily.
* Monthly: use this option if you want Veeam Backup & Replication to apply retention policy monthly.
Use the LongTermRetentionPeriod to specify the number of days or months.
Valid Values:

* Monthly
* Yearly

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupLongTermRetentionType]`|false   |named   |False        |

#### **Name**
Specifies a name of the file backup job. The cmdlet will create the file backup job with the specified name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification options. The cmdlet will create file backup jobs with these notification options. Accepts the VBRNotificationOptions object.  To create this object, run the New-VBRFullBackupOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies schedule options. The cmdlet will create file backup jobs with these schedule options. Accepts the VBRServerScheduleOptions object. To create this object, run the New-VBRServerScheduleOptions cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRServerScheduleOptions]`|false   |named   |False        |

#### **ScriptOptions**
Specifies pre-job and post-job script options. The cmdlet will create file backup jobs with these script options. Accepts the VBRJobScriptOptions object.  To create this object, run the New-VBRJobScriptOptions cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRJobScriptOptions]`|false   |named   |False        |

#### **SecondaryTarget**
Specifies the backup repository. The cmdlet will add this backup repository as the secondary repository to a file backup job. Accepts the VBRUnstructuredBackupSecondaryTarget[] object.  To create this object, run the New-VBRUnstructuredBackupSecondaryTarget cmdlet.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupSecondaryTarget[]]`|false   |named   |False        |

#### **ShortTermBackupRepository**
Specifies the backup repository. The cmdlet will add this repository as the short-term backup storage. Accepts the CBackupRepository object. To create this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **ShortTermRetentionPeriod**
For the ShortTermRetentionType option. Specifies the period of time to keep data on the short-term backup repository. When this period is passed, Veeam Backup & Replication will move data to the long-term archive repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ShortTermRetentionType**
Specifies a retention policy for the short-term repository. You can set the retention policy to either of the following periods:
* Daily: use this option if you want Veeam Backup & Replication to apply retention policy daily.
* Monthly: use this option if you want Veeam Backup & Replication to apply retention policy monthly.
Use the ShortTermRetentionPeriod to specify the number of days or months.
Valid Values:

* Daily
* Monthly

|Type                                           |Required|Position|PipelineInput|
|-----------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupShortTermRetentionType]`|false   |named   |False        |

#### **StorageOptions**
Specifies storage optimization settings. The cmdlet will create a file backup job with these settings. Accepts the VBRStorageOptions object.  To create this object, run the New-VBRStorageOptions cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRStorageOptions]`|false   |named   |False        |

#### **VersionRetentionOptions**
Specifies the settings of version-based retention for backup and archive repositories. The cmdlet will apply these settings to the file backup job. Accepts the VBRUnstructuredBackupVersionRetentionOptions object.  To create this object, run the New-VBRUnstructuredBackupVersionRetentionOptions cmdlet.

|Type                                            |Required|Position|PipelineInput|
|------------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupVersionRetentionOptions]`|false   |named   |False        |

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
Add-VBRNASBackupJob -BackupObject <VBRNASBackupObject[]> [-Description <String>] [-EnableCopyMode] [-EnableFileACLChangeTracking] [-EnableLongTermRetention] [-Force] [-HealthCheckOptions <VBRFullBackupOptions>] 
```
```PowerShell
[-HighPriority] [-LongTermArchivalOptions <VBRUnstructuredBackupArchivalOptions>] [-LongTermBackupRepository <IRepository>] [-LongTermRetentionPeriod <Int32>] [-LongTermRetentionType {Monthly | Yearly}] [-Name 
```
```PowerShell
<String>] [-NotificationOptions <VBRNotificationOptions>] [-ScheduleOptions <VBRServerScheduleOptions>] [-ScriptOptions <VBRJobScriptOptions>] [-SecondaryTarget <VBRUnstructuredBackupSecondaryTarget[]>] 
```
```PowerShell
-ShortTermBackupRepository <CBackupRepository> [-ShortTermRetentionPeriod <Int32>] [-ShortTermRetentionType {Daily | Monthly}] [-StorageOptions <VBRStorageOptions>] [-VersionRetentionOptions 
```
```PowerShell
<VBRUnstructuredBackupVersionRetentionOptions>] [<CommonParameters>]
```
