New-MapLegendSlice
------------------

### Synopsis
Short description

---

### Description

Long description

---

### Examples
> EXAMPLE 1

```PowerShell
An example
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
The label of the slice for the legend

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **FillColor**
Parameter description

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
The minimal value for the interval defining the slice

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |9       |false        |

#### **MaximumValue**
The maximal value for the interval defining the slice

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |10      |false        |

#### **Value**
The value for the slice. This option can be used instead of the 'min' and 'max' options in order to set a fixed value instead of an interval of values for the slice.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |11      |false        |

#### **DisplayInLegend**
Display the slice in the legend (Boolean, default : true)

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |12      |false        |

#### **InitializeClicked**
Set to true in order to initialize the legend item in the 'clicked' state on the map load. (Boolean, default : false)

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |13      |false        |

#### **Size**

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |14      |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-MapLegendSlice [-Type] <Object> [[-Label] <String>] [[-FillColor] <String>] [[-HoverFillColor] <String>] [[-StrokeWidth] <Nullable`1>] [[-Transform] <String>] [[-HoverTransform] <String>] [[-HoverStrokeWidth] <Nullable`1>] [[-MinimumValue] <Nullable`1>] [[-MaximumValue] <Nullable`1>] [[-Value] <Nullable`1>] [[-DisplayInLegend] <Nullable`1>] [[-InitializeClicked] <Nullable`1>] [[-Size] <Nullable`1>] [<CommonParameters>]
```
