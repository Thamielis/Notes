New-ChartTheme
--------------

### Synopsis
Creates a new chart theme with customizable options.

---

### Description

This function defines the properties of a chart theme, such as mode, palette, color, shade, and intensity. It allows customization of the theme appearance in the chart.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartTheme -Mode 'dark' -Palette 'palette3' -Monochrome -Color 'Red' -ShadeTo 'dark' -ShadeIntensity 0.8
Creates a new chart theme with dark mode, palette 3, monochrome enabled, red base color, dark shading, and intensity of 0.8.
```
> EXAMPLE 2

```PowerShell
New-ChartTheme -Mode 'light' -Palette 'palette7' -Color 'Blue' -ShadeTo 'light' -ShadeIntensity 0.6
Creates a new chart theme with light mode, palette 7, blue base color, light shading, and intensity of 0.6.
```

---

### Parameters
#### **Mode**
Specifies the mode of the chart theme. Valid values are 'light' or 'dark'.
Valid Values:

* light
* dark

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Palette**
Specifies the color palette for the chart theme. Valid values are 'palette1' through 'palette10'.
Valid Values:

* palette1
* palette2
* palette3
* palette4
* palette5
* palette6
* palette7
* palette8
* palette9
* palette10

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Monochrome**
Switch parameter to enable monochrome mode for the chart theme.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Color**
Sets the base color for the chart theme.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **ShadeTo**
Specifies the shading direction for the chart theme. Valid values are 'light' or 'dark'.
Valid Values:

* light
* dark

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **ShadeIntensity**
Specifies the intensity of the shading effect for the chart theme.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |5       |false        |

---

### Syntax
```PowerShell
New-ChartTheme [[-Mode] <String>] [[-Palette] <String>] [-Monochrome] [[-Color] <String>] [[-ShadeTo] <String>] [[-ShadeIntensity] <Double>] [<CommonParameters>]
```
