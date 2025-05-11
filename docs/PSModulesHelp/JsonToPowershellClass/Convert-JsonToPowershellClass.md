Convert-JsonToPowershellClass
-----------------------------

### Synopsis
Convert JSON to Powershell classes

---

### Description

Convert JSON to Powershell classes.

JSON can be supplied as a string, a file that will be read or a URL that will be downloaded.

Optionally create functions showing example usage.

Optionally write an output file.

Optionally copy the output to clipboard.

Github: https://github.com/trossr32/ps-json-to-powershell-class

---

### Related Links
* [https://github.com/trossr32/ps-json-to-powershell-class](https://github.com/trossr32/ps-json-to-powershell-class)

---

### Examples
> Example 1: Convert a JSON file to Powershell classes including usage examples and copy the output to clipboard.

```PowerShell
Convert-JsonToPowershellClass -JsonFile 'C:\Temp\a-json-file.json' -CopyToClipboard -IncludeExamples
```

---

### Parameters
#### **Json**
JSON string

|Type|Required|Position|PipelineInput|
|----|--------|--------|-------------|
|`[]`|false   |0       |true         |

#### **JsonFile**
JSON file name relative to current location, or relative path and JSON file name, or full path of JSON file

|Type|Required|Position|PipelineInput|
|----|--------|--------|-------------|
|`[]`|false   |1       |false        |

#### **Url**
URL to download JSON from

|Type|Required|Position|PipelineInput|
|----|--------|--------|-------------|
|`[]`|false   |2       |false        |

#### **RootObjectClassName**
The root object class name. If not supplied this will default to 'RootObject'

|Type|Required|Position|PipelineInput|
|----|--------|--------|-------------|
|`[]`|false   |3       |false        |

#### **OutputFile**
If supplied, the result will be written to this output file. The function expects a *.ps1 file, so if a
						path is supplied that doesn't end with '.ps1' then '.ps1' will be appended to the end of the parameter.

|Type|Required|Position|PipelineInput|
|----|--------|--------|-------------|
|`[]`|false   |4       |false        |

#### **CopyToClipboard**
If supplied the data uri will be saved to the clipboard.

|Type|Required|Position|PipelineInput|
|----|--------|--------|-------------|
|`[]`|false   |false   |

#### **IncludeExamples**
If supplied the output classes will have example functions showing usages appended to the bottom

|Type|Required|Position|PipelineInput|
|----|--------|--------|-------------|
|`[]`|false   |false   |

---
