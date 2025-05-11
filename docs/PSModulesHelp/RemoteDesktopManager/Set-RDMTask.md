Set-RDMTask
-----------

### Synopsis
Save or update a task.

---

### Description

Save or update a task of the current data source. This feature is only available for the following data sources: Devolutions Server, Azure SQL, SQL Server, and SQLite. If the data source does not support users, the parameter User will be simply ignored. If a virtual folder is involved, the user must have the add and edit rights to save the tasks. To modify fields, this cmdlet parameters can be used or the PSTask can be modified directly. The confirmation impact (ConfirmImpact) is low.

---

### Related Links
* [Get-RDMUser](Get-RDMUser)

* [New-RDMTask](New-RDMTask)

* [Remove-RDMTask](Remove-RDMTask)

* [Set-RDMTask](Set-RDMTask)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMTask -Name ATask | Set-RDMTask -Comment "Task completed" -Status Closed
Add the comment "Task completed" to task ATask and close it. If the name is not unique, all tasks named ATask will have the modifications.
```
> EXAMPLE 2

```PowerShell
PS C:\> New-RDMTask -Name ATask -Entry AnEntry | Set-RDMTask -Force
Save a newly created task named ATask and associated with AnEntry without any confirmation prompt.
```
> EXAMPLE 3

```PowerShell
PS C:\> $user = Get-RDMUser -Name AUser; Get-RDMTask -Status Assigned -User $user | Set-RDMTask -UnassignUser
Unassign all the tasks assigned the user AUser.
```
> EXAMPLE 4

```PowerShell
PS C:\> $task = Get-RDMTask -Name ATask; $task.Task.CustomField1 = "Whatever"; Set-RDMTask $task
Store the uniquely named task ATask in $task. Add a value to the CustomField1 and save the modification using the only positional parameter.
```
> EXAMPLE 5

PS C:\> Get-RDMTask -Name ATask | Set-RDMTask $task -WhatIf -Verbose -Description 'NewDesc' -DueDate 2023/1/1 -Priority 3
Using the WhatIf and Verbose parameters, it will allow to determine if the task is created or updated and where exactly (data source name > entry name > task name). No modification will happen.

---

### Parameters
#### **Comment**
Modify the comment of the task.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Description**
Modify the description of the task.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **DueDate**
Specify the deadline to accomplish the task.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[DateFilter]`|false   |1       |false        |

#### **Force**
The task will be saved or created without confirmation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Name**
New name for the task.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|false   |1       |true (ByValue)|

#### **Priority**
Modify the priority of the task.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[DateFilter]`|false   |1       |false        |

#### **Status**
Modify the status of the task.
Valid Values:

* Assigned
* Cancelled
* Closed
* Done
* InProgress
* Open
* Postponed

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[TodoStatus]`|false   |1       |false        |

#### **Task**
Task to add or modify.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[PSTask]`|true    |2       |true (ByValue)|

#### **UnassignUser**
Remove the user assigned to the task.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **User**
Assign this user to the task. The user can be specified with his name, his email address, his ID or a PSUserInfo.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

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
For more information, type "Get-Help Set-RDMTask -detailed". For technical information, type "Get-Help Set-RDMTask -full".

---

### Syntax
```PowerShell
Set-RDMTask [[-Comment] <String>] [[-Description] <String>] [[-DueDate] <DateFilter>] [[-Force]] [[-Name] <String>] [[-Priority] <DateFilter>] [[-Status] <TodoStatus>] [-Task] <PSTask> [[-UnassignUser]] [[-User] <Object>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
