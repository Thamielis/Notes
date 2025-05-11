Invoke-ScriptBlock
------------------

### Synopsis
Apply the given mapping command to each element of the input. (Note that
PowerShell includes this command natively, and calls it Foreach-Object)

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
1,2,3 | Invoke-ScriptBlock { $_ * 2 }
```

---

### Parameters
#### **MapCommand**
The scriptblock to apply to each incoming element

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

---

### Syntax
```PowerShell
Invoke-ScriptBlock [[-MapCommand] <ScriptBlock>] [<CommonParameters>]
```
