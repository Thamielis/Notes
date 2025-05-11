New-MapLegendSlice
------------------

### Synopsis
Creates a new map legend slice.

---

### Description

This function creates a new map legend slice with specified parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
New-MapLegendSlice -Label "Slice 1" -FillColor "Blue" -MinimumValue 0 -MaximumValue 100 -DisplayInLegend $true
```

---

### Parameters
#### **Type**

Valid Values:

* area
* plot

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Label**
The label of the slice for the legend.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **FillColor**
The color to fill the slice with.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |3       |false        |SliceColor|

#### **HoverFillColor**

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|false   |4       |false        |HoverSliceColor|

#### **StrokeWidth**

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |5       |false        |

#### **Transform**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **HoverTransform**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **HoverStrokeWidth**

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |8       |false        |

#### **MinimumValue**
The minimum value for the interval defining the slice.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |9       |false        |

#### **MaximumValue**
The maximum value for the interval defining the slice.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |10      |false        |

#### **Value**
The fixed value for the slice. Use this instead of 'MinimumValue' and 'MaximumValue' to set a specific value.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |11      |false        |

#### **DisplayInLegend**
Specifies whether to display the slice in the legend. Default is true.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |12      |false        |

#### **InitializeClicked**
Set to true to initialize the legend item in the 'clicked' state on map load. Default is false.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |13      |false        |

#### **Size**

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |14      |false        |

---

### Notes
This function is used to create slices for map legends.

---

### Syntax
```PowerShell
New-MapLegendSlice [-Type] <Object> [[-Label] <String>] [[-FillColor] <String>] [[-HoverFillColor] <String>] [[-StrokeWidth] <Nullable`1>] [[-Transform] <String>] [[-HoverTransform] <String>] [[-HoverStrokeWidth] <Nullable`1>] [[-MinimumValue] <Nullable`1>] [[-MaximumValue] <Nullable`1>] [[-Value] <Nullable`1>] [[-DisplayInLegend] <Nullable`1>] [[-InitializeClicked] <Nullable`1>] [[-Size] <Nullable`1>] [<CommonParameters>]
```
