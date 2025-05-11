Add-VBRSureBackupJob
--------------------

### Synopsis
Creates a SureBackup job.

---

### Description

This cmdlet creates a SureBackup job.
Note that when you create a backup job, you need to run it manually unless you enable a job schedule.
Run the Start-VBRSureBackupJob cmdlet to run the job manually.
Run the New-VBRSureBackupJobScheduleOptions to set schedule for the job.

---

### Related Links
* [Get-VBRVirtualLab](Get-VBRVirtualLab)

* [Get-VBRApplicationGroup](Get-VBRApplicationGroup)

* [New-VBRSureBackupJobVerificationOptions](New-VBRSureBackupJobVerificationOptions)

---

### Examples
> Example 1. Adding SureBackup Job

$lab = Get-VBRVirtualLab -Name "Virtual Lab 2"
$group = Get-VBRApplicationGroup -Name "Exchange Application Group"
Add-VBRSureBackupJob -ApplicationGroup $group -VirtualLab $lab -Name "Verification Job01" -Description "SureBackup Job for DNS"
This example shows how to create a SureBackup job.
Perform the following steps:
1. Run the Get-VBRVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
2. Run the Get-VBRApplicationGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
3. Run the Add-VBRSureBackupJob cmdlet. Specify the following settings:
- Set the $lab variable as the VirtualLab parameter value.

- Set the $group variable as the ApplicationGroup parameter value.

- Specify the Name parameter value.

- Specify the Description parameter value.
> Example 2. Adding SureBackup Job with Application Group

$lab = Get-VBRVirtualLab -Name "Virtual Lab 2"
$group = Get-VBRApplicationGroup -Name "Exchange Lab"
Add-VBRSureBackupJob -VirtualLab $lab -ApplicationGroup $group -KeepApplicationGroupRunning
This example shows how to create a SureBackup job that will use the Exchange Group 3 application group for recovery verification.
Veeam Backup & Replication will keep VMs from an application group running after the SureBackup job finishes.
Perform the following steps:
1. Run the Get-VBRVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
2. Run the Get-VBRApplicationGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
3. Run the Add-VBRSureBackupJob cmdlet. Specify the following settings:
- Set the $lab variable as the VirtualLab parameter value.
- Specify the $group variable as the ApplicationGroup parameter value.
- Provide the KeepApplicationGroupRunning parameter.
> Example 3. Adding SureBackup Job with Recovery Verification Options

$lab = Get-VBRVirtualLab -Name "Virtual Lab 2"
$options = New-VBRSureBackupJobVerificationOptions
$group = Get-VBRApplicationGroup -Name "Exchange Lab"
Add-VBRSureBackupJob -VirtualLab $lab -VerificationOptions $options -ApplicationGroup $group
This example shows how to create a SureBackup job with recovery verification options.
Perform the following steps:
1. Run the Get-VBRVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
2. Run the New-VBRSureBackupJobVerificationOptions cmdlet. Save the result to the $options variable.
3. Run the Get-VBRApplicationGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
4. Run the Add-VBRSureBackupJob cmdlet. Specify the following settings:
- Set the $lab variable as the VirtualLab parameter value.
- Specify the $options variable as the VerificationOptions parameter value.
- Specify the $group variable as the ApplicationGroup parameter value.

---

### Parameters
#### **ApplicationGroup**
Specifies an application group. Veeam Backup & Replication will use this application group to use for recovery verification.
Note: You must specify either the ApplicationGroup or the LinkedJob parameter to run the cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRApplicationGroup]`|false   |named   |False        |

#### **Description**
Specifies a description for a SureBackup job. The cmdlet will create a SureBackup job with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will not show any warnings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **KeepApplicationGroupRunning**
Defines that VMs from an application group will run after the SureBackup job finishes.
If you provide this parameter, the application group will not be powered off when the SureBackup job finishes. Otherwise, the application group will be powered off.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LinkedJob**
Specifies a backup or replication job. The cmdlet will verify VMs that are added to this job with the SureBackup job.
Note: You must specify either the LinkedJob or the ApplicationGroup parameter to run the cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRSureBackupLinkedJob[]]`|false   |named   |False        |

#### **MaxConcurrentVMs**
Specifies the maximum number of VMs that can be started at the same time.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Name**
Specifies a name for a SureBackup job. The cmdlet will create a SureBackup job with this name.

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
Specifies additional settings for the SureBackup job.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRSureBackupJobVerificationOptions]`|false   |named   |False        |

#### **VirtualLab**
Specifies a virtual lab. The cmdlet will use this virtual lab to verify VMs.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRVirtualLab]`|true    |named   |False        |

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
Add-VBRSureBackupJob [-ApplicationGroup <VBRApplicationGroup>] [-Description <String>] [-Force] [-KeepApplicationGroupRunning] [-LinkedJob <VBRSureBackupLinkedJob[]>] [-MaxConcurrentVMs <Int32>] [-Name 
```
```PowerShell
<String>] [-ProcessRandomMachines] [-RandomMachinesMaxCount <Int32>] [-ScheduleOptions <VBRSureBackupJobScheduleOptions>] [-VerificationOptions <VBRSureBackupJobVerificationOptions>] -VirtualLab <VBRVirtualLab> 
```
```PowerShell
[<CommonParameters>]
```
