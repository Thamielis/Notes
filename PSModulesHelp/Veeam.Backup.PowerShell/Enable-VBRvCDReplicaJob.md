Enable-VBRvCDReplicaJob
-----------------------

### Synopsis
Enables Cloud Director replication jobs.

---

### Description

This cmdlet enables Cloud Director replication jobs that were previously disabled.
Run the Disable-VBRvCDReplicaJob cmdlet to disable Cloud Director replication jobs.

---

### Related Links
* [Get-VBRvCDReplicaJob](Get-VBRvCDReplicaJob)

---

### Examples
> Enabling vCD Replication Jobs

$replicavCD = Get-VBRvCDReplicaJob
Enable-VBRvCDReplicaJob -Job $replicavCD
This example shows how to enable vCD replication jobs.

Perform the following steps:
1. Run the Get-VBRvCDReplicaJob cmdlet. Save the result to the $replicavCD variable.
2. Run the Enable-VBRvCDReplicaJob cmdlet. Set the $replicavCD variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of Cloud Director replication jobs.
The cmdlet will enable these jobs.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRvCDReplicaJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRvCDReplicaJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRvCDReplicaJob -Job <VBRvCDReplicaJob[]> [<CommonParameters>]
```
