Measure-PSMDCommand
-------------------

### Synopsis
Measures command performance with consecutive tests.

---

### Description

This function measures the performance of a scriptblock many consective times.

Warning: Running a command repeatedly may not yield reliable information, since repeated executions may benefit from caching or other performance enhancing features, depending on the script content.
This is best suited for measuring the performance of tasks that will later be run repeatedly as well.
It also is useful for mitigating local performance fluctuations when comparing performances.

---

### Examples
> EXAMPLE 1

```PowerShell
Measure-PSMDCommand -ScriptBlock { dir \\Server\share } -Iterations 100
This tries to use Get-ChildItem on a remote directory 100 consecutive times, then measures performance and reports common performance indicators (Average duration, Maximum, Minimum, Total)
```

---

### Parameters
#### **ScriptBlock**
The scriptblock whose performance is to be measure.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |named   |false        |

#### **Iterations**
How many times should this performance test be repeated.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **TestSet**
Accepts a hashtable, mapping a name to a specific scriptblock to measure.
This will generate a result grading the performance of the various sets offered.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|true    |named   |false        |

---

### Syntax
```PowerShell
Measure-PSMDCommand -ScriptBlock <ScriptBlock> [-Iterations <Int32>] [<CommonParameters>]
```
```PowerShell
Measure-PSMDCommand [-Iterations <Int32>] -TestSet <Hashtable> [<CommonParameters>]
```
