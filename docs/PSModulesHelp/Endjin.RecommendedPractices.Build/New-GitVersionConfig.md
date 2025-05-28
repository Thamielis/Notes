New-GitVersionConfig
--------------------

### Synopsis
Generates a default GitVersion confguration file.

---

### Description

Generates a default GitVersion confguration file.

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitVersionConfig -Path ./GitVersion.yml
Generates the configuration file in the current directory.
```

---

### Parameters
#### **OutputPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Force**
When true, overwrites any existing file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-GitVersionConfig [[-OutputPath] <String>] [-Force] [<CommonParameters>]
```
