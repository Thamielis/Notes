Get-RDMCommand
--------------

### Synopsis
Retrieve the Remote Desktop Manager executable path

---

### Description

Retrieve the Remote Desktop Manager executable path

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $execPath = Get-RDMCommand
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
For more information, type "Get-Help Get-RDMCommand -detailed". For technical information, type "Get-Help Get-RDMCommand -full".

---

### Syntax
```PowerShell
Get-RDMCommand [[-Edition] <String>] [<CommonParameters>]
```
