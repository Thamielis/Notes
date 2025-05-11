Stop-VBRCopyBackupSession
-------------------------

### Synopsis
Specifies how to process backups for which a copy session failed.

---

### Description

This cmdlet specifies how to process backups for which a copy session failed.

---

### Examples
> Example 1

---

### Parameters
#### **ActionType**
Specifies what to do:
* DetachFailed: do not copy backups for which the session failed.
* Undo: cancel all changes the copy session made.
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
Specifies the copy session that failed (has the User action required status).

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRCopyBackupSession]`|true    |named   |False        |

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
Stop-VBRCopyBackupSession [-ActionType {DetachFailed | Undo}] [-RunAsync] -Session <VBRCopyBackupSession> [-Confirm] [-WhatIf] [<CommonParameters>]
```
