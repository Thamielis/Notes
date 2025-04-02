Stop-VBRBackupCopyJob
---------------------

### Synopsis
Stops backup copy jobs.

---

### Description

This cmdlet stops backup copy jobs.

---

### Related Links
* [Get-VBRBackupCopyJob](Get-VBRBackupCopyJob)

---

### Examples
> Stopping Backup Copy Job

$job = Get-VBRBackupCopyJob -Name "Copy Job05"
Stop-VBRBackupCopyJob -Job $job
This example shows how to stop the backup copy job named Copy Job05.
Perform the following steps:
1. Run the Get-VBRBackupCopyJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Stop-VBRBackupCopyJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies a backup copy job that you want to stop.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRBackupCopyJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRBackupCopyJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRBackupCopyJob [-Job] <VBRBackupCopyJob[]> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
