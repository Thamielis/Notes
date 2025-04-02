Stop-VBRMoveBackupSession
-------------------------

### Synopsis
Specifies how to process backups for which a move session failed.

---

### Description

This cmdlet specifies how to process backups for which the move session failed.

---

### Related Links
* [Get-VBRMoveBackupSession](Get-VBRMoveBackupSession)

---

### Examples
> Not Moving Backups for Which Session Failed

$sessions = Get-VBRMoveBackupSession 
Stop-VBRMoveBackupSession -ActionType DetachFailed -Session $sessions
This example shows how not to move backups for which the session failed.
Perform the following steps:
1. Run the Get-VBRMoveBackupSession cmdlet. Save the result to the $sessions variable.
2. Run the Stop-VBRMoveBackupSession cmdlet. Set the DetachFailed option for the ActionType parameter. Set the $sessions variable as the Session parameter value.

---

### Parameters
#### **ActionType**
Specifies what to do:
* DetachFailed: do not move backups for which the session failed.
* Undo: cancel all changes the move session made.
Valid Values:

* DetachFailed
* Undo

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[VBRBackupMoveCopySessionStopAction]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies the move session that failed (has the User action required status).

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
Stop-VBRMoveBackupSession [-ActionType {DetachFailed | Undo}] [-RunAsync] -Session <VBRMoveBackupSession> [-Confirm] [-WhatIf] [<CommonParameters>]
```
