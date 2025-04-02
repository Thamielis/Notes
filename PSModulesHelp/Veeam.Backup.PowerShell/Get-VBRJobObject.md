Get-VBRJobObject
----------------

### Synopsis
Returns VMs or VM containers of specific jobs.

---

### Description

This cmdlet returns the following VMs or VM containers of specific jobs:
- VMs
- VM containers
- Datastores
- Resource pools
You can run this cmdlet for backup, replication, backup copy, VM copy or file copy jobs.
Note: The cmdlet returns only the objects added to a job. For example, if you have added datastores, the cmdlet will return these datastores. The cmdlet will not return VMs from these datastores.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Looking for VM in Specific Job [Using Pipeline]

Get-VBRJob -Name "VM Copy Job 01" | Get-VBRJobObject -Name *SharePoint*
This example shows how to look for the SharePoint VM in the VM Copy Job 01 job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRJobObject cmdlet. Specify the Name parameter.
> Example 2. Looking for VM in Specific Job [Using Variable]

$job = Get-VBRJob
Get-VBRJobObject -Job $job -Name "SharePoint"
This example shows how to look for the SharePoint VM in the job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Get-VBRJobObject cmdlet. Set the $job variable as the Job parameter value. Specify the Name parameter.

---

### Parameters
#### **Job**
Specifies the job. The cmdlet will return objects of this job.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CBackupJob]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of job object names (for example, VMs). The cmdlet will filter the objects of the job by these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRJobObject [-Job] <CBackupJob> [-Name <String[]>] [<CommonParameters>]
```
