Watch-DebugExpression
---------------------

### Synopsis
Updates your prompt to display the values of information you want to track.

---

### Description

---

### Examples
> EXAMPLE 1

Watch-DebugExpression { (Get-History).Count }
Expression          Value
----------          -----
(Get-History).Count     3

PS > Watch-DebugExpression { $count }

Expression          Value
----------          -----
(Get-History).Count     4
$count

PS > $count = 100

Expression          Value
----------          -----
(Get-History).Count     5
$count                100

PS > Watch-DebugExpression -Reset
PS >

---

### Parameters
#### **ScriptBlock**
The expression to track

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Reset**
Switch to no longer watch an expression

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Watch-DebugExpression [[-ScriptBlock] <ScriptBlock>] [-Reset] [<CommonParameters>]
```
