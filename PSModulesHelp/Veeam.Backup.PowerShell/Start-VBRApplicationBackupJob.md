Start-VBRApplicationBackupJob
-----------------------------

### Synopsis
Starts application backup policies.

---

### Description

This cmdlet starts application backup policies.

---

### Related Links
* [Get-VBRApplicationBackupJob](Get-VBRApplicationBackupJob)

---

### Examples
> Example 1. Starting Application Backup Policy

$job = Get-VBRApplicationBackupJob -Name "DbsSrv2049"
Start-VBRApplicationBackupJob -Job $job
This example shows how to start the application backup policy.

Perform the following steps:
1. Run the Get-VBRApplicationBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Start-VBRApplicationBackupJob cmdlet. Set the $job variable as the Job parameter value.
> Example 2. Creating Full Backup by Application Backup Policy

$job = Get-VBRApplicationBackupJob -Name "DbsSrv2049"
Start-VBRApplicationBackupJob -Job $job -FullBackup
This example shows how to start the application backup policy.

Perform the following steps:
1. Run the Get-VBRApplicationBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Start-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value. Specify the FullBackup parameter.

---

### Parameters
#### **FullBackup**
Defines that the application backup policy will create an active full backup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies an application backup policy that you want to start. Accepts the VBRApplicationBackupJob[] object.  To get this object, run the Get-VBRApplicationBackupJob cmdlet.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRApplicationBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

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

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRApplicationBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRApplicationBackupJob [-Job] <VBRApplicationBackupJob[]> [-FullBackup] [-RetryBackup] [-RunAsync] [<CommonParameters>]
```
