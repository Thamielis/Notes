New-HTMLChart
-------------

### Synopsis
Creates a new HTML chart with customizable settings.

---

### Description

This function creates a new HTML chart with customizable settings such as title, subtitle, dimensions, colors, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLChart -Title "Sales Data" -ChartSettings {
    // Chart configuration settings here
}
Creates a new HTML chart with the title "Sales Data" and custom chart settings.
```
> EXAMPLE 2

```PowerShell
New-HTMLChart -Title "Sales Data" -SubTitle "Quarterly Sales" -Height 400 -Width 600 -Gradient -Id "SalesChart"
Creates a new HTML chart with the title "Sales Data", subtitle "Quarterly Sales", height of 400, width of 600, gradient colors, and specified ID.
```

---

### Parameters
#### **ChartSettings**
Specifies the settings for the chart. This should be a ScriptBlock containing the chart configuration.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Title**
Specifies the title of the chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **TitleAlignment**
Specifies the alignment of the chart title. Valid values are 'center', 'left', or 'right'.
Valid Values:

* center
* left
* right

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **TitleMargin**
Specifies the margin of the chart title.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |4       |false        |

#### **TitleOffsetX**
Specifies the horizontal offset of the chart title.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |5       |false        |

#### **TitleOffsetY**
Specifies the vertical offset of the chart title.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |6       |false        |

#### **TitleFloating**
Specifies whether the chart title should float.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |7       |false        |

#### **TitleFontSize**
Specifies the font size of the chart title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

#### **TitleFontWeight**
Specifies the font weight of the chart title. Valid values are 'normal', 'bold', 'bolder', 'lighter', or numeric values from '100' to '900'.
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
|`[String]`|false   |9       |false        |

#### **TitleFontFamily**
Specifies the font family of the chart title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **TitleColor**
Specifies the color of the chart title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **SubTitle**
Specifies the subtitle of the chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **SubTitleAlignment**
Specifies the alignment of the chart subtitle. Valid values are 'center', 'left', or 'right'.
Valid Values:

* center
* left
* right

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **SubTitleMargin**
Specifies the margin of the chart subtitle.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |14      |false        |

#### **SubTitleOffsetX**
Specifies the horizontal offset of the chart subtitle.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |15      |false        |

#### **SubTitleOffsetY**
Specifies the vertical offset of the chart subtitle.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |16      |false        |

#### **SubTitleFloating**
Specifies whether the chart subtitle should float.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |17      |false        |

#### **SubTitleFontSize**
Specifies the font size of the chart subtitle.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |18      |false        |

#### **SubTitleFontWeight**
Specifies the font weight of the chart subtitle. Valid values are 'normal', 'bold', 'bolder', 'lighter', or numeric values from '100' to '900'.
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
|`[String]`|false   |19      |false        |

#### **SubTitleFontFamily**
Specifies the font family of the chart subtitle.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |20      |false        |

#### **SubTitleColor**
Specifies the color of the chart subtitle.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |21      |false        |

#### **Height**
Specifies the height of the chart. Default is 350.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |22      |false        |

#### **Width**
Specifies the width of the chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |23      |false        |

#### **Gradient**
Indicates whether to use gradient colors in the chart.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Switch]`|false   |named   |false        |GradientColors|

#### **Patterned**
Indicates whether to use patterned colors in the chart.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[Switch]`|false   |named   |false        |PatternedColors|

#### **Id**
Specifies the ID of the chart. If not provided, a random ID will be generated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |24      |false        |

#### **Group**
Specifies the group to which the chart belongs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |25      |false        |

---

### Syntax
```PowerShell
New-HTMLChart [[-ChartSettings] <ScriptBlock>] [[-Title] <String>] [[-TitleAlignment] <String>] [[-TitleMargin] <Nullable`1>] [[-TitleOffsetX] <Nullable`1>] [[-TitleOffsetY] <Nullable`1>] [[-TitleFloating] <Nullable`1>] [[-TitleFontSize] <Object>] [[-TitleFontWeight] <String>] [[-TitleFontFamily] <String>] [[-TitleColor] <String>] [[-SubTitle] <String>] [[-SubTitleAlignment] <String>] [[-SubTitleMargin] <Nullable`1>] [[-SubTitleOffsetX] <Nullable`1>] [[-SubTitleOffsetY] <Nullable`1>] [[-SubTitleFloating] <Nullable`1>] [[-SubTitleFontSize] <Object>] [[-SubTitleFontWeight] <String>] [[-SubTitleFontFamily] <String>] [[-SubTitleColor] <String>] [[-Height] <Object>] [[-Width] <Object>] [-Gradient] [-Patterned] [[-Id] <String>] [[-Group] <String>] [<CommonParameters>]
```
