Foreach-ObjectFast
------------------

### Synopsis
Faster Foreach-Object

---

### Description

Foreach-ObjectFast can replace the built-in Foreach-Object and improves pipeline speed considerably.
Foreach-ObjectFast supports only the most commonly used parameters -Begin, -Process, and -End, so you can replace

1..100 | Foreach-Object { 'Server{0:d3}' -f $_ }

with

1..100 | Foreach-ObjectFast { 'Server{0:d3}' -f $_ }

but you cannot currently replace instances of Foreach-Object that uses the less commonly used parameters, 
like -RemainingScripts, -MemberNames, and -ArgumentList

Foreach-ObjectFast has a performance benefit per iteration, so the more objects
you send through the pipeline, the more significant performace benefits you will see.

Foreach-ObjectFast is using a steppable pipeline internally which performs better.
However because of this, the debugging experience will be different, and internal
variables such as $MyInvocation may yield different results. For most every-day tasks,
these changes are not important.

A complete explanation of what Where-ObjectFast does can be found here:
https://powershell.one/tricks/performance/pipeline

---

### Related Links
* [https://powershell.one/tricks/performance/pipeline
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.2/Foreach-ObjectFast.ps1](https://powershell.one/tricks/performance/pipeline
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.2/Foreach-ObjectFast.ps1)

* [https://powershell.one/tricks/performance/pipeline
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.2/Foreach-ObjectFast.ps1](https://powershell.one/tricks/performance/pipeline
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.2/Foreach-ObjectFast.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$result = 1..1000000 | Foreach-ObjectFast -Process {
  "I am at $_"
}

$report = '{0} elements in {1:n2} seconds' 
$report -f $result.Count, $stopwatch.Elapsed.TotalSeconds 

Demos the speed improvements. Run this script to see how well it performs,
then replace Foreach-ObjectFast with the default Foreach-Object, and check out
the performace difference. $result is the same in both cases.
```

---

### Parameters
#### **Process**
executes for each pipeline element

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Begin**
executes once before the pipeline is started.
can be used for initialization routines

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |2       |false        |

#### **End**
executes once after all pipeline elements have been processed
can be used to do cleanup work

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |3       |false        |

---

### Syntax
```PowerShell
Foreach-ObjectFast [[-Process] <ScriptBlock>] [[-Begin] <ScriptBlock>] [[-End] <ScriptBlock>] [<CommonParameters>]
```
