Get-PipeworksManifest
---------------------

### Synopsis
Gets the Pipeworks manifest for a module

---

### Description

Gets the Pipeworks manifest for a PowerShell module.  
        
The pipeworks manifest is a .psd1 file that describes how the module will be published as a web service.

---

### Related Links
* [New-PipeworksManifest](New-PipeworksManifest)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PipeworksManifest -Module Pipeworks
```
> EXAMPLE 2

```PowerShell
Get-Module Pipeworks | Get-PipeworksManifest
```
> EXAMPLE 3

```PowerShell
Get-Module | Get-PipeworksManifest
```

---

### Parameters
#### **ModuleName**
The name of the module

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

---

### Outputs
* [Collections.Hashtable](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Hashtable)

---

### Syntax
```PowerShell
Get-PipeworksManifest [-ModuleName] <String> [<CommonParameters>]
```
