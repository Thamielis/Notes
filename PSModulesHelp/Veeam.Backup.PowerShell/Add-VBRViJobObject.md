Add-VBRViJobObject
------------------

### Synopsis
Adds VMs to VMware jobs.

---

### Description

This cmdlet adds VMs to an existing job.

You can run this cmdlet with any kind of jobs.

NOTE: The cmdlet will not run if the geographic location of the VMs added to the job and the job target repository location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Example 1. Adding VM to Job Represented by Variable [Using Pipeline]

$job = Get-VBRJob
Find-VBRViEntity -Name VM01 | Add-VBRViJobObject -Job $job
This example shows how to add a VM named VM01 to the job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Add-VBRViJobObject cmdlet. Set the $job variable as the Job parameter value.
> Example 2. Adding VM to Specific Job [Using Variables]

$job = Get-VBRJob
$Vm = Find-VBRViEntity
Add-VBRViJobObject -Job $job -Entities $Vm
This example shows how to add a VM represented by $Vm variable to the job represented by $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Find-VBRViEntity cmdlet. Save the result to the $Vm variable.
3. Run the Add-VBRViJobObject cmdlet. Set the $job variable as the Job parameter value. Set $Vm variable as the Entities parameter value.

---

### Parameters
#### **Entities**
Specifies the array of VMware VMs you want to add to the job.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[IViItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

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

#### **Multitag**
Defines that the cmdlet will add tags to an existing job. Note: This parameter is available starting from Veeam Backup & Replication 11a (build 11.0.1.1261).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Infrastructure.IViItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRViJobObject -Entities <IViItem[]> [-Force] -Job <CBackupJob> [-Multitag] [<CommonParameters>]
```
