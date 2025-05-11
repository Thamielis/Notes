Set-VBRSureBackupJob
--------------------

### Synopsis
Modifies settings of SureBackup jobs.

---

### Description

This cmdlet modifies settings of SureBackup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRSureBackupJob](Get-VBRSureBackupJob)

* [Get-VBRApplicationGroup](Get-VBRApplicationGroup)

---

### Examples
> Example 1. Modifying Application Group of SureBackup Job

$surejob = Get-VBRSureBackupJob -Name "Exchange Job"
$appgroup = Get-VBRApplicationGroup -Name "Exchange Application Group"
Set-VBRSureBackupJob -Job $surejob -ApplicationGroup $appgroup
This example shows how to modify an application group for the SureBackup job named Exchange Job.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Specify the Name parameter value. Save the result to the $surejob variable.
2. Run the Get-VBRApplicationGroup cmdlet. Specify the Name parameter value. Save the result to the $appgroup variable.
3. Run the Set-VBRSureBackupJob cmdlet. Set the $surejob variable as the Job parameter value. Set the $appgroup variable as the ApplicationGroup parameter value.
> Example 2. Modifying Virtual Lab of SureBackup Job

$surejob = Get-VBRSureBackupJob -Name "Exchange Job"
$lab = Get-VBRVirtualLab -Name "Exchange Lab"
Set-VBRSureBackupJob -Job $surejob -VirtualLab $lab
This example shows how to modify a virtual lab for the SureBackup job named Exchange Job.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Specify the Name parameter value. Save the result to the $surejob variable.
2. Run the Get-VBRVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
3. Run the Set-VBRSureBackupJob cmdlet. Set the $surejob variable as the Job parameter value. Set the $lab variable as the VirtualLab parameter value.

---

### Parameters
#### **ApplicationGroup**
Specifies an application group. Veeam Backup & Replication will use this application group to use for recovery verification.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRApplicationGroup]`|false   |named   |False        |

#### **Description**
Specifies a description for a SureBackup job. The cmdlet will replace an existing description of the SureBackup job with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableLinkJob**
Defines that the cmdlet will link jobs with VMs that you want to verify with the SureBackup job.
If you provide this parameter, the Veeam Backup & Replication will verify VMs that are added to specified jobs with the SureBackup job. Otherwise, Veeam Backup & Replication will verify VMs from the application group only.
Provide the LinkedJob parameter to specify jobs that you want to link to a SureBackup job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSchedule**
Defines that the cmdlet will enable a schedule for a SureBackup job.
If you provide this option, the SureBackup job will run according the specified schedule. Otherwise, you must start the job manually.
Provide the ScheduleOptions parameter to specify the schedule options.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will not show any warnings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies a SureBackup job. The cmdlet will modify settings of this job.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRSureBackupJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **KeepApplicationGroupRunning**
Defines that VMs from an application group will run after the SureBackup job finishes.
If you provide this parameter, the application group will not be powered off when the SureBackup job finishes. Otherwise, the application group will be powered off.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LinkedJob**
Specifies a backup or replication job. The cmdlet will verify VMs that are added to this job with the SureBackup job.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRSureBackupLinkedJob[]]`|false   |named   |False        |

#### **MaxConcurrentVMs**
Specifies the maximum number of VMs that can be started at the same time.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Name**
Specifies a name for a SureBackup job. The cmdlet will replace an existing name of the SureBackup job with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ProcessRandomMachines**
Defines that the cmdlet will randomly test the specified number of machines from the linked job.
Use the RandomMachinesMaxCount parameter to specify the number of machines to randomly test.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RandomMachinesMaxCount**
Specifies the number of machines to randomly test during each run. The cmdlet will randomly test the specified number of machines from the linked job.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies schedule settings of a SureBackup job. Veeam Backup & Replication will run the job according to these settings.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRSureBackupJobScheduleOptions]`|false   |named   |False        |

#### **VerificationOptions**
Specifies recovery verification options for every VM from the jobs linked to the SureBackup job.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRSureBackupJobVerificationOptions]`|false   |named   |False        |

#### **VirtualLab**
Specifies a virtual lab. The cmdlet will use this virtual lab to verify VMs.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRVirtualLab]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSureBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSureBackupJob [-ApplicationGroup <VBRApplicationGroup>] [-Description <String>] [-EnableLinkJob] [-EnableSchedule] [-Force] -Job <VBRSureBackupJob> [-KeepApplicationGroupRunning] [-LinkedJob 
```
```PowerShell
<VBRSureBackupLinkedJob[]>] [-MaxConcurrentVMs <Int32>] [-Name <String>] [-ProcessRandomMachines] [-RandomMachinesMaxCount <Int32>] [-ScheduleOptions <VBRSureBackupJobScheduleOptions>] [-VerificationOptions 
```
```PowerShell
<VBRSureBackupJobVerificationOptions>] [-VirtualLab <VBRVirtualLab>] [<CommonParameters>]
```
