New-MapLegendOption
-------------------

### Synopsis
Creates a new map legend option with specified parameters.

---

### Description

This function creates a new map legend option with the provided parameters. It allows customization of the legend title, redraw behavior on resize, and display mode.

---

### Examples
> EXAMPLE 1

```PowerShell
New-MapLegendOption -Type "area" -Title "Area Legend" -RedrawOnResize $true -Mode "horizontal"
Creates a new map legend option for an area with the title "Area Legend", redraws on resize, and displays horizontally.
```
> EXAMPLE 2

```PowerShell
New-MapLegendOption -Type "plot" -Title "Plot Legend" -Mode "vertical"
Creates a new map legend option for a plot with the title "Plot Legend" and displays vertically.
```

---

### Parameters
#### **Type**
Specifies the type of the legend option. Valid values are 'area' and 'plot'.
Valid Values:

* area
* plot

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Title**
Specifies the title of the legend option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **RedrawOnResize**
Specifies whether the legend should redraw on resize. Default is $null.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |3       |false        |

#### **Mode**
Specifies the display mode of the legend option. Valid values are 'horizontal' and 'vertical'.
Valid Values:

* horizontal
* vertical

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

---

### Syntax
```PowerShell
New-MapLegendOption [-Type] <Object> [[-Title] <String>] [[-RedrawOnResize] <Nullable`1>] [[-Mode] <String>] [<CommonParameters>]
```
