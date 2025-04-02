Get-RDMVersion
--------------

### Synopsis
Retrieve the installed Remote Desktop Manager for Windows version

---

### Description

Retrieve the installed Remote Desktop Manager for Windows version

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $version = Get-RDMVersion
```

---

### Parameters
#### **Edition**

Valid Values:

* Free
* Enterprise

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
For more information, type "Get-Help Get-RDMVersion -detailed". For technical information, type "Get-Help Get-RDMVersion -full".

---

### Syntax
```PowerShell
Get-RDMVersion [[-Edition] <String>] [<CommonParameters>]
```
