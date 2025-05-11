Add-VBRSureBackupContentScanJob
-------------------------------

### Synopsis
Creates a backup content scan SureBackup job.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet createsa SureBackup job that runs in the backup content scan verification mode. This SureBackup job performs only backup integrity check and its content analysis to detect traces of malware or any other unwanted or sensitive data. These tests do no require setting up a virtual lab or an application group.
Note that when you create a backup job, you need to run it manually unless you enable a job schedule.
Run the Start-VBRSureBackupJob cmdlet to run the job manually.
Run the New-VBRSureBackupJobScheduleOptions to set schedule for the job.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [New-VBRSureBackupLinkedJob](New-VBRSureBackupLinkedJob)

* [New-VBRSureBackupJobVerificationOptions](New-VBRSureBackupJobVerificationOptions)

* [New-VBRDailyOptions](New-VBRDailyOptions)

* [New-VBRSureBackupJobScheduleOptions](New-VBRSureBackupJobScheduleOptions)

---

### Examples
> Example 1. Adding Backup Content Scan SureBackup Job

$job = Get-VBRJob -Name "Exchange Job"
$linkedjob = New-VBRSureBackupLinkedJob -Job $job
$verification = New-VBRSureBackupJobVerificationOptions -EnableMalwareScan -EnableEntireImageScan -EnableYARAScan -YARAScanRule "Rule.yara"
Add-VBRSureBackupContentScanJob -LinkedJob $linkedjob -Name "Lite Verification Job" -VerificationOptions $verification -ProcessRandomMachines -RandomMachinesMaxCount "5" -Description "SureBackup Job for DNS"
This example shows how to create a backup content scan SureBackup job which will randomly scan 5 machines from the linked job named Exchange Job. Veeam Backup & Replication will scan these machines with antivirus software and the YARA rule.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRSureBackupLinkedJob cmdlet. Set the $job variable as the Job parameter value. Save the result to the $linkedjob variable.
3. Run the New-VBRSureBackupJobVerificationOptions cmdlet. Provide the EnableMalwareScan, the EnableEntireImageScan and the EnableYARAScan parameters. Specify the YARAScanRule parameter value. Save the result to the $verification variable.
4. Run the Add-VBRSureBackupContentScanJob cmdlet. Specify the following settings:
- Set the $linkedjob variable as the LinkedJob parameter value.
- Specify the Name parameter value.
- Set the $verification variable as the VerificationOptions parameter value.
- Provide the ProcessRandomMachines parameter.
- Specify the RandomMachinesMaxCount parameter value.
- Specify the Description parameter value.
> Example 2. Adding Backup Content Scan SureBackup Job with Schedule Settings

$job = Get-VBRJob -Name "Exchange Job"
$linkedjob = New-VBRSureBackupLinkedJob -Job $job
$verification = New-VBRSureBackupJobVerificationOptions -EnableMalwareScan -EnableEntireImageScan -EnableYARAScan -YARAScanRule "Rule.yara"
$daily = New-VBRDailyOptions -DayOfWeek "Friday" -Period "23:00"
$schedule = New-VBRSureBackupJobScheduleOptions -Type "Daily" -DailyOptions $daily
Add-VBRSureBackupContentScanJob -LinkedJob $linkedjob -VerificationOptions $verification -Name "Lite Verification Job" -ScheduleOptions $schedule -Description "SureBackup Job for DNS"
This example shows how to create a scheduled lite SureBackup job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRSureBackupLinkedJob cmdlet. Set the $job variable as the Job parameter value. Save the result to the $linkedjob variable.
3. Run the New-VBRSureBackupJobVerificationOptions cmdlet. Provide the EnableMalwareScan, the EnableEntireImageScan and the EnableYARAScan parameters. Specify the YARAScanRule parameter value. Save the result to the $verification variable.
4. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek parameter and the Period parameter values. Save the result to the $daily variable.
5. Run the New-VBRSureBackupJobScheduleOptions cmdlet. Specify the Type parameter value. Set the $daily variable as the DailyOptions parameter value. Save the result to the $schedule variable.
6.	Run the Add-VBRSureBackupContentScanJob cmdlet. Specify the following settings:
- Set the $linkedjob variable as the LinkedJob parameter value.
- Set the $verification variable as the VerificationOptions parameter value.
- Specify the Name parameter value.
- Set the $schedule variable as the ScheduleOptions parameter value.
- Specify the Description parameter value.

---

### Parameters
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

#### **LinkedJob**
Specifies a backup or replication job. The cmdlet will verify VMs that are added to this job with the lite SureBackup job.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRSureBackupLinkedJob[]]`|true    |named   |False        |

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

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RandomMachinesMaxCount**
Specifies the number of machines to randomly test during each run. The cmdlet will randomly test the specified number of machines from the linked job.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies schedule settings of a SureBackup job. Veeam Backup & Replication will run the job according to these settings.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRSureBackupJobScheduleOptions]`|false   |named   |False        |

#### **VerificationOptions**
Specifies verification settings for a SureBackup job.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRSureBackupJobVerificationOptions]`|true    |named   |False        |

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
Add-VBRSureBackupContentScanJob [-Description <String>] [-Force] -LinkedJob <VBRSureBackupLinkedJob[]> [-MaxConcurrentVMs <Int32>] [-Name <String>] [-ProcessRandomMachines] [-RandomMachinesMaxCount <Int32>] 
```
```PowerShell
[-ScheduleOptions <VBRSureBackupJobScheduleOptions>] -VerificationOptions <VBRSureBackupJobVerificationOptions> [<CommonParameters>]
```
