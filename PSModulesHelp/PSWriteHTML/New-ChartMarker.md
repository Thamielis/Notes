New-ChartMarker
---------------

### Synopsis
Short description

---

### Description

Long description

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
Size of the marker point.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |1       |false        |

#### **Color**
Sets the fill color(s) of the marker point.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **StrokeColors**
Stroke Color of the marker. Accepts a single color or an array of colors in a multi-series chart.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **StrokeWidth**
Stroke Size of the marker.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |4       |false        |

#### **StrokeOpacity**
Opacity of the border around marker.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |5       |false        |

#### **StrokeDashArray**
Dashes in the border around marker. Higher number creates more space between dashes in the border.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |6       |false        |

#### **FillOpacity**
Opacity of the marker fill color.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |7       |false        |

#### **Shape**
Shape of the marker. Available Options for shape circle or square
Valid Values:

* circle
* square

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |8       |false        |

#### **Radius**
Radius of the marker (applies to square shape)

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |9       |false        |

#### **OffsetX**
Sets the left offset of the marker

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |10      |false        |

#### **OffsetY**
Sets the top offset of the marker

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |11      |false        |

#### **ShowNullDataPoints**
Whether to show markers for null values in a line/area chart. If disabled, any null values present in line/area charts will not be visible.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HoverSize**
Fixed size of the marker when it is active

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |12      |false        |

#### **HoverSizeOffset**
Unlike the fixed size, this option takes the original markers.size and increases/decreases the value based on it.
So, if markers.size: 6, markers.hover.sizeOffset: 3 will make the marker’s size 9 when hovered.

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
