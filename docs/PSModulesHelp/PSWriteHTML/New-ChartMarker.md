New-ChartMarker
---------------

### Synopsis
Creates a new chart marker with customizable options.

---

### Description

This function defines the properties of a chart marker, such as size, color, shape, and other visual attributes. It allows customization of the marker appearance in the chart.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
    New-ChartMarker -Size 30 -Color red -Shape square -StrokeColors yellow
}
```

---

### Parameters
#### **Size**
Specifies the size of the marker point.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |1       |false        |

#### **Color**
Sets the fill color(s) of the marker point.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **StrokeColors**
Specifies the stroke color of the marker. Accepts a single color or an array of colors in a multi-series chart.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **StrokeWidth**
Sets the stroke size of the marker.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |4       |false        |

#### **StrokeOpacity**
Specifies the opacity of the border around the marker.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |5       |false        |

#### **StrokeDashArray**
Defines the dashes in the border around the marker. A higher number creates more space between dashes in the border.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |6       |false        |

#### **FillOpacity**
Specifies the opacity of the marker fill color.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |7       |false        |

#### **Shape**
Defines the shape of the marker. Available options for shape are circle or square.
Valid Values:

* circle
* square

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |8       |false        |

#### **Radius**
Specifies the radius of the marker (applies to square shape).

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |9       |false        |

#### **OffsetX**
Sets the left offset of the marker.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |10      |false        |

#### **OffsetY**
Sets the top offset of the marker.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |11      |false        |

#### **ShowNullDataPoints**
Determines whether to show markers for null values in a line/area chart. If disabled, any null values present in line/area charts will not be visible.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HoverSize**
Specifies the fixed size of the marker when it is active.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |12      |false        |

#### **HoverSizeOffset**
Unlike the fixed size, this option takes the original marker size and increases/decreases the value based on it. For example, if markers.size is 6 and markers.hover.sizeOffset is 3, the marker's size will be 9 when hovered.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |13      |false        |

---

### Notes
Based on https://apexcharts.com/docs/options/markers/

---

### Syntax
```PowerShell
New-ChartMarker [[-Size] <Nullable`1>] [[-Color] <String[]>] [[-StrokeColors] <String[]>] [[-StrokeWidth] <Int32[]>] [[-StrokeOpacity] <Int32[]>] [[-StrokeDashArray] <Int32[]>] [[-FillOpacity] <Int32[]>] [[-Shape] <String[]>] [[-Radius] <Int32[]>] [[-OffsetX] <Int32[]>] [[-OffsetY] <Int32[]>] [-ShowNullDataPoints] [[-HoverSize] <Int32[]>] [[-HoverSizeOffset] <Int32[]>] [<CommonParameters>]
```
