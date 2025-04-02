Get-VBRJobObjectVssOptions
--------------------------

### Synopsis
Returns VSS settings of a specific VM in job.

---

### Description

This cmdlet returns VSS settings set for a specific VM in job.
Run the Get-VBRJobVssOptions cmdlet to get the list of VSS options of a specific job.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRJobObject](Get-VBRJobObject)

---

### Examples
> Example 1. Looking for VSS Settings of VM Included in Specific Job [Using Pipeline]

Get-VBRJob -Name "Exchange Backup Copy" | Get-VBRJobObject | Select -First 1 | Get-VBRJobObjectVssOptions
This example shows how to look for the VSS settings of the first VM included in the Exchange Backup Copy job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRJobObject cmdlet.
3. Pipe the cmdlet output to the Select. Set the 1 number as the First parameter value.
4. Pipe the cmdlet output to the Get-VBRJobObjectVssOptions cmdlet.
> Example 2. Looking for VSS Settings of VM [Using Variable]

$job = Get-VBRJob -Name "Exchange Backup Copy"
$vm = Get-VBRJobObject -Job $job
Get-VBRJobObjectVssOptions -ObjectInJob $vm
This example shows how to look for the VSS settings of the VM represented by the $vm variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRJobObject cmdlet. Set the $job variable as the Job parameter value. Save the result to the $vm variable.
3. Run the Get-VBRJobObjectVssOptions cmdlet. Set the $vm variable as the ObjectInJob parameter value.

---

### Parameters
#### **ObjectInJob**
Specifies the VMs or VM containers for which you want to get VSS options.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CObjectInJob]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CObjectInJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRJobObjectVssOptions [-ObjectInJob] <CObjectInJob> [<CommonParameters>]
```
