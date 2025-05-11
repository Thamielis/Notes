Remove-VBRSureBackupJob
-----------------------

### Synopsis
Removes SureBackup jobs.

---

### Description

This cmdlet removes SureBackup jobs from the Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRSureBackupJob](Get-VBRSureBackupJob)

---

### Examples
> Example 1. Removing All SureBackup Jobs

$job = Get-VBRSureBackupJob
Remove-VBRSureBackupJob -Job $job
This example shows how to remove all SureBackup jobs from the Veeam Backup & Replication infrastructure.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Save the result to the $job variable.
2. Run the Remove-VBRSureBackupJob cmdlet. Set the $job variable as the Job parameter value.
> Example 2. Removing Specific SureBackup Jobs

$job = Get-VBRSureBackupJob -Name "SureJob 2"
Remove-VBRSureBackupJob -Job $job
This example shows how to remove the SureJob 2 SureBackup jobs from the Veeam Backup & Replication infrastructure.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Remove-VBRSureBackupJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of SureBackup jobs. The cmdlet will remove these jobs from the Veeam Backup & Replication infrastructure.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRSureBackupJobBase[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRSureBackupJobBase[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRSureBackupJob -Job <VBRSureBackupJobBase[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
