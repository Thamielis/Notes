ConvertTo-AdrText
-----------------

### Synopsis
Converts an ADR object into ADR markdown.

---

### Description

Converts an ADR object into ADR markdown via a template. The template will be
sourced from one of the following locations:

- Template parameter on this function
- ADR_TEMPLATE environment variable
- $(Get-AdrDir)/templates/template.md
- A template included in this module

---

### Parameters
#### **InputObject**
A custom object representing the state of the ADR to be rendered.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |1       |true (ByValue)|

#### **Template**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
ConvertTo-AdrText [-InputObject] <PSObject> [[-Template] <String>] [<CommonParameters>]
```
