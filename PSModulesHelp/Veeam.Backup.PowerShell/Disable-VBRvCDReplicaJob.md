Disable-VBRvCDReplicaJob
------------------------

### Synopsis
Disables Cloud Director replication jobs.

---

### Description

This cmdlet disables Cloud Director replication jobs.
Run the Enable-VBRvCDReplicaJob cmdlet to enable Cloud Director replication jobs.

---

### Related Links
* [Get-VBRvCDReplicaJob](Get-VBRvCDReplicaJob)

---

### Examples
> Disabling vCD Replication Jobs

$replicavCD = Get-VBRvCDReplicaJob
Disable-VBRvCDReplicaJob -Job $replicavCD
This example shows how to disable Cloud Director replication jobs.

Perform the following steps:
1. Run the Get-VBRvCDReplicaJob cmdlet. Save the result to the $replicavCD variable.
2. Run the Disable-VBRvCDReplicaJob cmdlet. Set the $replicavCD variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of Cloud Director replication jobs. The cmdlet will disable these jobs.

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
Disable-VBRvCDReplicaJob -Job <VBRvCDReplicaJob[]> [<CommonParameters>]
```
