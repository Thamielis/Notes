Import-Metadata
---------------

### Synopsis
Creates a data object from the items in a Metadata file (e.g. a .psd1)

---

### Description

Serves as a wrapper for ConvertFrom-Metadata to explicitly support importing from files

---

### Examples
> EXAMPLE 1

```PowerShell
$data = Import-Metadata .\Configuration.psd1 -Ordered
Convert a module manifest into a hashtable of properties for introspection, preserving the order in the file
```

---

### Parameters
#### **Path**
The path to the metadata (.psd1) file to import

|Type      |Required|Position|PipelineInput                 |Aliases           |
|----------|--------|--------|------------------------------|------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|PSPath<br/>Content|

#### **Converters**
A hashtable of MetadataConverters (same as with Add-MetadataConverter)

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |2       |false        |

#### **Ordered**
If set (and PowerShell version 4 or later) preserve the file order of configuration
This results in the output being an OrderedDictionary instead of Hashtable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowedVariables**
Allows extending the valid variables which are allowed to be referenced in metadata
BEWARE: This exposes the value of these variables in the calling context to the metadata file
You are reponsible to only allow variables which you know are safe to share

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **PSVariable**
You should not pass this.
The PSVariable parameter is for preserving variable scope within the Metadata commands

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[PSVariableIntrinsics]`|false   |4       |false        |

---

### Syntax
```PowerShell
Import-Metadata [-Path] <String> [[-Converters] <Hashtable>] [-Ordered] [[-AllowedVariables] <String[]>] [[-PSVariable] <PSVariableIntrinsics>] [<CommonParameters>]
```
