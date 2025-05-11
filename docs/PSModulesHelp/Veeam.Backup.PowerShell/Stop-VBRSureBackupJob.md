Stop-VBRSureBackupJob
---------------------

### Synopsis
Stops the SureBackup job.

---

### Description

This cmdlet stops the SureBackup job.
Run the Start-VBRSureBackupJob cmdlet to start the SureBackup job.

---

### Related Links
* [Get-VBRSureBackupJob](Get-VBRSureBackupJob)

---

### Examples
> Stopping SureBackup Job

$job = Get-VBRSureBackupJob -Name "SureJob 2"
Stop-VBRSureBackupJob -Job $job
This example shows how to stop a SureBackup Job.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Stop-VBRSureBackupJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies a SureBackup job. The cmdlet will stop that job.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRSureBackupJobBase]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Veeam.Backup.PowerShell.Infos.VBRSureBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRSureBackupJob -Job <VBRSureBackupJobBase> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
