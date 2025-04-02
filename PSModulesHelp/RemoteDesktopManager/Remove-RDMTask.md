Remove-RDMTask
--------------

### Synopsis
Delete a task

---

### Description

Delete a task of the current data source. The deletion consists of setting the status to Deleted. The confirm impact level is low. This feature is only available for the following data sources: Devolutions Server, Azure SQL, SQL Server, and SQLite.

---

### Related Links
* [New-RDMTask](New-RDMTask)

* [Remove-RDMTask](Remove-RDMTask)

* [Set-RDMTask](Set-RDMTask)

---

### Examples
> EXAMPLE 1

Get-RDMTask | Remove-RDMTask -Force
Set the all tasks' status to Deleted without confirmation prompt.
> EXAMPLE 2

```PowerShell
Get-RDMTask -Due LastMonth | Where-Object AssignedToUserID -eq 00000000-0000-0000-0000-000000000000 | Remove-RDMTask -Force
Remove all the tasks that were due last month and are still unassigned without a confirmation prompt. The empty guid means it is unassigned.
```
> EXAMPLE 3

```PowerShell
Get-RDMTask -Status Done, Closed | Remove-RDMTask -Force
Remove all tasks that are done or closed without a confirmation prompt.
```

---

### Parameters
#### **Force**
The task will be saved or created without confirmation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Task**
Task to add or modify.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[PSTask]`|true    |2       |true (ByValue)|

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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTask

The task obtained from Get-RDMTask can be piped to the parameter Task.

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-RDMTask -detailed". For technical information, type "Get-Help Remove-RDMTask -full".

---

### Syntax
```PowerShell
Remove-RDMTask [[-Force]] [-Task] <PSTask> [-Confirm] [-WhatIf] [<CommonParameters>]
```
