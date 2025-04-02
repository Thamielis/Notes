Get-Colors
----------

### Synopsis
Retrieves RGB color values based on the provided color names.

---

### Description

The Get-Colors function retrieves RGB color values from a predefined list based on the color names provided as input. If no color names are specified, it returns all available RGB color values.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Colors -Color "Red", "Green"
Retrieves the RGB values for the colors Red and Green.
```
> EXAMPLE 2

```PowerShell
Get-Colors
Retrieves all available RGB color values.
```

---

### Parameters
#### **Color**
Specifies an array of color names for which RGB values are to be retrieved.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-Colors [[-Color] <String[]>] [<CommonParameters>]
```
