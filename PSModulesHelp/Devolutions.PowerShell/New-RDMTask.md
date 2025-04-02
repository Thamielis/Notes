New-RDMTask
-----------

### Synopsis
Create a new task.

---

### Description

Create a new task. It must have a name and be associated to an entry. This feature is only available for the following data sources: Devolutions Server, Azure SQL, SQL Server, and SQLite. If the data source does not support users, the parameter User will be simply ignored. If a virtual folder is involved, the user must have the add and edit rights to save the task.

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
PS C:\> $task = New-RDMTask TaskName EntryName
Create a task named TaskName and associated with the entry EntryName. This task is not saved yet, so it is stored in $task.
```
> EXAMPLE 2

```PowerShell
PS C:\> New-RDMTask -Name ATask -Entry AnEntry -Description 'What To Do' -Priority 10 -User AUsername -Status Assigned -SetTask
Create a task named ATask associated with the entry AnEntry. The task is assigned to AUsername and its status reflects it. It has a priority of 10 and a desciption of the task. This task is created in the data source.
```
> EXAMPLE 3

```PowerShell
PS C:\> $task = (Get-RDMPrivateSession -Name APrivateEntry | New-RDMTask -Name ATask -Comment 'For me only' -DueDate 2022/1/1)
Create a task named ATask associated with the private entry APrivateEntry. The task is not assigned and its status is the default value 'Open'. Its due date is the fist day of the year 2022. This task is not saved yet, so it is stored in $task.
```
> EXAMPLE 4

```PowerShell
PS C:\> New-RDMTask -Name ATask -Entry AnEntry | Set-RDMTask -Force
Save a newly created task named ATask and associated with AnEntry without any confirmation prompt.
```
> EXAMPLE 5

```PowerShell
PS C:\> $user = Get-RDMUser -Name Username; New-RDMTask -Name ATask -Entry AnEntry -User $user.Name -Status Assigned -SetTask
Save a newly created task named ATask and associated with AnEntry. The task is assigned to Username and its status reflects it.
```

---

### Parameters
#### **Comment**
Add a comment to the task.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Description**
Add the description to the task.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DueDate**
Add a deadline to accomplish the task.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **Entry**
Entry the task is assigned to. It can be specified by ID, by name or by PSConnection. Entries in the private vault are accessible.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |2       |true (ByValue)|

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

#### **Name**
Name of the task.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Priority**
Set the priority of the task. The default value is 1.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **SetTask**
Save the task.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Status**
Set the status of the task. By default, the status is Open.
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
|`[TodoStatus]`|false   |named   |false        |

#### **User**
Assign this user to the task. The user can be specified with his name, his email address, his ID or a PSUserInfo. The data source must support users.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

The entry obtained from Get-RDMSession or Get-RDMPrivateSession can be piped to the parameter Entry.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTask

---

### Notes
For more information, type "Get-Help New-RDMTask -detailed". For technical information, type "Get-Help New-RDMTask -full".

---

### Syntax
```PowerShell
New-RDMTask [-Name] <String> [-Entry] <Object> [-Comment <String>] [-Description <String>] [-DueDate <DateTime>] [-Priority <Int32>] [-SetTask] [-Status <Assigned | Cancelled | Closed | Done | InProgress | Open | Postponed>] [-User <Object>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
