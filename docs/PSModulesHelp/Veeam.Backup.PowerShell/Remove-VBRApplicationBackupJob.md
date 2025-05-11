Remove-VBRApplicationBackupJob
------------------------------

### Synopsis
Removes application backup policies.

---

### Description

This cmdlet removes application backup policies from Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRApplicationBackupJob](Get-VBRApplicationBackupJob)

---

### Examples
> Example - Removing Application Backup Policies

$job = Get-VBRApplicationBackupJob -Name "DbsSrv2049"
Remove-VBRApplicationBackupJob -Job $job
This cmdlet shows how to remove the DbsSrv2049 application backup policy from Veeam Backup & Replication infrastructure.

Perform the following steps:
1. Run the Get-VBRApplicationBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Remove-VBRApplicationBackupJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an application backup policy that you want to remove. Accepts the VBRApplicationBackupJob[] object. To get this object, run the Get-VBRApplicationBackupJob cmdlet.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRApplicationBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRApplicationBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRApplicationBackupJob [-Job] <VBRApplicationBackupJob[]> [<CommonParameters>]
```
