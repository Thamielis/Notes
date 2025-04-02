Add-VBRHvJobObject
------------------

### Synopsis
Adds VMs to Hyper-V jobs.

---

### Description

This cmdlet adds VMs to Hyper-V jobs.

You can run this cmdlet with any kind of jobs.

NOTE: The cmdlet will not run if the geographic location of the VMs added to the job and the job target repository location do not match.  If you still want to run the cmdlet, use the Force parameter.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Find-VBRHvEntity](Find-VBRHvEntity)

---

### Examples
> Example 1. Adding VM to Job Represented by Variable [Using Pipeline]

$BackupHVJob = Get-VBRJob
Find-VBRHvEntity -Name VM01 | Add-VBRHvJobObject -Job $BackupHvJob
This example shows how to add a VM named VM01 to the job represented by the $BackupHVJob variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $BackupHVJob variable.
2. Run the Find-VBRHvEntity cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Add-VBRHvJobObject cmdlet. Set the $BackupHvJob variable as the Job parameter value.
> Example 2. Adding VM to Specific Job [Using Variables]

$BackupHvJob = Get-VBRJob
$Vm = Find-VBRHvEntity
Add-VBRHvJobObject -Job $BackupHvJob -Entities $Vm
This example shows how to add a VM represented by $Vm variable to the job represented by $BackupHvJob variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $BackupHvJob variable.
2. Run the Find-VBRHvEntity cmdlet. Save the result to the $Vm variable.
3. Run the Add-VBRHvJobObject cmdlet. Set the $BackupHvJob variable as the Job parameter value. Set the $Vm variable as the Entities parameter value.

---

### Parameters
#### **Entities**
Specifies the array of Hyper-V VMs you want to add to the job.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[IHvItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will add VMs to the existing job even if the geographic location of these VMs and the target backup repository location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the job. The cmdlet will add VMs to this job.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CBackupJob]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.Core.HyperV.Infrastructure.IHvItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRHvJobObject -Entities <IHvItem[]> [-Force] -Job <CBackupJob> [<CommonParameters>]
```
