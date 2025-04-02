Show-Ast
--------

### Synopsis
Provides a graphical interface to explore PowerShell AST.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$ast = { if (Test-Path $profile) { echo "Profile exists" } }.Ast
PS> Show-Ast $ast
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
Show-Ast [[-InputObject] <Object>] [<CommonParameters>]
```
