Invoke-ScriptBlockClosure
-------------------------

### Synopsis
Demonstrates the GetNewClosure() method on a script block that pulls variables
in from the user's session (if they are defined.)

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$name = "Hello There"
PS > Invoke-ScriptBlockClosure { $name }
Hello There
Hello World
Hello There
```

---

### Parameters
#### **ScriptBlock**
The scriptblock to invoke

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

---

### Syntax
```PowerShell
Invoke-ScriptBlockClosure [[-ScriptBlock] <ScriptBlock>] [<CommonParameters>]
```
