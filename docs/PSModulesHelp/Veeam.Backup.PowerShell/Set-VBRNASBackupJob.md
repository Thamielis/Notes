Set-VBRNASBackupJob
-------------------

### Synopsis
Modifies file share backup jobs.

---

### Description

This cmdlet modifies settings of file share backup jobs.

To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters you omit will remain unchanged.

---

### Related Links
* [Get-VBRUnstructuredBackupJob](Get-VBRUnstructuredBackupJob)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRUnstructuredBackupSecondaryTarget](New-VBRUnstructuredBackupSecondaryTarget)

* [New-VBRNotificationOptions](New-VBRNotificationOptions)

---

### Examples
> Example 1. Modifying Long-Term Repository

$job = Get-VBRUnstructuredBackupJob -Name "NFS Backup"
$repository = Get-VBRBackupRepository -Name "Repository 09"
Set-VBRNASBackupJob -Job $job -LongTermBackupRepository $repository -EnableLongTermRetention -LongTermRetentionType Yearly -LongTermRetentionPeriod 3
This example shows how to modify a long-term repository for a file share backup job. The file share backup job will have the following settings:
- Veeam Backup & Replication will move data from the short-term repository to the Repository 09 backup repository.
- Veeam Backup & Replication will keep file versions on the long-term repository for 3 years.
Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Set-VBRNASBackupJob cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Set the $repository variable as the LongTermBackupRepository parameter value.
- Specify the EnableLongTermRetention parameter value.
- Set the Yearly option for the LongTermRetentionType parameter value.
- Specify the LongTermRetentionPeriod parameter value.
> Example 2. Modifying Notification Options

$options = New-VBRNotificationOptions -EnableAdditionalNotification -AdditionalAddress admin@domain.com -UseNotificationOptions -NotifyOnSuccess -NotifyOnWarning
$job = Get-VBRUnstructuredBackupJob -Name "NFS Backup"
Set-VBRNASBackupJob -Job $job -NotificationOptions $options
This example shows how to modify notification options for a file share backup job. Veeam Backup & Replication will send notifications about the job warnings and when the job completes successfully.
Perform the following steps:
1. Run the New-VBRNotificationOptions cmdlet. Specify the necessary parameters.
2. Run the Get-VBRUnstructuredBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
3. Run the Set-VBRNASBackupJob cmdlet. Set the $job variable as the Job parameter value. Set the $options variable as the NotificationOptions parameter value.
> Example 3. Enabling Secondary Target Repository

$job = Get-VBRUnstructuredBackupJob -Name "NFS Backup"
$srepo = Get-VBRBackupRepository -Name "Repository 09"
$secondary = New-VBRUnstructuredBackupSecondaryTarget -BackupRepository $srepo
Set-VBRNASBackupJob -Job $job -EnableSecondaryTarget:$true -SecondaryTarget $secondary
This example shows how to enable the secondary repository for the file share backup job. The secondary repository will be created with the following settings:
- Veeam Backup & Replication will apply a retention policy that is set to the file share backup job.
- Veeam Backup & Replication will apply an encryption key that is set to the file share backup job.
- Veeam Backup & Replication will copy data to the repository continuously.
Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $srepo variable.
3. Run the New-VBRUnstructuredBackupSecondaryTarget cmdlet. Set the $srepo variable as the BackupRepository parameter value. Save the result to the $secondary variable.
4. Run the Set-VBRNASBackupJob cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Set the EnableSecondaryTarget parameter to $true.
- Set the $secondary variable as the SecondaryTarget parameter value.

---

### Parameters
#### **BackupObject**
Specifies folders and files. The cmdlet will add these folders and files to the file share backup job. Accepts the VBRNASBackupJobObject[] object.  To create this object, run the New-VBRNASBackupJobObject cmdlet.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupJobObject[]]`|false   |named   |False        |

#### **Description**
Specifies a description of the file share backup job. The cmdlet will change the existing description of the file share backup job with the specified description.

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
Defines that the cmdlet will enable custom retention policy for the long-term repository.  If you provide this parameter, Veeam Backup & Replication will apply custom retention policy for data that is stored on the long-term repository. Otherwise, Veeam Backup & Replication will keep data for three years on the long-term repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSchedule**
Defines that the cmdlet will enable the custom schedule for a file share backup job. If you provide this parameter, the file share backup job will run according to this schedule. Otherwise, to run the job, you will need to start it manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSecondaryTarget**
Defines that the cmdlet will enable a secondary backup repository for a file share backup job. If you provide this parameter, Veeam Backup & Replication will create copies of file share backup jobs and will keep them on a secondary backup repository. Otherwise, copies of the file share backup job will not be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will create file backup without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HealthCheckOptions**
Specifies the healthcheck schedule. The cmdlet will create file share backup jobs with this healthcheck schedule. Accepts the VBRFullBackupOptions object.  To create this object, run the New-VBRFullBackupOptions cmdlet.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRFullBackupOptions]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the file share backup job. The cmdlet will modify settings of the specified job. Accepts the VBRNASBackupJob object.  To create this object, run the Get-VBRUnstructuredBackup cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRNASBackupJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **LongTermArchivalOptions**
Specifies the retention policy for file versions that are located on the long-term repository. The cmdlet will create file share backup jobs with the specified retention policy. Accepts the VBRUnstructuredBackupArchivalOptions object.  To create this object, run the New-VBRUnstructuredBackupArchivalOptions cmdlet.

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupArchivalOptions]`|false   |named   |False        |

#### **LongTermBackupRepository**
Specifies the backup repository. The cmdlet will add this backup repository as the long-term repository. Accepts the CBackupRepository object.  To create this object, run the Get-VBRBackupRepository cmdlet.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IRepository]`|false   |named   |False        |

#### **LongTermRetentionPeriod**
For the LongTermRetentionType option. Specifies the period of time to keep data on the short-term repository. When this period is passed, Veeam Backup & Replication will delete this data from the long-term repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **LongTermRetentionType**
Specifies a retention policy for the long-term repository. You can set the retention policy to either of the following periods:
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
Specifies a name of the file share backup job. The cmdlet will change the existing name of the file share backup job with the specified name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification options. The cmdlet will create file share backup jobs with these notification options. Accepts the VBRNotificationOptions object.  To create this object, run the New-VBRFullBackupOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies schedule options. The cmdlet will create file share backup jobs with these schedule options. Accepts the VBRJobScriptOptions object.  To create this object, run the New-VBRServerScheduleOptions cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRServerScheduleOptions]`|false   |named   |False        |

#### **ScriptOptions**
Specifies pre-job and post-job script options. The cmdlet will create file share backup jobs with these script options. Accepts the VBRJobScriptOptions object.  To create this object, run the New-VBRJobScriptOptions cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRJobScriptOptions]`|false   |named   |False        |

#### **SecondaryTarget**
Specifies the backup repository. The cmdlet will add this backup repository as the secondary repository to the file share backup job. Accepts the VBRUnstructuredBackupSecondaryTarget[] object.  To create this object, run the New-VBRUnstructuredBackupSecondaryTarget cmdlet.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupSecondaryTarget[]]`|false   |named   |False        |

#### **ShortTermBackupRepository**
Specifies the backup repository. The cmdlet will add this backup repository as the short-term repository. Accepts the CBackupRepository object.  To create this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **ShortTermRetentionPeriod**
For the ShortTermRetentionType option. Specifies a retention policy for the short-term repository. You can set the retention policy to either of the following periods:
* Daily: use this option if you want Veeam Backup & Replication to apply retention policy daily.
* Monthly: use this option if you want Veeam Backup & Replication to apply retention policy monthly.
Use the ShortTermRetentionPeriod to specify the number of days or months.

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
Specifies storage optimization settings. The cmdlet will create the file share backup job with these settings. Accepts the VBRStorageOptions object.  To create this object, run the New-VBRStorageOptions cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRStorageOptions]`|false   |named   |False        |

#### **VersionRetentionOptions**
Specifies the settings of version-based retention for backup and archive repositories. The cmdlet will apply these settings to the file share backup job. Accepts the VBRUnstructuredBackupVersionRetentionOptions object.  To create this object, run the New-VBRUnstructuredBackupVersionRetentionOptions cmdlet.

|Type                                            |Required|Position|PipelineInput|
|------------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupVersionRetentionOptions]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNASBackupJob [-BackupObject <VBRUnstructuredBackupJobObject[]>] [-Description <String>] [-EnableCopyMode] [-EnableFileACLChangeTracking] [-EnableLongTermRetention] [-EnableSchedule] 
```
```PowerShell
[-EnableSecondaryTarget] [-Force] [-HealthCheckOptions <VBRFullBackupOptions>] [-HighPriority] -Job <VBRNASBackupJob> [-LongTermArchivalOptions <VBRUnstructuredBackupArchivalOptions>] [-LongTermBackupRepository 
```
```PowerShell
<IRepository>] [-LongTermRetentionPeriod <Int32>] [-LongTermRetentionType {Monthly | Yearly}] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-ScheduleOptions <VBRServerScheduleOptions>] 
```
```PowerShell
[-ScriptOptions <VBRJobScriptOptions>] [-SecondaryTarget <VBRUnstructuredBackupSecondaryTarget[]>] [-ShortTermBackupRepository <CBackupRepository>] [-ShortTermRetentionPeriod <Int32>] [-ShortTermRetentionType 
```
```PowerShell
{Daily | Monthly}] [-StorageOptions <VBRStorageOptions>] [-VersionRetentionOptions <VBRUnstructuredBackupVersionRetentionOptions>] [<CommonParameters>]
```
