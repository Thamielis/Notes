Get-VBRLegacyBackupCopySourceJob
--------------------------------

### Synopsis
Returns legacy periodic backup copy job source objects.

---

### Description

This cmdlet returns legacy periodic backup copy job source objects.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Getting Source Objects of Legacy Periodic Backup Copy Job

$copyjob = Get-VBRJob -Name "LegacyPeriodicJob"
Get-VBRLegacyBackupCopySourceJob -Job $copyjob
This example shows how to get source objects of legacy periodic backup copy job named LegacyPeriodicJob.
Perform the following steps: 1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $copyjob variable.
2. Run the Get-VBRLegacyBackupCopySourceJob cmdlet. Set the $copyjob variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of jobs. The cmdlet will return source objects of these jobs.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CBackupJob]`|true    |0       |True (ByPropertyName, ByValue)|

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
Get-VBRLegacyBackupCopySourceJob [-Job] <CBackupJob> [<CommonParameters>]
```
