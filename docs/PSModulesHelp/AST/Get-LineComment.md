Get-LineComment
---------------

### Synopsis
Extracts the inline comment from a single line of PowerShell code.

---

### Description

Parses a given line of PowerShell code and extracts any inline comment.
If an inline comment exists, the function returns the comment text; otherwise, it returns nothing.

---

### Related Links
* [https://psmodule.io/AST/Functions/Lines/Get-LineComment/](https://psmodule.io/AST/Functions/Lines/Get-LineComment/)

---

### Examples
> EXAMPLE 1

```PowerShell
'Get-Process # This retrieves all processes' | Get-LineComment
Returns: '# This retrieves all processes'
```
> EXAMPLE 2

```PowerShell
'Write-Host "Hello World"' | Get-LineComment
Returns: $null (no comment found)
```

---

### Parameters
#### **Line**
Input line of PowerShell code from which to extract the comment.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Get-LineComment [-Line] <String> [<CommonParameters>]
```
