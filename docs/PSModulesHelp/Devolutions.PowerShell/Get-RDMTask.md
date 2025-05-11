Get-RDMTask
-----------

### Synopsis
Retrieve the list of tasks of the current data source.

---

### Description

Allows to search tasks with differents parameters on the user's main and private vaults. This feature is only available for the following data sources: Devolutions Server, Azure SQL, SQL Server, and SQLite. If the data source does not support users, the parameter User will be simply ignored. If a virtual folder is involved, the user must have the add and edit rights to obtain the tasks.

---

### Related Links
* [Get-RDMSession](Get-RDMSession)

* [Get-RDMPrivateSession](Get-RDMPrivateSession)

* [Get-RDMUser](Get-RDMUser)

* [New-RDMTask](New-RDMTask)

* [Remove-RDMTask](Remove-RDMTask)

* [Set-RDMTask](Set-RDMTask)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $tasks = Get-RDMTask -Entry AnEntry -CaseSensitive
Retrieves the tasks of the current data source associated with the entry AnEntry (case sensitive) and stores it in the variable $tasks.
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-RDMTask -Name Task* -Due Today -Status Open, Assigned, InProgress, Default
Obtain all the tasks of the current data source that are due Today and are still active.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-RDMTask -CreationDateStart 2022/1/1 -CreationDateEnd 2022/2/1 -DueDateStart 2022/2/1 -DueDateEnd 2022/3/1
Obtain all the tasks of the current data source that are due Today and are still active.
```
> EXAMPLE 4

```PowerShell
PS C:\> $user = Get-RDMUser -Name AUser; Get-RDMTask -Status Assigned -User $user | Set-RDMTask -UnassignUser
Unassign all the tasks assigned the user AUser.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive search when searching the name of the entry, task or user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CreationDateEnd**
The upper bound for the task's creation date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **CreationDateStart**
The lower bound for the task's creation date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **Due**
Filter the tasks based on their due date.
Valid Values:

* LastWeek
* Today
* Yesterday
* Custom
* LastMonth
* CurrentMonth
* Last7Days
* Last30Days
* Last31Days
* Last60Days
* Last90Days

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[DateFilter]`|false   |named   |false        |

#### **DueDateEnd**
The upper bound for a custom due date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **DueDateStart**
The lower bound for a custom due date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **Entry**
Entry the task is assigned to. It can be specified by ID, by name or by PSConnection. Entries in the private vault are accessible. For virtual folders, the add and edit rights are required to get the tasks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **LiteralName**
Name of the task. No characters are interpreted as wildcards.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Name**
Name of the task.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Status**
Filter the tasks based on the specified status. Multiple status are equivalent to an OR condition.
Valid Values:

* Default
* Open
* Assigned
* InProgress
* Closed
* Done
* Cancelled
* Postponed
* Deleted

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[TodoStatus[]]`|false   |named   |false        |

#### **User**
Task assigned to those user. The users can be specified with their name, their email address, their ID or their PSUserInfo.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTask

* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTask[]

---

### Notes
For more information, type "Get-Help Get-RDMTask -detailed". For technical information, type "Get-Help Get-RDMTask -full".

---

### Syntax
```PowerShell
Get-RDMTask [-CaseSensitive] [-CreationDateEnd <DateTime>] [-CreationDateStart <DateTime>] [-Due <LastWeek | Today | Yesterday | Custom | LastMonth | CurrentMonth | Last7Days | Last30Days | Last31Days | Last60Days | Last90Days>] [-DueDateEnd <DateTime>] [-DueDateStart <DateTime>] [-Entry <Object>] [-LiteralName <String[]>] [-Name <String[]>] [-Status <TodoStatus[]>] [-User <Object[]>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
