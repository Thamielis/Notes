Retry-VBRMoveBackupSession
--------------------------

### Synopsis
Retries the move operation for failed workloads.

---

### Description

This cmdlet retries the move operation for failed workloads.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Move-VBRBackup](Move-VBRBackup)

---

### Examples
> Retrying Move Operation

$backup = Get-VBRBackup
$repository = Get-VBRBackupRepository
$session = Move-VBRBackup -Backup $backup -Repository $repository
Retry-VBRMoveBackupSession -Session $session
This examplse shows how to retry the move operation for failed workloads.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Save the result to the $backup variable.
2. Run the Get-VBRBackupRepository cmdlet. Save the result to the $repository variable.
3. Run the Move-VBRBackup cmdlet. Set the $backup variable as the Backup parameter value. Set the $repository variable as the Repository parameter value. Save the result to the $session variable.
3. Run the Retry-VBRMoveBackupSession cmdlet. Set the $session variable as the Session parameter value.

---

### Parameters
#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies the move session which you want to retry.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRMoveBackupSession]`|true    |named   |False        |

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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Retry-VBRMoveBackupSession [-RunAsync] -Session <VBRMoveBackupSession> [-Confirm] [-WhatIf] [<CommonParameters>]
```
