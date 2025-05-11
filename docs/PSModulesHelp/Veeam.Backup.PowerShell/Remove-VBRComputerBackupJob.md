Remove-VBRComputerBackupJob
---------------------------

### Synopsis
Removes Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Description

This cmdlet removes Veeam Agent backup jobs and Veeam Agent backup policies from Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

---

### Examples
> Removing Veeam Agent Backup Jobs

$job = Get-VBRComputerBackupJob -Name "WinSrv2049"
Remove-VBRComputerBackupJob -Job $job
This cmdlet shows how to remove the WinSrv2049 Veeam Agent backup job from Veeam Backup & Replication infrastructure.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Remove-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies a Veeam Agent backup job or a Veeam Agent backup policy that you want to remove.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRComputerBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRComputerBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRComputerBackupJob [-Job] <VBRComputerBackupJob[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
