Invoke-ElevatedCommand
----------------------

### Synopsis
Runs the provided script block under an elevated instance of PowerShell as
through it were a member of a regular pipeline.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Process | Invoke-ElevatedCommand.ps1 {
    $input | Where-Object { $_.Handles -gt 500 } } | Sort Handles
```

---

### Parameters
#### **Scriptblock**
The script block to invoke elevated

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |1       |false        |

#### **InputObject**
Any input to give the elevated process

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |2       |true (ByValue)|

#### **EnableProfile**
Switch to enable the user profile

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Invoke-ElevatedCommand [-Scriptblock] <ScriptBlock> [[-InputObject] <Object>] [-EnableProfile] [<CommonParameters>]
```
