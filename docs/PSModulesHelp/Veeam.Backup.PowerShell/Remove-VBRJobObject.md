Remove-VBRJobObject
-------------------

### Synopsis
Removes VMs or VM containers from jobs.

---

### Description

This cmdlet allows you to remove VMs or VM containers from existing backup, replication or copy job.

You can remove the objects from job completely or only exclude them from processing.
- If you remove the objects completely, they are deleted from job settings and from Veeam database. Run the cmdlet with the Completely parameter for this.
- If you run the cmdlet without the Completely parameter, the job objects are only excluded from processing but remain in job settings.
Note that Veeam PowerShell does not allow you to include the excluded objects back to the job, you can do it only with Veeam Backup & Replication UI.

---

### Related Links
* [Get-VBRJobObject](Get-VBRJobObject)

* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Removing VM from Backup Job [Using Pipeline]

Get-VBRJob -Name "Fileservers Backup Job" | Get-VBRJobObject -Name "Fileserver03" | Remove-VBRJobObject
This example shows how to remove a Fileserver03 VM from the Fileservers Backup Job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter.
2. Pipe the cmdlet output to the Get-VBRJobObject cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Remove-VBRJobObject cmdlet.
4. Run the Get-VBRJobObject cmdlet again to check the VM state.
The cmdlet output will contain the following details on the VM state: Name, Type, ApproxSize and the Location.
> Example 2. Completely Removing VM from Backup Job [Using Pipeline]

Get-VBRJob -Name "Fileservers Backup Job" | Get-VBRJobObject -Name "Fileserver03" | Remove-VBRJobObject -Completely
This example shows how to completely remove a Fileserver03 VM from the Fileservers Backup Job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRJobObject cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Remove-VBRJobObject cmdlet. Provide the Completely parameter.
> Example 3. Removing Specific VMs from Backup Job [Using Variables]

$backupjob = Get-VBRJob -Name "Fileservers Backup Job"
$jobobject = Get-VBRJobObject -Job $backupjob -Name "Fileserver03", "Fileserver04"
Remove-VBRJobObject -Objects $jobobject
This example shows how to remove Fileserver03 and Fileserver04 VMs from the Fileservers Backup Job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $backupjob variable.
2. Run the Get-VBRJobObject cmdlet. Set the $backupjob variable as the Job parameter value. Specify the Name parameter value. Save the result to the $jobobject variable.
3. Run the Remove-VBRJobObject cmdlet. Set the $jobobject variable as the Objects parameter value.

---

### Parameters
#### **Completely**
If you provide this parameter, you will be able to permanently remove the job objects from the job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Objects**
Specifies an array of job objects (VMs and VM containers). The cmdlet will exclude these objects from processing by the job.
Note: If the job is processing VM containers, the Get-VBRJobObject cmdlet will return only VM containers. To exclude VMs from containers, use Veeam Backup & Replication UI.

|Type              |Required|Position|PipelineInput                 |Aliases|
|------------------|--------|--------|------------------------------|-------|
|`[CObjectInJob[]]`|true    |1       |True (ByPropertyName, ByValue)|VM     |

---

### Inputs
Veeam.Backup.Core.CObjectInJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRJobObject [-Objects] <CObjectInJob[]> [-Completely] [<CommonParameters>]
```
