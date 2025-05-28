ConvertFrom-AdrText
-------------------

### Synopsis
Converts ADR markdown text into an ADR object.

---

### Description

Converts ADR markdown text into an ADR object.

---

### Parameters
#### **InputObject**
A string of Markdown text to convert into an ADR object.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
ConvertFrom-AdrText [-InputObject] <String> [<CommonParameters>]
```
