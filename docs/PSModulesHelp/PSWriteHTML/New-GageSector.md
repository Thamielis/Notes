New-GageSector
--------------

### Synopsis
Creates a new gauge sector with specified color, minimum value, and maximum value.

---

### Description

This function creates a new gauge sector with the provided color, minimum value, and maximum value. It is useful for visualizing data within a specific range.

---

### Examples
> EXAMPLE 1

```PowerShell
$sector = New-GageSector -Color 'red' -Min 0 -Max 100
Creates a new gauge sector with a red color, minimum value of 0, and maximum value of 100.
```

---

### Parameters
#### **Color**
Specifies the color of the gauge sector.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Min**
Specifies the minimum value of the gauge sector.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **Max**
Specifies the maximum value of the gauge sector.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

---

### Notes
Additional notes

---

### Syntax
```PowerShell
New-GageSector [[-Color] <String>] [[-Min] <Int32>] [[-Max] <Int32>] [<CommonParameters>]
```
