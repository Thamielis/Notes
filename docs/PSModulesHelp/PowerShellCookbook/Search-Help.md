Search-Help
-----------

### Synopsis
Search the PowerShell help documentation for a given keyword or regular
expression. For simple keyword searches in PowerShell version two or three,
simply use "Get-Help <keyword>"

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Search-Help hashtable
Searches help for the term 'hashtable'
```
> EXAMPLE 2

```PowerShell
Search-Help "(datetime|ticks)"
Searches help for the term datetime or ticks, using the regular expression
syntax.
```

---

### Parameters
#### **Pattern**
The pattern to search for

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Syntax
```PowerShell
Search-Help [-Pattern] <Object> [<CommonParameters>]
```
