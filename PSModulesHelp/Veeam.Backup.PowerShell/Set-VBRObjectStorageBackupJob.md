Set-VBRObjectStorageBackupJob
-----------------------------

### Synopsis
Modifies settings of object storage backup job.

---

### Description

This cmdlet modifies settings of object storage backup job.

---

### Related Links
* [Get-VBRUnstructuredBackupJob](Get-VBRUnstructuredBackupJob)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRServerScheduleOptions](New-VBRServerScheduleOptions)

* [New-VBRJobScriptOptions](New-VBRJobScriptOptions)

---

### Examples
> Modifying Object Storage Backup Job

$job = Get-VBRUnstructuredBackupJob -Name "Azure01"
$archiverepo = Get-VBRBackupRepository -Name "WinRepo2075"
Set-VBRObjectStorageBackupJob -Job $job -LongTermBackupRepository $archiverepo -EnableLongTermRetention -LongTermRetentionType Monthly LongTermRetentionPeriod 3
This example shows how to modify the object storage to keep data on the WinRepo2075 long-term archive repository.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $archiverepo variable.
3. Run the Set-VBRObjectStorageBackupJob cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Set the $archiverepo variable as the LongTermBackupRepository parameter value.
- Provide the EnableLongTermRetention parameter.
- Set the Monthly option for the LongTermRetentionType parameter.
- Specify the LongTermRetentionPeriod parameter value.

---

### Parameters
#### **BackupObject**
Specifies an array of objects. The cmdlet will add these objects to the object storage backup job. Accepts the VBRObjectStorageBackupJobObject[] object.  To define this object, run the New-VBRObjectStorageBackupJobObject cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRObjectStorageBackupJobObject[]]`|false   |named   |False        |

#### **Description**
Specifies a description of the object storage backup job. The cmdlet will create the the object storage backup job with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableCopyMode**
Defines that the cmdlet will keep the copy of the data stored in the backup repository in the long-term archive repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableLongTermRetention**
Defines that the cmdlet will keep objects on long-term archive repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSchedule**
Defines that the cmdlet will enable the custom schedule for a file share backup job. if you provide this parameter, a file share backup job will run according to this schedule. Otherwise, to run the job, you will need to start it manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSecondaryTarget**
Defines that the cmdlet will enable a secondary backup repository for an object storage backup job.  If you provide this parameter, Veeam Backup & Replication will create copies of object storage backup jobs and will keep them on a secondary backup repository. Otherwise, copies of object storage jobs will not be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a file backup without showing warnings or errors in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HealthCheckOptions**
Specifies the healthcheck schedule. The cmdlet will create the object storage backup with this healthcheck schedule. Accepts the VBRFullBackupOptions object. To create this object, run the New-VBRFullBackupOptions cmdlet.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRFullBackupOptions]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the object storage backup job that you want to modify. Accepts the VBRObjectStorageBackupJob object.  To get this object, run the Get-VBRUnstructuredBackupJob cmdlet.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRObjectStorageBackupJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **LongTermArchivalOptions**
Specifies the retention policy for data versions that are located on the long-term archive repository. The cmdlet will create object storage backup jobs with the specified retention policy. Accepts the VBRUnstructuredBackupArchivalOptions object.  To create this object, run the New-VBRUnstructuredBackupArchivalOptions cmdlet.

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupArchivalOptions]`|false   |named   |False        |

#### **LongTermBackupRepository**
Specifies the archive repository. The cmdlet will add this repository as the long-term archive storage. Accepts the IRepository object. To get this object, run the following cmdlets:
* Get-VBRBackupRepository: use this cmdlet to get backup repositories.
* Get-VBRObjectStorageRepository: use this cmdlet to get object storage repositories.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IRepository]`|false   |named   |False        |

#### **LongTermRetentionPeriod**
For the LongTermRetentionType option. Specifies the period of time to keep data on the long-term archive repository. When this period is passed, Veeam Backup & Replication will delete this data from the archive repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **LongTermRetentionType**
Specifies a retention policy for the long-term archive repository. You can set the retention policy to either of the following periods:
* Monthly: use this option if you want Veeam Backup & Replication to apply retention policy monthly.
* Yearly: use this option if you want Veeam Backup & Replication to apply retention policy yearly.
Use the LongTermRetentionPeriod to specify the number of months or years.
Valid Values:

* Monthly
* Yearly

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupLongTermRetentionType]`|false   |named   |False        |

#### **Name**
Specifies a name of the object storage backup job. The cmdlet will create the object storage backup job with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification options. The cmdlet will create the object storage backup job with these notification options. Accepts the VBRNotificationOptions object.  To create this object, run the New-VBRFullBackupOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies schedule options. The cmdlet will create the object storage backup job with these schedule options. Accepts the VBRJobScriptOptions object.  To create this object, run the New-VBRServerScheduleOptions cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRServerScheduleOptions]`|false   |named   |False        |

#### **ScriptOptions**
Specifies pre-job and post-job script options. The cmdlet will create object storage backup jobs with these script options. Accepts the VBRJobScriptOptions object.  To create this object, run the New-VBRJobScriptOptions cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRJobScriptOptions]`|false   |named   |False        |

#### **SecondaryTarget**
Specifies the backup repository. The cmdlet will add this repository as the secondary repository to the object storage backup job. Accepts the VBRUnstructuredBackupSecondaryTarget[] object.  To create this object, run the New-VBRUnstructuredBackupSecondaryTarget cmdlet.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupSecondaryTarget[]]`|false   |named   |False        |

#### **ShortTermBackupRepository**
Specifies the backup repository. The cmdlet will add this repository as the short-term backup storage. Accepts the CBackupRepository object.  To create this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **ShortTermRetentionPeriod**
For the ShortTermRetentionType option. Specifies the period of time to keep data on the short-term backup repository. When this period is passed, Veeam Backup & Replication will move data to the long-term archive repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ShortTermRetentionType**
Specifies a retention policy for the short-term backup repository. You can set the retention policy to either of the following periods:
* Daily: use this option if you want Veeam Backup & Replication to apply retention policy daily.
* Monthly: use this option if you want Veeam Backup & Replication to apply retention policy monthly.
Use the ShortTermRetentionPeriod to specify the number of days or months.
Valid Values:

* Daily
* Monthly

|Type                                           |Required|Position|PipelineInput|
|-----------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupShortTermRetentionType]`|false   |named   |False        |

#### **SkipTagTracking**
Defines that the cmdlet will enable tag tracking for an object storage backup job. If you provide this parameter, the cmdlet will skip tracking of tags for incremental backups in case the objects content is not changed when the job runs. Note: The cmdlet skips this parameter if you define tag masks settings with the New-VBRObjectStorageBackupTagMask cmdlet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StorageOptions**
Specifies storage optimization settings. The cmdlet will create the object storage backup with these settings. Accepts the VBRStorageOptions object.  To create this object, run the New-VBRStorageOptions cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRStorageOptions]`|false   |named   |False        |

#### **VersionRetentionOptions**
Specifies the settings of version-based retention for backup and archive repositories. The cmdlet will apply these settings to the object storage backup job. Accepts the VBRUnstructuredBackupVersionRetentionOptions object.  To create this object, run the New-VBRUnstructuredBackupVersionRetentionOptions cmdlet.

|Type                                            |Required|Position|PipelineInput|
|------------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupVersionRetentionOptions]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRObjectStorageBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRObjectStorageBackupJob [-BackupObject <VBRObjectStorageBackupJobObject[]>] [-Description <String>] [-EnableCopyMode] [-EnableLongTermRetention] [-EnableSchedule] [-EnableSecondaryTarget] [-Force] 
```
```PowerShell
[-HealthCheckOptions <VBRFullBackupOptions>] [-HighPriority] -Job <VBRObjectStorageBackupJob> [-LongTermArchivalOptions <VBRUnstructuredBackupArchivalOptions>] [-LongTermBackupRepository <IRepository>] 
```
```PowerShell
[-LongTermRetentionPeriod <Int32>] [-LongTermRetentionType {Monthly | Yearly}] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-ScheduleOptions <VBRServerScheduleOptions>] [-ScriptOptions 
```
```PowerShell
<VBRJobScriptOptions>] [-SecondaryTarget <VBRUnstructuredBackupSecondaryTarget[]>] [-ShortTermBackupRepository <CBackupRepository>] [-ShortTermRetentionPeriod <Int32>] [-ShortTermRetentionType {Daily | 
```
```PowerShell
Monthly}] [-SkipTagTracking] [-StorageOptions <VBRStorageOptions>] [-VersionRetentionOptions <VBRUnstructuredBackupVersionRetentionOptions>] [<CommonParameters>]
```
