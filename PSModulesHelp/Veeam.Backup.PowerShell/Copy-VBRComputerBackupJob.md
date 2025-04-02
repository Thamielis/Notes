Copy-VBRComputerBackupJob
-------------------------

### Synopsis
Clones Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Description

This cmdlet clones Veeam Agent backup jobs and Veeam Agent backup policies.
IMPORTANT! The job cloning functionality is available only in the Enterprise and Enterprise Plus, Veeam Universal License editions of Veeam Backup & Replication.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

---

### Examples
> Cloning Veeam Agent Backup Job

$job = Get-VBRComputerBackupJob -Name "WinSrv2049"
Copy-VBRComputerBackupJob -Job $job
This example shows how to clone the WinSrv2049 Veeam Agent backup job.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Copy-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Description**
Specifies a description of a cloned Veeam Agent backup job or a Veeam Agent backup policy.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Job**
Specifies a Veeam Agent backup job or a Veeam Agent backup policy that you want to clone.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRComputerBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Name**
Specifies a name of a cloned Veeam Agent backup job or a Veeam Agent backup policy.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Repository**
Specifies a backup repository. The cmdlet will keep backups of a cloned Veeam Agent backup job or a Veeam Agent backup policy on this backup repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

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
Copy-VBRComputerBackupJob [-Job] <VBRComputerBackupJob[]> [-Description <String[]>] [-Name <String[]>] [-Repository <CBackupRepository>] [<CommonParameters>]
```
