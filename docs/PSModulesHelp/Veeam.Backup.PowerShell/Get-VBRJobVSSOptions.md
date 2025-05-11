Get-VBRJobVSSOptions
--------------------

### Synopsis
Returns VSS settings for a selected job.

---

### Description

This cmdlet returns VSS settings for a selected job.
Run the Get-VBRJobObjectVssOptions cmdlet to get the list of VSS options set for specific objects in a job.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRJobObject](Get-VBRJobObject)

---

### Examples
> Example 1. Looking for List of VSS Options of Specific Job [Using Pipeline]

Get-VBRJob -Name "ActiveDirectory Backup" | Get-VBRJobVSSOptions
This example shows how to look for the list of VSS options of the ActiveDirectory Backup job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRJobVSSOptions cmdlet.
> Example 2. Looking for List of Options of Job [Using Variable]

$ad_backup = Get-VBRJob -Name "ActiveDirectory Backup"
Get-VBRJobVSSOptions -Job $ad_backup
This example shows how to look for the list of options of the job represented by the $ad_backup variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $ad_backup variable.
2. Run the Get-VBRJobVSSOptions cmdlet. Set the $ad_backup variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the job you want to get the VSS options of.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

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
Get-VBRJobVSSOptions [-Job] <CBackupJob[]> [<CommonParameters>]
```
