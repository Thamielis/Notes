Remove-VBRvCDReplicaJob
-----------------------

### Synopsis
Removes Cloud Director replication jobs.

---

### Description

This cmdlet removes Cloud Director replication jobs.

---

### Related Links
* [Get-VBRvCDReplicaJob](Get-VBRvCDReplicaJob)

---

### Examples
> Removing all vCD Replication Jobs from Backup Infrastructure

$replicavCD = Get-VBRvCDReplicaJob
Remove-VBRvCDReplicaJob -Job $replicavCD
This example shows how to remove all vCD replication jobs from the backup infrastructure.

Perform the following steps:
1. Run the Get-VBRvCDReplicaJob cmdlet. Save the result to the $replicavCD variable.
2. Run the Remove-VBRvCDReplicaJob cmdlet. Set the $replicavCD variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of Cloud Director replication jobs.
The cmdlet will remove these jobs from the backup infrastructure.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRvCDReplicaJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

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
Remove-VBRvCDReplicaJob -Job <VBRvCDReplicaJob[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
