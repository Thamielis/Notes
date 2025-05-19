New-ConfigurationManifest
-------------------------

### Synopsis
Short description

---

### Description

Long description

---

### Examples
> EXAMPLE 1

```PowerShell
An example
```

---

### Parameters
#### **ModuleVersion**
This setting specifies the version of the module. When multiple versions of a module exist on a system, the latest version is loaded by default when you run Import-Module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **CompatiblePSEditions**
This setting specifies the module's compatible PSEditions.
Valid Values:

* Desktop
* Core

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **GUID**
This setting specifies a unique identifier for the module. The GUID is used to distinguish between modules with the same name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Author**
This setting identifies the module author.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

#### **CompanyName**
This setting identifies the company or vendor who created the module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Copyright**
This setting specifies a copyright statement for the module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Description**
This setting describes the module at a high level.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **PowerShellVersion**
This setting specifies the minimum version of PowerShell this module requires.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **Tags**
Parameter description

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |9       |false        |

#### **IconUri**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **ProjectUri**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **DotNetFrameworkVersion**
This setting specifies the minimum version of the Microsoft .NET Framework that the module requires.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **LicenseUri**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **Prerelease**
Parameter description

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |14      |false        |PrereleaseTag|

#### **FunctionsToExport**
Allows ability to define functions to export in the module manifest.
By default functions are auto-detected, but this allows you to override that.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |15      |false        |

#### **CmdletsToExport**
Allows ability to define commands to export in the module manifest.
Currently module is not able to auto-detect commands, so you can use it to define, or module will use wildcard if it detects binary module.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |16      |false        |

#### **AliasesToExport**
Allows ability to define aliases to export in the module manifest.
By default aliases are auto-detected, but this allows you to override that.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |17      |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-ConfigurationManifest [-ModuleVersion] <String> [[-CompatiblePSEditions] <String[]>] [-GUID] <String> [-Author] <String> [[-CompanyName] <String>] [[-Copyright] <String>] [[-Description] <String>] [[-PowerShellVersion] <String>] [[-Tags] <String[]>] [[-IconUri] <String>] [[-ProjectUri] <String>] [[-DotNetFrameworkVersion] <String>] [[-LicenseUri] <String>] [[-Prerelease] <String>] [[-FunctionsToExport] <String[]>] [[-CmdletsToExport] <String[]>] [[-AliasesToExport] <String[]>] [<CommonParameters>]
```
