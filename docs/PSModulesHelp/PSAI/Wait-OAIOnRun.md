Wait-OAIOnRun
-------------

### Synopsis
Waits for a run to complete in an Azure Machine Learning service workspace.

---

### Description

The Wait-OAIOnRun function waits for a run to complete in an Azure Machine Learning service workspace. It continuously checks the status of the run and sleeps for a short duration until the run is no longer in the 'queued' or 'in_progress' state.

---

### Examples
> EXAMPLE 1

```PowerShell
$run = Get-OAIRunItem -ThreadId $thread.id -RunId $run.id
Wait-OAIOnRun -Run $run -Thread $thread
```

---

### Parameters
#### **Run**
The run object representing the run to wait for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Thread**
The thread object representing the thread associated with the run.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Wait-OAIOnRun [[-Run] <Object>] [[-Thread] <Object>] [<CommonParameters>]
```
