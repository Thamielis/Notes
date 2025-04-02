Wait-Thread
-----------

### Synopsis
Waits for a thread to be completed so the results can be returned, or for a timeout to be reached

---

### Description

Used by Split-Thread

---

### Parameters
#### **Thread**
Threads to wait for

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|true    |1       |true (ByValue)|

#### **Threads**
Maximum number of concurrent threads that are allowed (used only for progress display)

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **SleepTimer**
Milliseconds to wait between cycles of the loop that checks threads for completion

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **Timeout**
Seconds to wait without receiving any new results before giving up and stopping all remaining threads

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **Dispose**
Dispose of the thread when it is finished

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DebugOutputStream**
Will be sent to the Type parameter of Write-LogMsg in the PsLogMessage module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **TodaysHostname**
Hostname to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **WhoAmI**
Username to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **LogBuffer**
Log messages which have not yet been written to disk

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |8       |false        |

#### **ProgressParentId**
ID of the parent progress bar under which to show progres

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |9       |false        |

---

### Inputs
[PSCustomObject]$Thread

---

### Outputs
* Outputs the specified output streams from the threads

---

### Syntax
```PowerShell
Wait-Thread [-Thread] <PSObject[]> [[-Threads] <Int32>] [[-SleepTimer] <Int32>] [[-Timeout] <Int32>] [-Dispose] [[-DebugOutputStream] <String>] [[-TodaysHostname] <String>] [[-WhoAmI] <String>] [[-LogBuffer] <Hashtable>] [[-ProgressParentId] <Int32>] [<CommonParameters>]
```
