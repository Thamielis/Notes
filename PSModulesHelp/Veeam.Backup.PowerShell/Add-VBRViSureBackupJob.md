Add-VBRViSureBackupJob
----------------------

### Synopsis
Creates SureBackup jobs.

---

### Description

This cmdlet creates SureBackup jobs.

---

### Related Links
* [Get-VBRVirtualLab](Get-VBRVirtualLab)

* [Get-VBRApplicationGroup](Get-VBRApplicationGroup)

* [New-VBRSureBackupJobVerificationOptions](New-VBRSureBackupJobVerificationOptions)

* [New-VBRSureBackupJobScheduleOptions](New-VBRSureBackupJobScheduleOptions)

---

### Examples
> Example 1. Adding SureBackup Job

$lab = Get-VBRVirtualLab -Name "Virtual Lab 2"
Add-VBRViSureBackupJob -VirtualLab $lab -Name "Verification Job01" -Description "SureBackup Job for DNS"
This example shows how to create a SureBackup job.

Perform the following steps:

1. Run the Get-VBRVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.   2. Run the Add-VBRViSureBackupJob cmdlet. Specify the following settings:      o Set the $lab variable as the VirtualLab parameter value.      o Specify the Name parameter value.      o Specify the Description parameter value.
> Example 2. Adding SureBackup Job with Application Group

$lab = Get-VBRVirtualLab -Name "Virtual Lab 2"
$group = Get-VBRApplicationGroup -Name "Exchange Lab"
Add-VBRViSureBackupJob -VirtualLab $lab -ApplicationGroup $group -KeepApplicationGroupRunning
This example shows how to create a SureBackup job that will use the Exchange Group 3 application group for recovery verification. Veeam Backup & Replication will keep VMs from an application group running after the SureBackup job finishes.

Perform the following steps:

1. Run the Get-VBRVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.   2. Run the Get-VBRApplicationGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.   3. Run the Add-VBRViSureBackupJob cmdlet. Specify the following settings:      o Set the $lab variable as the VirtualLab parameter value.      o Specify the $group variable as the ApplicationGroup parameter value.      o Specify the KeepApplicationGroupRunning parameter.
> Example 3. Adding SureBackup Job with Recovery Verification Options

$lab = Get-VBRVirtualLab -Name "Virtual Lab 2"
$options = New-VBRSureBackupJobVerificationOptions
Add-VBRViSureBackupJob -VirtualLab $lab -VerificationOptions $options
This example shows how to create a SureBackup job with recovery verification options.

Perform the following steps:

1. Run the Get-VBRVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.   2. Run the New-VBRSureBackupJobVerificationOptions cmdlet. Specify the necessary parameters. Save the result to the $options variable.   3. Run the Add-VBRViSureBackupJob cmdlet. Specify the following settings:      o Set the $lab variable as the VirtualLab parameter value.      o Specify the $options variable as the VerificationOptions parameter value.
> Example 4. Adding SureBackup Job with Schedule Settings

$lab = Get-VBRVirtualLab -Name "Virtual Lab 2"
$schedule = New-VBRSureBackupJobScheduleOptions
Add-VBRViSureBackupJob -VirtualLab $lab -ScheduleOptions $schedule
This example shows how to create a scheduled SureBackup job.

Perform the following steps:

1. Run the Get-VBRVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.   2. Run the New-VBRSureBackupJobScheduleOptions cmdlet. Save the result to the $schedule variable.   3. Run the Add-VBRViSureBackupJob cmdlet. Set the $lab variable as the VirtualLab parameter value. Set the $schedule variable as the ScheduleOptions parameter value.

---

### Parameters
#### **ApplicationGroup**
Specifies a description for a SureBackup job. The cmdlet will create a SureBackup job with this description.

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
Defines that VMs from an application group will run after the SureBackup job finishes. If you provide this parameter, the application group will not be powered off when the SureBackup job finishes. Otherwise, the application group will be powered off.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LinkedJob**
Defines that VMs from an application group will run after the SureBackup job finishes. If you provide this parameter, the application group will not be powered off when the SureBackup job finishes. Otherwise, the application group will be powered off.

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

#### **ScheduleOptions**
Specifies schedule settings of a SureBackup job. Veeam Backup & Replication will run the job according to these settings. Accepts the VBRSureBackupJobScheduleOptions object. To create this object, run the New-VBRSureBackupJobScheduleOptions cmdlet.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRSureBackupJobScheduleOptions]`|false   |named   |False        |

#### **VerificationOptions**
Specifies additional settings for the SureBackup job Accepts the VBRSureBackupJobVerificationOptions object. To create this object, run the New-VBRSureBackupJobVerificationOptions cmdlet.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRSureBackupJobVerificationOptions]`|false   |named   |False        |

#### **VirtualLab**
Specifies a virtual lab. The cmdlet will use this virtual lab to verify VMs. Accepts the VBRVirtualLab object. To create this object, run the Get-VBRVirtualLab cmdlet.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRVirtualLab]`|false   |named   |False        |

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
Add-VBRViSureBackupJob [-ApplicationGroup <VBRApplicationGroup>] [-Description <String>] [-Force] [-KeepApplicationGroupRunning] [-LinkedJob <VBRSureBackupLinkedJob[]>] [-MaxConcurrentVMs <Int32>] [-Name 
```
```PowerShell
<String>] [-ScheduleOptions <VBRSureBackupJobScheduleOptions>] [-VerificationOptions <VBRSureBackupJobVerificationOptions>] [-VirtualLab <VBRVirtualLab>] [<CommonParameters>]
```
