Measure-Collection
------------------

### Synopsis
Measures the execution time of a script block and outputs the duration.

---

### Description

This function measures the time taken to execute a given script block and outputs the duration in days, hours, minutes, seconds, milliseconds, and ticks.

---

### Examples
> EXAMPLE 1

```PowerShell
Measure-Collection -Name "Example" -ScriptBlock { Start-Sleep -Seconds 5 }
# Outputs: Name: Example, 0 days, 0 hours, 0 minutes, 5 seconds, 0 milliseconds, ticks 5000000
```
> EXAMPLE 2

```PowerShell
Measure-Collection -Name "Another Example" -ScriptBlock { Get-Process }
# Outputs: Name: Another Example, 0 days, 0 hours, 0 minutes, X seconds, Y milliseconds, ticks Z
```

---

### Parameters
#### **Name**
Specifies the name of the measurement.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ScriptBlock**
Specifies the script block to be executed and measured.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |2       |false        |

---

### Syntax
```PowerShell
Measure-Collection [[-Name] <String>] [[-ScriptBlock] <ScriptBlock>] [<CommonParameters>]
```
