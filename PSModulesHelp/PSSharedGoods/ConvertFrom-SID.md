ConvertFrom-SID
---------------

### Synopsis
Small command that can resolve SID values

---

### Description

Small command that can resolve SID values

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertFrom-SID -SID 'S-1-5-8', 'S-1-5-9', 'S-1-5-11', 'S-1-5-18', 'S-1-1-0' -DoNotResolve
```

---

### Parameters
#### **SID**
Value to resolve

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **OnlyWellKnown**
Only resolve SID when it's well know SID. Otherwise return $null

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OnlyWellKnownAdministrative**
Only resolve SID when it's administrative well know SID. Otherwise return $null

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DoNotResolve**
Uses only dicrionary values without querying AD

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
ConvertFrom-SID [-SID <String[]>] [-DoNotResolve] [<CommonParameters>]
```
```PowerShell
ConvertFrom-SID [-SID <String[]>] [-OnlyWellKnownAdministrative] [<CommonParameters>]
```
```PowerShell
ConvertFrom-SID [-SID <String[]>] [-OnlyWellKnown] [<CommonParameters>]
```
