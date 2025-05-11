Compare-Property
----------------

### Synopsis
Compare the property you provide against the input supplied to the script.
This provides the functionality of simple Where-Object comparisons without
the syntax required for that cmdlet.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
PS Get-Process | Compare-Property Handles gt 1000
```
> EXAMPLE 2

```PowerShell
Set-Alias ?? Compare-Property
PS > dir | ?? PsIsContainer
```

---

### Parameters
#### **Property**
The property to compare

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Operator**
The operator to use in the comparison

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **MatchText**
The value to compare with

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Syntax
```PowerShell
Compare-Property [[-Property] <Object>] [[-Operator] <Object>] [[-MatchText] <Object>] [<CommonParameters>]
```
