Get-VBRJobProxy
---------------

### Synopsis
Returns a list of proxy servers assigned to a specific job.

---

### Description

This cmdlet returns proxy servers assigned to a specific job. If the automatic proxy selection is enabled, the cmdlet will return a warning.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Getting List of Target Proxies [Using Pipeline]

Get-VBRJob -Name "Backup Copy" | Get-VBRJobProxy -Target
This example shows how to get a list of target proxies assigned to the Backup Copy job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRJobProxy cmdlet. Provide the Target parameter.
> Example 2. Getting List of Target Proxies [Using Variable]

$job = Get-VBRJob -Name "Backup Copy"
Get-VBRJobProxy -Job $job -Target
This example shows how to get a list of proxies assigned to the Backup Copy job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRJobProxy cmdlet. Set the $job variable as the Job parameter value. Provide the Target parameter.

---

### Parameters
#### **Job**
Specifies an array of jobs. The cmdlet will return proxies assigned to these jobs.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Target**
Defines that the cmdlet will return only target proxies.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Get-VBRJobProxy -Job <CBackupJob[]> [-Target] [<CommonParameters>]
```
