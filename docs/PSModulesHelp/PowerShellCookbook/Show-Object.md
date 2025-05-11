Show-Object
-----------

### Synopsis
Provides a graphical interface to let you explore and navigate an object.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$ps = { Get-Process -ID $pid }.Ast
PS > Show-Object $ps
```

---

### Parameters
#### **InputObject**
The object to examine

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

---

### Syntax
```PowerShell
Show-Object [[-InputObject] <Object>] [<CommonParameters>]
```
