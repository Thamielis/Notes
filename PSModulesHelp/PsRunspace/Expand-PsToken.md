Expand-PsToken
--------------

### Synopsis
Recursively get nested tokens

---

### Description

Recursively emits all tokens embedded in a token of type "StringExpandable"
The original token is also emitted.

---

### Examples
> EXAMPLE 1

```PowerShell
$Tokens = $null
$TokenizerErrors = $null
$AbstractSyntaxTree = [System.Management.Automation.Language.Parser]::ParseInput(
  [string]$Code,
  [ref]$Tokens,
  [ref]$TokenizerErrors
)
$Tokens |
Expand-PsToken
Return all tokens nested inside the provided $Code string (not scriptblock)
```

---

### Parameters
#### **InputObject**
Management.Automation.Language.StringExpandableToken or
Management.Automation.Language.Token

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|true    |1       |false        |

---

### Syntax
```PowerShell
Expand-PsToken [-InputObject] <PSObject> [<CommonParameters>]
```
