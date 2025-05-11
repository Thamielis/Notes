Get-WebTemplateEditableRegion
-----------------------------

### Synopsis
Extracts out the editable regions from a dynamic web template

---

### Description

Determines what portions of a document are editable

---

### Related Links
* [Get-Web](Get-Web)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ChildItem -Filter *.dwt | Get-WebTemplateEditableRegion
```

---

### Parameters
#### **FilePath**
The path to a document

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |named   |true (ByPropertyName)|Fullname|

#### **DynamicWebTemplate**
The content of the document

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|DWT    |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Get-WebTemplateEditableRegion -FilePath <String> [<CommonParameters>]
```
```PowerShell
Get-WebTemplateEditableRegion [-DynamicWebTemplate] <String> [<CommonParameters>]
```
