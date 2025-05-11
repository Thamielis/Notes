Add-VBRvCloudJobObject
----------------------

### Synopsis
Adds VMs to vCD backup jobs.

---

### Description

This cmdlet adds VMs to vCD backup jobs.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

---

### Examples
> Adding VMs to vCD Backup Job

$job = Get-VBRJob -Name "Cloud backup job"
$vm = Find-VBRvCloudEntity -Name "WinSrv2907"
Add-VBRvCloudJobObject -Job $job -Entities $vm
This example shows how to add the WinSrv2907 VM to the Cloud backup job vCD backup job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Find-VBRvCloudEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
3. Run the Add-VBRvCloudJobObject cmdlet. Set the $job variable as the Job parameter value. Set the $vm variable as the Entities parameter value.

---

### Parameters
#### **Entities**
Specifies an array of VMs that you want to add to a vCD backup job.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[IVcdItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will add VMs to a vCD backup job without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies a vCD backup job. The cmdlet will add VMs to this vCD backup job.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CBackupJob]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.Core.Infrastructure.IVcdItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRvCloudJobObject -Entities <IVcdItem[]> [-Force] -Job <CBackupJob> [<CommonParameters>]
```
