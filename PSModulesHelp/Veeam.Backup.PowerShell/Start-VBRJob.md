Start-VBRJob
------------

### Synopsis
Starts a backup or replication job.

---

### Description

This cmdlet allows you to start a created or stopped job. You can start a backup or replication job.
This cmdlet allows you to start a job for an ordinary run, force a full backup, or set the job to restart in case it failed.
When you create a job, you need to run it manually unless you enable a job schedule. Run the Set-VBRJobSchedule cmdlet to schedule the job to run automatically.
Run the Stop-VBRJob cmdlet to stop a running job.
Run the Enable-VBRJob cmdlet to enable a disabled job.
Run the Sync-VBRBackupCopyJob cmdlet to start a SureBackup job.
Run the Start-VBRComputerBackupJob cmdlet to start Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Add-VBRvCloud](Add-VBRvCloud)

* [Add-VBRvCloudJob](Add-VBRvCloudJob)

---

### Examples
> Example 1. Starting Specific Job [Using Pipeline]

Get-VBRJob -Name "WebApplications Server Backup", "Fileserver Copy Job" | Start-VBRJob
This example shows how to start the WebApplications Server Backup and Fileserver Copy Job jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Start-VBRJob cmdlet.
> Example 2. Starting vCloud Backup Job [Using Pipeline]

$vCloudServer = Add-VBRvCloud -Name "vCloudDirectorServer.domain.com" -User Administrator -Password password -Url "https://vclouddirectorserver:443" -Description "vCloud Director Server"
Add-VBRvCloudJob -Entity $vCloudServer -Name "vCloud Server Backup" | Start-VBRJob -RunAsync
This example shows how to start a vCloud backup job right after it the job is created. The RunAsync parameter is set to bring the process to the background.
Perform the following steps:
1. Run the Add-VBRvCloud cmdlet. Specify the necessary parameters. Save the result to the $vCloudServer variable.
2. Run the Add-VBRvCloudJob cmdlet. Set the $vCloudServer variable as the Entity parameter value. Specify the Name parameter value.
3. Pipe the cmdlet output to the Start-VBRJob cmdlet. Provide the RunAsync parameter.
> Example 3. Performing Full Backup [Using Pipeline]

Get-VBRJob -Name "WebApplications Server Backup" | Start-VBRJob -FullBackup
This example shows how to perform a full backup for the WebApplications Server Backup job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Start-VBRJob cmdlet. Provide the FullBackup parameter.
> Example 4. Restarting Failed Job [Using Variable]

$job = Get-VBRJob
Start-VBRJob -Job $job -RetryBackup -RunAsync
This example shows how to restart a failed job represented by the $job variable. The RunAsync parameter is set to bring the process to the background.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Start-VBRJob cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Provide the RetryBackup parameter.
- Provide the RunAsync parameter.

---

### Parameters
#### **FullBackup**
Defines that the job will create an active full backup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the array of jobs you want to start.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Object**
Specifies an array of job objects (VMs and VM containers). The cmdlet will start jobs with these objects.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CObjectInJob[]]`|false   |named   |False        |

#### **RetryBackup**
Defines that Veeam Backup & Replication will restart the job in case it fails.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StartChainedJobs**
Defines that Veeam Backup & Replication will start jobs that are scheduled to run after this job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRJob [-Job] <CBackupJob[]> [-FullBackup] [-Object <CObjectInJob[]>] [-RetryBackup] [-RunAsync] [-StartChainedJobs] [<CommonParameters>]
```
