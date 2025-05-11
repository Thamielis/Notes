Use-Culture
-----------

### Synopsis
Invoke a scriptblock under the given culture

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Use-Culture fr-FR { Get-Date -Date "25/12/2007" }
mardi 25 decembre 2007 00:00:00
```

---

### Parameters
#### **Culture**
The culture in which to evaluate the given script block

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CultureInfo]`|true    |1       |false        |

#### **ScriptBlock**
The code to invoke in the context of the given culture

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |2       |false        |

---

### Syntax
```PowerShell
Use-Culture [-Culture] <CultureInfo> [-ScriptBlock] <ScriptBlock> [<CommonParameters>]
```
