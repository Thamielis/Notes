New-ChartBarOptions
-------------------

### Synopsis
Creates options for a bar chart with customizable parameters.

---

### Description

This function creates options for a bar chart with the provided parameters. It allows customization of the bar type, data labels, colors, patterns, gradients, and distribution.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartBarOptions -Type 'barStacked' -DataLabelsEnabled $true -DataLabelsOffsetX -6 -DataLabelsFontSize '12px' -DataLabelsColor 'black' -Patterned -Distributed
Creates options for a stacked bar chart with data labels enabled, offset of -6, font size '12px', black data labels, patterned colors, and distributed bars.
```
> EXAMPLE 2

```PowerShell
New-ChartBarOptions -Type 'bar' -DataLabelsEnabled $false -Gradient -Vertical
Creates options for a regular bar chart with data labels disabled, gradient colors, and vertical bars.
```

---

### Parameters
#### **Type**
The type of the bar chart. Accepted values are 'bar', 'barStacked', 'barStacked100Percent'. Default is 'bar'.
Valid Values:

* bar
* barStacked
* barStacked100Percent

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **DataLabelsEnabled**
Indicates whether data labels are enabled. Default is $true.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |2       |false        |

#### **DataLabelsOffsetX**
The horizontal offset of the data labels. Default is -6.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **DataLabelsFontSize**
The font size of the data labels. Default is '12px'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **DataLabelsColor**
The color of the data labels.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Patterned**
Indicates whether patterned colors are used.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[Switch]`|false   |named   |false        |PatternedColors|

#### **Gradient**
Indicates whether gradient colors are used.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Switch]`|false   |named   |false        |GradientColors|

#### **Distributed**
Indicates whether the bars are distributed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Vertical**
Indicates whether the bars are vertical.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-ChartBarOptions [[-Type] <Object>] [[-DataLabelsEnabled] <Boolean>] [[-DataLabelsOffsetX] <Int32>] [[-DataLabelsFontSize] <String>] [[-DataLabelsColor] <String>] [-Patterned] [-Gradient] [-Distributed] [-Vertical] [<CommonParameters>]
```
