Copy-VBRComputerBackupCopyJob
-----------------------------

### Synopsis
Clones Veeam Agent backup copy jobs. IMPORTANT! This cmdlet is obsolete and only works for cloning a simple mode backup copy job. It is recommended to clone a new backup job using the Copy-VBRBackupCopyJob cmdlet.

---

### Description

This cmdlet clones Veeam Agent backup copy jobs.

---

### Related Links
* [Get-VBRComputerBackupCopyJob](Get-VBRComputerBackupCopyJob)

---

### Examples
> Cloninig Veeam Agent Backup Copy Jobs

$copyjobs = Get-VBRComputerBackupCopyJob
Copy-VBRComputerBackupCopyJob -Job $copyjobs
This example shows how to copy Veeam Agent backup copy jobs.

Perform the following steps:

1. Get the Get-VBRComputerBackupCopyJob cmdlet. Save the result to the $copyjobs variables.   2. Run the Copy-VBRComputerBackupCopyJob cmdlet. Set the $copyjobs variable as the Job parameter value.

---

### Parameters
#### **Description**
Specifies the description you want to assign to the Veeam Agent backup copy job that you want to clone.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Job**
Specifies an array of Veeam Agent backup copy jobs that you want to clone. Accepts the VBRComputerBackupCopyJob[] object. To create this object, run the Get-VBRComputerBackupCopyJob cmdlet.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRComputerBackupCopyJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name you want to assign to the Veeam Agent backup copy that you want to clone. Default: the name of the primary job with the _clone<clone sequence number> suffix.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Repository**
Specifies the repository to which you want to copy to the Veeam Agent backup job that you want to clone.
NOTE: If you do not specify this parameter, the cmdlet will copy Veeam Agent backup jobs to the same repository, where the original job stores backups. Accepts the CBackupRepository object. To create this object, run Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerBackupCopyJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Copy-VBRComputerBackupCopyJob [-Job] <VBRComputerBackupCopyJob[]> [-Description <String[]>] [-Name <String[]>] [-Repository <CBackupRepository>] [<CommonParameters>]
```
