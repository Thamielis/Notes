Get-VBRViReplicaReIpRule
------------------------

### Synopsis
Returns VMware job re-IP rules.

---

### Description

This cmdlet returns the list of re-IP rules configured for a selected VMware replication job.

---

### Examples
> Example 1

$job = Get-VBRJob -Name "Backup Copy Job"
Get-VBRViReplicaReIpRule -Job $job
This example gets  re-IP rules set for a replication job.

Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Get-VBRViReplicaReIpRule cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the replication job for which you want to get the list of the re-IP rules.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CBackupJob]`|true    |named   |True (ByPropertyName, ByValue)|

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
Get-VBRViReplicaReIpRule -Job <CBackupJob> [<CommonParameters>]
```
