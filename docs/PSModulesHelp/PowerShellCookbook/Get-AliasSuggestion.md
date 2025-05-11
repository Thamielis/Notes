Get-AliasSuggestion
-------------------

### Synopsis
Get an alias suggestion from the full text of the last command. Intended to
be added to your prompt function to help learn aliases for commands.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-AliasSuggestion Remove-ItemProperty
Suggestion: An alias for Remove-ItemProperty is rp
```

---

### Parameters
#### **LastCommand**
The full text of the last command

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-AliasSuggestion [[-LastCommand] <Object>] [<CommonParameters>]
```
