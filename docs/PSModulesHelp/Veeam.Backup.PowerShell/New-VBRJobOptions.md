New-VBRJobOptions
-----------------

### Synopsis
Creates new job options.

---

### Description

This cmdlet returns the CJobOptions object. This object contains the default settings of the job you want to edit. You can customize any setting that you want to apply to a backup job, replication job or selected VMs.

Run the Set-VBRJobOptions cmdlet to apply the modified options to a job.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Set-VBRJobOptions](Set-VBRJobOptions)

---

### Examples
> Defining Retention Policy for Backup Job

$retention = New-VBRJobOptions -ForBackupJob
$retention.BackupStorageOptions.RetainCycles = 7
$job = Get-VBRJob -Name "ABC Backup"
Set-VBRJobOptions -Job $job -Options $retention
This example shows how to define the retention policy for a backup job.
Perform the following steps:
1. Run the New-VBRJobOptions cmdlet. Provide the ForBackupJob parameter. Save the result to the $retention variable.
2. Specify the RetainCycles parameter of the BackupStorageOptions object for the $retention variable.
3. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
4. Run the Set-VBRJobOptions cmdlet. Set the $job variable as the Job parameter value. Set the $retention variable as the Options parameter value.

---

### Parameters
#### **ForBackupJob**
Defines that the cmdlet will return default settings for backup job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ForReplicaJob**
Defines that the cmdlet will return default settings for replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
New-VBRJobOptions [-ForBackupJob] [<CommonParameters>]
```
```PowerShell
New-VBRJobOptions [-ForReplicaJob] [<CommonParameters>]
```
