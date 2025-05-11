New-Changelog
-------------

### Synopsis
Creates a new, blank changelog in Keep a Changelog 1.0.0 format.

---

### Description

This cmdlet creates a new, blank changelog in Keep a Changelog 1.0.0 format.

---

### Related Links
* [https://github.com/natescherer/ChangelogManagement](https://github.com/natescherer/ChangelogManagement)

---

### Examples
> EXAMPLE 1

```PowerShell
New-Changelog
Does not generate output, but creates a new changelog at .\CHANGELOG.md
```
> EXAMPLE 2

```PowerShell
New-Changelog -Path project\CHANGELOG.md -NoSemVer
Does not generate output, but creates a new changelog at project\CHANGELOG.md while excluding SemVer statement from the header
```

---

### Parameters
#### **Path**
The path to output the changelog file; defaults to .\CHANGELOG.md

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **NoSemVer**
Exclude the statement about Semantic Versioning from the changelog

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoInitialChange**
Don't include the default initial change "Added: Initial release"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
This cmdlet does not accept pipeline input.

---

### Outputs
* This cmdlet does not generate output.

---

### Syntax
```PowerShell
New-Changelog [[-Path] <String>] [-NoSemVer] [-NoInitialChange] [<CommonParameters>]
```
