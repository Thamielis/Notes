Start-VBRComputerBackupJob
--------------------------

### Synopsis
Starts Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Description

This cmdlet starts Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

---

### Examples
> Example 1. Starting Veeam Agent Backup Job

$job = Get-VBRComputerBackupJob -Name "WinSrv2049"
Start-VBRComputerBackupJob -Job $job
This example shows how to start the Veeam Agent backup job.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Start-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value.
> Example 2. Creating Full Backup by Veeam Agent Backup Job

$job = Get-VBRComputerBackupJob -Name "WinSrv2049"
Start-VBRComputerBackupJob -Job $job -FullBackup
This example shows how to create an active full backup by the Veeam Agent backup job.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Start-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value. Specify the FullBackup parameter.

---

### Parameters
#### **FullBackup**
Defines that the Veeam Agent backup job will create an active full backup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies a Veeam Agent backup job or a Veeam Agent backup policy that you want to start.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRComputerBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Object**
Specifies an array of protected machines.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRDiscoveredComputer[]]`|false   |named   |False        |

#### **RetryBackup**
Defines that Veeam Backup & Replication will restart the failed job. The cmdlet will start the job from the moment when it has failed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StartChainedJobs**
Defines that Veeam Backup & Replication will start jobs that are scheduled to run after this the Veeam Agent backup job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRComputerBackupJob [-Job] <VBRComputerBackupJob[]> [-FullBackup] [-Object <VBRDiscoveredComputer[]>] [-RetryBackup] [-RunAsync] [-StartChainedJobs] [<CommonParameters>]
```
