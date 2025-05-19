Split-PSMDScriptFile
--------------------

### Synopsis
Parses a file and exports all top-level functions from it into a dedicated file, just for the function.

---

### Description

Parses a file and exports all top-level functions from it into a dedicated file, just for the function.
The original file remains unharmed by this.

Note: Any comments outside the function definition will not be copied.

---

### Examples
> EXAMPLE 1

```PowerShell
Split-PSMDScriptFile -File ".\module.ps1" -Path .\files
Exports all functions in module.ps1 and puts them in individual files in the folder .\files.
```

---

### Parameters
#### **File**
The file(s) to extract functions from.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|false   |1       |true (ByValue)|

#### **Path**
The folder to export to

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Encoding**
Default: UTF8
The output encoding. Can usually be left alone.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Syntax
```PowerShell
Split-PSMDScriptFile [[-File] <String[]>] [[-Path] <String>] [[-Encoding] <Object>] [<CommonParameters>]
```
