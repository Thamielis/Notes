Add-ChangelogData
-----------------

### Synopsis
Adds an item to a changelog file in Keep a Changelog 1.0.0 format.

---

### Description

This cmdlet adds new Added/Changed/Deprecated/Removed/Fixed/Security items to the Unreleased section of a
changelog in Keep a Changelog 1.0.0 format.

---

### Related Links
* [https://github.com/natescherer/ChangelogManagement](https://github.com/natescherer/ChangelogManagement)

---

### Examples
> EXAMPLE 1

```PowerShell
Add-ChangelogData -Type "Added" -Data "Spanish language translation"
Does not generate output, but adds a new Added change into changelog at  .\CHANGELOG.md.
```
> EXAMPLE 2

```PowerShell
Add-ChangelogData -Type "Removed" -Data "TLS 1.0 support" -Path project\CHANGELOG.md
Does not generate output, but adds a new Security change into changelog at project\CHANGELOG.md.
```

---

### Parameters
#### **Path**
The path to the source changelog file; defaults to .\CHANGELOG.md

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **OutputPath**
The path to the output changelog file; defaults to the same path as the source file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Type**
Type of change to add to the changelog (Added, Changed, Deprecated, Removed, Fixed, or Security)
Valid Values:

* Added
* Changed
* Deprecated
* Removed
* Fixed
* Security

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Data**
The value of the change you are adding to the changelog

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

---

### Inputs
This cmdlet does not accept pipeline input.

---

### Outputs
* This cmdlet does not generate output.

---

### Syntax
```PowerShell
Add-ChangelogData [[-Path] <String>] [[-OutputPath] <String>] [-Type] <String> [-Data] <String> [<CommonParameters>]
```
