Open-Thread
-----------

### Synopsis
Prepares each thread so it is ready to execute a command and capture the output streams

---

### Description

Used by Split-Thread

For each InputObject an instance will be created of [System.Management.Automation.PowerShell]
Then a series of commands will be run to enable the specified output streams (all by default)

---

### Parameters
#### **InputObject**
Objects to pass to the Command as an argument or parameter

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Object]`|false   |1       |true (ByValue, ByPropertyName)|

#### **RunspacePool**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[RunspacePool]`|true    |2       |false        |

#### **ObjectStringProperty**
Name of a property (whose value is a string) that exists on each $InputObject
It will be used to represent the object in text form
If left null, the object's ToString() method will be used instead.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Command**
PowerShell Command or Script to run against each InputObject

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |4       |false        |

#### **CommandInfo**
Output from Get-PsCommandInfo

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSObject[]]`|false   |5       |false        |

#### **InputParameter**
Named parameter of the Command to pass InputObject to
If this is not specified, InputObject will be passed to the Command as an argument

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **AddParam**
Parameters to add to the Command
Each parameter is a name-value pair in the hashtable:
    @{"ParameterName" = "Value"}
    @{"ParameterName" = "Value" ; "ParameterTwo" = "Value2"}

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |7       |false        |

#### **AddSwitch**
Switches to add to the Command

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |8       |false        |

#### **DebugOutputStream**
Will be sent to the Type parameter of Write-LogMsg in the PsLogMessage module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **TodaysHostname**
Hostname to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **WhoAmI**
Username to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **LogBuffer**
Log messages which have not yet been written to disk

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |12      |false        |

#### **ProgressParentId**
ID of the parent progress bar under which to show progres

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |13      |false        |

---

### Syntax
```PowerShell
Open-Thread [[-InputObject] <Object>] [-RunspacePool] <RunspacePool> [[-ObjectStringProperty] <String>] [-Command] <Object> [[-CommandInfo] <PSObject[]>] [[-InputParameter] <String>] [[-AddParam] <Hashtable>] [[-AddSwitch] <String[]>] [[-DebugOutputStream] <String>] [[-TodaysHostname] <String>] [[-WhoAmI] <String>] [[-LogBuffer] <Hashtable>] [[-ProgressParentId] <Int32>] [<CommonParameters>]
```
