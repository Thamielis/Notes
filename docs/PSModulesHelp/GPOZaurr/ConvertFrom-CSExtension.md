ConvertFrom-CSExtension
-----------------------

### Synopsis
Converts Client-side Extension (CSE) GUIDs to their corresponding names.

---

### Description

This function takes an array of CSE GUIDs and returns their corresponding names. It can be used to easily identify the purpose of each CSE GUID.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertFrom-CSExtension -CSE '{35378EAC-683F-11D2-A89A-00C04FBBCFA2}', '{0F6B957E-509E-11D1-A7CC-0000F87571E3}' -Limited
Converts the specified CSE GUIDs to their corresponding names, limited to a predefined set.
```
> EXAMPLE 2

```PowerShell
ConvertFrom-CSExtension -CSE '{D02B1F73-3407-48AE-BA88-E8213C6761F1}', '{0ACDD40C-75AC-47ab-BAA0-BF6DE7E7FE63}'
Converts the specified CSE GUIDs to their corresponding names without any limitations.
```

---

### Parameters
#### **CSE**
Specifies an array of Client-side Extension (CSE) GUIDs to be converted to names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Limited**
Indicates whether the conversion should be limited to a predefined set of CSE GUIDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
ConvertFrom-CSExtension [[-CSE] <String[]>] [-Limited] [<CommonParameters>]
```
