Start-Runspace
--------------

### Synopsis
Starts a new runspace with the provided script block, parameters, and runspace pool.

---

### Description

This function creates a new runspace using the specified script block, parameters, and runspace pool. It then starts the runspace and returns an object containing the runspace and its status.

---

### Examples
> EXAMPLE 1

```PowerShell
$scriptBlock = {
    Get-Process
}
$parameters = @{
    Name = 'explorer.exe'
}
$runspacePool = [RunspaceFactory]::CreateRunspacePool(1, 5)
$runspacePool.Open()
$result = Start-Runspace -ScriptBlock $scriptBlock -Parameters $parameters -RunspacePool $runspacePool
$result.Pipe | Receive-Job -Wait
This example starts a new runspace that retrieves information about the 'explorer.exe' process.
```

---

### Parameters
#### **ScriptBlock**
The script block to be executed in the new runspace.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Parameters**
The parameters to be passed to the script block.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |2       |false        |

#### **RunspacePool**
The runspace pool in which the new runspace will be created.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[RunspacePool]`|false   |3       |false        |

---

### Syntax
```PowerShell
Start-Runspace [[-ScriptBlock] <ScriptBlock>] [[-Parameters] <IDictionary>] [[-RunspacePool] <RunspacePool>] [<CommonParameters>]
```
