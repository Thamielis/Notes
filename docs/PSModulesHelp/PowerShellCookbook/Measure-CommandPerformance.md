Measure-CommandPerformance
--------------------------

### Synopsis
Measures the average time of a command, accounting for natural variability by
automatically ignoring the top and bottom ten percent.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Measure-CommandPerformance.ps1 { Start-Sleep -m 300 }
Count    : 30
Average  : 312.10155
(...)
```

---

### Parameters
#### **Scriptblock**
The command to measure

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Iterations**
The number of times to measure the command's performance

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

---

### Syntax
```PowerShell
Measure-CommandPerformance [[-Scriptblock] <ScriptBlock>] [[-Iterations] <Int32>] [<CommonParameters>]
```
