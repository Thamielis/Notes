Get-Metadata
------------

### Synopsis
Reads a specific value from a PowerShell metadata file (e.g. a module manifest)

---

### Description

By default Get-Metadata gets the ModuleVersion, but it can read any key in the metadata file

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Metadata .\Configuration.psd1
Returns the module version number (as a string)
```
> EXAMPLE 2

```PowerShell
Get-Metadata .\Configuration.psd1 ReleaseNotes
Returns the release notes!
```

---

### Parameters
#### **Path**
The path to the module manifest file

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|PSPath |

#### **PropertyName**
The property (or dotted property path) to be read from the manifest.
Get-Metadata searches the Manifest root properties, and also the nested hashtable properties.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Passthru**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-Metadata [-Path] <String> [[-PropertyName] <String>] [-Passthru] [<CommonParameters>]
```
