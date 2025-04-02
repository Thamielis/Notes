Join-Uri
--------

### Synopsis
Provides ability to join two Url paths together

---

### Description

Provides ability to join two Url paths together

---

### Examples
> EXAMPLE 1

```PowerShell
Join-Uri 'https://evotec.xyz/' '/wp-json/wp/v2/posts'
```
> EXAMPLE 2

```PowerShell
Join-Uri 'https://evotec.xyz/' 'wp-json/wp/v2/posts'
```
> EXAMPLE 3

```PowerShell
Join-Uri -BaseUri 'https://evotec.xyz/' -RelativeOrAbsoluteUri '/wp-json/wp/v2/posts'
```
> EXAMPLE 4

```PowerShell
Join-Uri -BaseUri 'https://evotec.xyz/test/' -RelativeOrAbsoluteUri '/wp-json/wp/v2/posts'
```

---

### Parameters
#### **BaseUri**
Primary Url to merge

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|true    |1       |false        |

#### **RelativeOrAbsoluteUri**
Additional path to merge with primary url

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|true    |2       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Join-Uri [-BaseUri] <Uri> [-RelativeOrAbsoluteUri] <Uri> [<CommonParameters>]
```
