New-ChartDataLabel
------------------

### Synopsis
Configures DataLabels for Charts

---

### Description

Configures DataLabels for Charts

---

### Examples
> EXAMPLE 1

```PowerShell
An example
```

---

### Parameters
#### **Enabled**
To determine whether to show dataLabels or not

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TextAnchor**
The alignment of text relative to dataLabel’s drawing position. Accepted values: start, middle, end
Valid Values:

* start
* middle
* end

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Distributed**
Similar to plotOptions.bar.distributed, this option makes each data-label discrete. So, when you provide an array of colors in datalabels.style.colors, the index in the colors array correlates with individual data-label index of all series.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OffsetX**
Sets the left offset for dataLabels

|Type          |Required|Position|PipelineInput|Aliases          |
|--------------|--------|--------|-------------|-----------------|
|`[Nullable`1]`|false   |2       |false        |DataLabelsOffsetX|

#### **OffsetY**
Sets the top offset for dataLabels

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |3       |false        |

#### **FontSize**
FontSize for the label

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Object]`|false   |4       |false        |DataLabelsFontSize|

#### **FontFamily**
FontFamily for the label

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **FontColor**
FontColors for the dataLabels. Accepts an array of string colors. Each index in the array corresponds to the series

|Type        |Required|Position|PipelineInput|Aliases        |
|------------|--------|--------|-------------|---------------|
|`[String[]]`|false   |6       |false        |DataLabelsColor|

---

### Notes
General notes

---

### Syntax
```PowerShell
New-ChartDataLabel [-Enabled] [[-TextAnchor] <String>] [-Distributed] [[-OffsetX] <Nullable`1>] [[-OffsetY] <Nullable`1>] [[-FontSize] <Object>] [[-FontFamily] <String>] [[-FontColor] <String[]>] [<CommonParameters>]
```
