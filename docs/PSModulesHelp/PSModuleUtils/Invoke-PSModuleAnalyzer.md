Invoke-PSModuleAnalyzer
-----------------------

### Synopsis
Invokes PSScriptAnalyzer on a directory using a more strict set of rules than default.

---

### Description

Invokes PSScriptAnalyzer on a directory using a more strict set of rules than default.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-PSModuleAnalyzer -SourceDirectory $PWD/src -Fix
```

---

### Parameters
#### **SourceDirectory**
The directory to analyze.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Settings**
The settings file to use. Defaults to internal custom file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Fix**
Whether to fix the issues found.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
N/A

---

### Syntax
```PowerShell
Invoke-PSModuleAnalyzer [[-SourceDirectory] <String>] [[-Settings] <String>] [-Fix] [<CommonParameters>]
```
