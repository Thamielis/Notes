Copy-VBRJob
-----------

### Synopsis
Clones existing jobs.

---

### Description

This cmdlet clones an existing job. You can use the cloned job, for example, as a template, as it retains all settings of the primary job.

You can run this cmdlet with backup, replication and copy jobs.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Cloning Specific Jobs [Using Pipeline]

Get-VBRJob -Name "DHCP Replica Job", "DHCP Backup Job" | Copy-VBRJob
This example shows how to clone the DHCP Replica Job and DHCP Backup Job jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Copy-VBRJob cmdlet.
> Example 2. Cloning Jobs [Using Variable]

$job = Get-VBRJob
Copy-VBRJob -Job $job
This example shows how to clone the job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Copy-VBRJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Description**
Specifies the description of the cloned job.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Job**
Specifies the array of jobs you want to clone.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name you want to assign to the cloned job. The maximum length is 50 symbols. If you exceed the length limit, the cloned job name will be cropped to 50 symbols. Default: the name of the primary job with the _clone<clone sequence number> suffix.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Repository**
Specifies the backup repository that will be used by the cloned job as a target.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

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
Copy-VBRJob [-Job] <CBackupJob[]> [-Description <String[]>] [-Name <String[]>] [-Repository <CBackupRepository>] [<CommonParameters>]
```
