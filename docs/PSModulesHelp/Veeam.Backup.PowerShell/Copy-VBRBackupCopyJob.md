Copy-VBRBackupCopyJob
---------------------

### Synopsis
Clones a backup copy job.

---

### Description

This cmdlet clones a backup copy job.

---

### Related Links
* [Get-VBRBackupCopyJob](Get-VBRBackupCopyJob)

---

### Examples
> Cloning Backup Copy Jobs

$copyjobs = Get-VBRBackupCopyJob
Copy-VBRBackupCopyJob -Job $copyjobs
This example shows how to clone backup copy jobs.
Perform the following steps:
1. Run the Get-VBRBackupCopyJob cmdlet. Save the result to the $copyjobs variable.
2. Run the Copy-VBRBackupCopyJob cmdlet. Set the $copyjobs variable as the Job parameter value.

---

### Parameters
#### **Description**
Specifies the description you want to assign to the backup copy job that you want to clone.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Job**
Specifies an array of backup copy jobs that you want to clone.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRBackupCopyJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name you want to assign to the backup copy that you want to clone.
Default: the name of the primary job with the _clone<clone sequence number> suffix.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Repository**
Specifies the repository to which you want to copy the backup job that you want to clone.
Note: If you do not specify this parameter, the cmdlet will copy the backup job to the same repository, where the original job stores backups.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRBackupCopyJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Copy-VBRBackupCopyJob [-Job] <VBRBackupCopyJob[]> [-Description <String[]>] [-Name <String[]>] [-Repository <CBackupRepository>] [<CommonParameters>]
```
