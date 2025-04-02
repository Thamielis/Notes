Get-RDMPackage
--------------

### Synopsis
Retrieve the latest or specified version download url

---

### Description

Retrieve the latest or specified version download url

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $package = Get-RDMPackage
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

#### **Platform**

Valid Values:

* Linux
* OSX
* Windows

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **RequiredVersion**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Inputs
None

---

### Outputs
* [Management.Automation.PSCustomObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSCustomObject)

---

### Notes
For more information, type "Get-Help Get-RDMPackage -detailed". For technical information, type "Get-Help Get-RDMPackage -full".

---

### Syntax
```PowerShell
Get-RDMPackage [[-Edition] <String>] [[-Platform] <String>] [[-RequiredVersion] <String>] [<CommonParameters>]
```
