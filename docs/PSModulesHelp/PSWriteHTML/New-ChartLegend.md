New-ChartLegend
---------------

### Synopsis
Creates a new chart legend with customizable options.

---

### Description

The New-ChartLegend function creates a new chart legend with various customization options such as position, alignment, font settings, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartLegend -Names @('A', 'B', 'C') -Color @('red', 'blue', 'green') -LegendPosition 'top' -HorizontalAlign 'center' -FontSize 12
Creates a new chart legend with three items ('A', 'B', 'C') in red, blue, and green colors positioned at the top with center alignment and font size of 12.
```

---

### Parameters
#### **Names**
Specifies an array of names for the legend items.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |1       |false        |

#### **Color**
Specifies an array of colors for the legend items.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **HideLegend**
Indicates whether to hide the legend.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LegendPosition**
Specifies the position of the legend (top, left, right, bottom).
Valid Values:

* top
* left
* right
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **HorizontalAlign**
Specifies the horizontal alignment of the legend labels (left, center, right).
Valid Values:

* left
* center
* right

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Floating**
Indicates whether the legend should float.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InverseOrder**
Indicates whether to display legend items in reverse order.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OffsetX**
Specifies the horizontal offset of the legend.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |5       |false        |

#### **OffsetY**
Specifies the vertical offset of the legend.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |6       |false        |

#### **ItemMarginHorizontal**
Specifies the horizontal margin between legend items.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |7       |false        |

#### **ItemMarginVertical**
Specifies the vertical margin between legend items.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |8       |false        |

#### **FontSize**
Specifies the font size of the legend labels.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **FontFamily**
Specifies the font family of the legend labels.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **FontWeight**
Specifies the font weight of the legend labels.
Valid Values:

* normal
* bold
* bolder
* lighter
* 100
* 200
* 300
* 400
* 500
* 600
* 700
* 800
* 900

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **DisableOnItemClickToggleDataSeries**
Indicates whether to disable toggling data series on legend item click.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableOnItemHoverHighlightDataSeries**
Indicates whether to disable highlighting data series on legend item hover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseSeriesColors**
Indicates whether to use series colors for legend items.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-ChartLegend [[-Names] <Array>] [[-Color] <String[]>] [-HideLegend] [[-LegendPosition] <String>] [[-HorizontalAlign] <String>] [-Floating] [-InverseOrder] [[-OffsetX] <Nullable`1>] [[-OffsetY] <Nullable`1>] [[-ItemMarginHorizontal] <Nullable`1>] [[-ItemMarginVertical] <Nullable`1>] [[-FontSize] <Object>] [[-FontFamily] <String>] [[-FontWeight] <String>] [-DisableOnItemClickToggleDataSeries] [-DisableOnItemHoverHighlightDataSeries] [-UseSeriesColors] [<CommonParameters>]
```
