Start-At
--------

### Synopsis
Starts scripts at a time or event

---

### Description

Starts scripts at a time, an event, or a change in a table

---

### Related Links
* [Use-Schematic](Use-Schematic)

---

### Examples
> EXAMPLE 1

```PowerShell
Start-At -Boot -RepeatEvery "0:30:0" -Name LogTime -ScriptBlock {         
    "$(Get-Date)" | Set-Content "$($env:Public)\$(Get-Random).txt"
}
```

---

### Parameters
#### **ScriptBlock**
The scriptblock that will be run

|Type             |Required|Position|PipelineInput |
|-----------------|--------|--------|--------------|
|`[ScriptBlock[]]`|true    |named   |true (ByValue)|

#### **Time**
The time the script will start

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|true    |named   |false        |

#### **EventId**
The event ID of interest

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|true    |named   |false        |

#### **EventLog**
The event log where the eventID is found

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **TableName**
The table name that contains data to process

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **UserTableName**
The name of the user table.  If an OwnerID is found on an object, and user is found in the a usertable, then the task will be run as that user

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Filter**
The filter used to scope queries for table data

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Where**
The filter used to scope queries for table data

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **StorageAccountSetting**
The name of the  setting containing the storage account

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StorageKeySetting**
The name of the setting containing the storage key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ClearProperty**
Clears a property on the object when the item has been handled

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **EmailUserNameSetting**
The name of the setting containing the email username

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **EmailPasswordSetting**
The name of the setting containing the email password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **SentTo**
The display name of the inbox receiving the mail.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ConnectionStringSetting**
The name of the setting containing the storage key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UserPartition**
The partition containing user information.  If the items in the table have an owner, then the will be run in an isolated account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CheckEvery**
The timespan in between queries

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **SortDescending**
The timespan in between queries

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Jitter**
The randomized delay surrounding a task start time.  This can be used to load-balance expensive executions

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **EveryDay**
If set, the task will be started every day at this time

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DayInterval**
The interval (in days) in between running the task

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Lock**
If set, the task will be started whenever the machine is locked

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Boot**
If set, the task will be started whenever the machine is unlocked

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Logon**
If set, the task will be started whenever the machine is unlocked

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Unlock**
If set, the task will be started whenever the machine is unlocked

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **LocalLogon**
If set, the task will be started whenever a user logs onto the local machine

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **LocalLogoff**
If set, the task will be started whenever a user logs off of a local machine

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **RemoteLogon**
If set, the task will be started whenever a user disconnects via remote deskop

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **RemoteLogoff**
If set, the task will be started whenever a user disconnects from remote desktop

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Now**
Starts the task as soon as possible

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|true    |named   |false        |ASAP   |

#### **ByUser**
IF provided, will scope logons or connections to a specific user

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **As**
The user running the script

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

#### **ComputerName**
The name of the computer the task will be run on.  If not provided, the task will be run locally

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |On     |

#### **RepeatEvery**
If set, the task will repeat at this frequency.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **RepeatFor**
If set, the task will repeat for up to this timespan.  If not set, the task will repeat indefinately.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **Name**
A name for the task.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Folder**
The name of the folder within Task Scheduler.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NoExit**
If set, will not exist the started task.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TaskPriority**
The priority of the scheduled task

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **MultipleInstancePolicy**
How multiple instances of a task should be treated.  By default, multiple instances are queued.
Valid Values:

* StopExisting
* Queue
* Parallel
* IgnoreNew

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SelfDestruct**
If set, the task will self destruct after it as run once.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NotInteractive**
If set, tasks registered with a credential will be registered with TASK_LOGON_PASSWORD, which will prevent the scheduled task from popping up a visible window.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -Time <DateTime> [-Jitter <TimeSpan>] [-EveryDay] [-DayInterval] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -EventId <UInt32> -EventLog <String> [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -TableName <String> [-UserTableName <String>] [-StorageAccountSetting <String>] [-StorageKeySetting <String>] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -TableName <String> [-UserTableName <String>] -Filter <String> [-StorageAccountSetting <String>] [-StorageKeySetting <String>] [-ClearProperty <String>] [-UserPartition <String>] [-CheckEvery <TimeSpan>] [-SortDescending] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -Where <String> [-ConnectionStringSetting <String>] [-CheckEvery <TimeSpan>] [-SortDescending] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> [-StorageAccountSetting <String>] [-StorageKeySetting <String>] -EmailUserNameSetting <String> -EmailPasswordSetting <String> -SentTo <String> [-CheckEvery <TimeSpan>] [-SortDescending] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> [-Lock] [-ByUser <String>] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -Boot [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -Logon [-ByUser <String>] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -Unlock [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -LocalLogon [-ByUser <String>] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -LocalLogoff [-ByUser <String>] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -RemoteLogon [-ByUser <String>] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -RemoteLogoff [-ByUser <String>] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> -Now [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> [-ByUser <String>] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
```PowerShell
Start-At -ScriptBlock <ScriptBlock[]> [-ByUser <String>] [-As <PSCredential>] [-ComputerName <String>] [-RepeatEvery <TimeSpan>] [-RepeatFor <TimeSpan>] [-Name <String>] [-Folder <String>] [-NoExit] [-TaskPriority <UInt32>] [-MultipleInstancePolicy <String>] [-SelfDestruct] [-NotInteractive] [<CommonParameters>]
```
