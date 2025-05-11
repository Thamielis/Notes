Stop-Runspace
-------------

### Synopsis
Stops and cleans up the specified runspaces.

---

### Description

This function stops and cleans up the specified runspaces by checking their status and handling any errors, warnings, and verbose messages. It also provides an option for extended output.

---

### Examples
> EXAMPLE 1

```PowerShell
Stop-Runspace -Runspaces $runspaceArray -FunctionName "MyFunction" -RunspacePool $pool -ExtendedOutput
Stops the specified runspaces in the $runspaceArray associated with the function "MyFunction" using the runspace pool $pool and includes extended output.
```

---

### Parameters
#### **Runspaces**
Specifies the array of runspaces to stop.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |1       |false        |

#### **FunctionName**
Specifies the name of the function associated with the runspaces.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **RunspacePool**
Specifies the runspace pool to close and dispose of.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[RunspacePool]`|false   |3       |false        |

#### **ExtendedOutput**
Indicates whether to include extended output in the result.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Stop-Runspace [[-Runspaces] <Array>] [[-FunctionName] <String>] [[-RunspacePool] <RunspacePool>] [-ExtendedOutput] [<CommonParameters>]
```
