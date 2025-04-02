Set-VBRJobOptions
-----------------

### Synopsis
Modifies job settings.

---

### Description

This cmdlet applies customized settings to a selected job.

Run the New-VBRJobOptions cmdlet to create the CJobOptions object. This object unifies all the options you want to apply to the job.

Important:
Consider the following:
- The Set-VBRJobOptions cmdlet is deprecated for Veeam Agent jobs and policies. Run the Set-VBRComputerBackupJob cmdlet instead.
- The Set-VBRJobOptions cmdlet is deprecated for backup copy jobs. Run the Set-VBRBackupCopyJob cmdlet instead.

Note:
To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [New-VBRJobOptions](New-VBRJobOptions)

---

### Examples
> Example 1. Defining Retention Policy for Backup Job

$retention = New-VBRJobOptions -ForBackupJob  
$retention.BackupStorageOptions.RetainCycles = 7  
$job = Get-VBRJob -Name "ABC Backup"  
Set-VBRJobOptions -Job $job -Options $retention
This example shows how to define the retention policy for a backup job.
Perform the following steps:
1. Run the New-VBRJobOptions cmdlet. Save the result to the $retention variable.
2. Specify the RetainCycles parameter of the BackupStorageOptions object for the $retention variable.
3. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
4. Run the Set-VBRJobOptions cmdlet. Set the $job variable as the Job parameter value. Set the $retention variable as the Options parameter value.
> Example 1. Applying Custom Settings to Specific Backup Job [Using Pipeline]

$options = New-VBRJobOptions  
Get-VBRJob -Name "Backup Job 01" | Set-VBRJobOptions -Options $options
This example shows how to apply custom settings to the backup job named Backup Job 01.
Perform the following steps:
1. Run the New-VBRJobOptions cmdlet. Save the result to the $options variable.
2. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Set-VBRJobOptions cmdlet. Set the $options variable as the Options parameter value.
> Example 3. Applying Custom Settings to Backup Job [Using Variable]

$job = Get-VBRJob -Name "Backup Job 01" 
$options = New-VBRJobOptions  
Set-VBRJobOptions -Job $job -Options $options
This example shows how to apply custom settings to the backup job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRJobOptions cmdlet. Save the result to the $options variable.
3. Run the Set-VBRJobOptions cmdlet. Set the $job variable as the Job parameter value. Set the $options variable as the Options parameter value.

---

### Parameters
#### **HighPriority**
Note: This parameter is available starting from Veeam Backup & Replication 11a (build 11.0.1.1261).
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and allocate resources to it first.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the job you want to edit.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Options**
Specifies the set of parameters you want to apply to the job.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CJobOptions]`|false   |1       |False        |

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
Set-VBRJobOptions [-Job] <CBackupJob[]> [[-Options] <CJobOptions>] [-HighPriority] [<CommonParameters>]
```
