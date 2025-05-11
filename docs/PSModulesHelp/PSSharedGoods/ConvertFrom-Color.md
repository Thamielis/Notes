ConvertFrom-Color
-----------------

### Synopsis
Converts color names or hex codes to different formats.

---

### Description

ConvertFrom-Color function converts color names or hex codes to different formats such as decimal values or System.Drawing.Color objects.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertFrom-Color -Color Red, Blue -AsDecimal
Converts the colors Red and Blue to decimal values.
```
> EXAMPLE 2

```PowerShell
ConvertFrom-Color -Color "#FFA500" -AsDrawingColor
Converts the color with hex code #FFA500 to a System.Drawing.Color object.
```

---

### Parameters
#### **Color**
Specifies the color names or hex codes to convert.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |1       |false        |Colors |

#### **AsDecimal**
Indicates whether to convert the color to a decimal value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsDrawingColor**
Indicates whether to convert the color to a System.Drawing.Color object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
ConvertFrom-Color [[-Color] <String[]>] [-AsDecimal] [-AsDrawingColor] [<CommonParameters>]
```
