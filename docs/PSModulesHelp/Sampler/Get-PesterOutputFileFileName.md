Get-PesterOutputFileFileName
----------------------------

### Synopsis
Gets a descriptive file name to be used as Pester Output file name.

---

### Description

Creates a file name to be used as Pester Output xml file composed like so:
"${ProjectName}_v${ModuleVersion}.${OsShortName}.${PowerShellVersion}.xml"

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PesterOutputFileFileName -ProjectName 'Sampler' -ModuleVersion 0.110.4-preview001 -OsShortName Windows -PowerShellVersion 5.1
```

---

### Parameters
#### **ProjectName**
Name of the Project or module being built.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ModuleVersion**
Module Version currently defined (including pre-release but without the metadata).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **OsShortName**
Platform name either Windows, Linux, or MacOS.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **PowerShellVersion**
Version of PowerShell the tests have been running on.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-PesterOutputFileFileName [-ProjectName] <String> [-ModuleVersion] <String> [-OsShortName] <String> [-PowerShellVersion] <String> [<CommonParameters>]
```
