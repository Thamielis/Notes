Start-VBRvCDReplicaJob
----------------------

### Synopsis
Starts Cloud Director replication jobs.

---

### Description

This cmdlet starts Cloud Director replication jobs.

---

### Related Links
* [Get-VBRvCDReplicaJob](Get-VBRvCDReplicaJob)

---

### Examples
> Starting vCD Replication Jobs

$replicavCD = Get-VBRvCDReplicaJob
Start-VBRvCDReplicaJob -Job $replicavCD
This example shows how to start all vCD replication jobs that are added to the backup infrastructure.

Perform the following steps:
1. Run the Get-VBRvCDReplicaJob cmdlet. Save the result to the $replicavCD variable.
2. Run the Start-VBRvCDReplicaJob cmdlet. Set the $replicavCD variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of Cloud Director replication jobs that you want to start.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRvCDReplicaJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Start-VBRvCDReplicaJob -Job <VBRvCDReplicaJob[]> [-RunAsync] [<CommonParameters>]
```
