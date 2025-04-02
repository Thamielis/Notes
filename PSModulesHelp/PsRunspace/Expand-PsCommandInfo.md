Expand-PsCommandInfo
--------------------

### Synopsis
Return the original PsCommandInfo object as well as CommandInfo objects for any nested commands

---

### Description

---

### Parameters
#### **PsCommandInfo**
CommandInfo object for the command whose nested command names to return

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |1       |false        |

#### **Cache**
Cache of already identified CommmandInfo objects

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |2       |false        |

#### **DebugOutputStream**
Will be sent to the Type parameter of Write-LogMsg in the PsLogMessage module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **TodaysHostname**
Hostname to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **WhoAmI**
Username to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **LogBuffer**
Log messages which have not yet been written to disk

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |6       |false        |

---

### Syntax
```PowerShell
Expand-PsCommandInfo [[-PsCommandInfo] <PSObject>] [[-Cache] <Hashtable>] [[-DebugOutputStream] <String>] [[-TodaysHostname] <String>] [[-WhoAmI] <String>] [[-LogBuffer] <Hashtable>] [<CommonParameters>]
```
