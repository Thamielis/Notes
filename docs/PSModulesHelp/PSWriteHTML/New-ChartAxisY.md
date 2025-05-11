New-ChartAxisY
--------------

### Synopsis
Creates a new Y-axis for a chart with customizable parameters.

---

### Description

This function creates a new Y-axis for a chart with the provided parameters. It allows customization of the axis visibility, title, labels, range, style, and other options.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartAxisY -Show -TitleText 'Sales' -MinValue 0 -MaxValue 1000 -LabelAlign 'center'
Creates a new Y-axis with the title 'Sales', range from 0 to 1000, and center-aligned labels.
```
> EXAMPLE 2

```PowerShell
New-ChartAxisY -Show -ShowAlways -TitleText 'Temperature' -TitleColor 'red' -LabelAlign 'right'
Creates a new Y-axis with the title 'Temperature', always visible, red-colored title, and right-aligned labels.
```

---

### Parameters
#### **Show**
Indicates whether the Y-axis should be displayed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ShowAlways**
Indicates whether the Y-axis should always be visible.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TitleText**
The text to be displayed as the title of the Y-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **TitleRotate**
The rotation angle of the Y-axis title. Accepted values are '90' or '270'.
Valid Values:

* 90
* 270

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **TitleOffsetX**
The horizontal offset of the Y-axis title.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **TitleOffsetY**
The vertical offset of the Y-axis title.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **TitleFontWeight**
The font weight of the Y-axis title.
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
|`[String]`|false   |5       |false        |

#### **TitleColor**
The color of the Y-axis title.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|false   |6       |false        |TitleStyleColor|

#### **TitleFontSize**
The font size of the Y-axis title.

|Type     |Required|Position|PipelineInput|Aliases           |
|---------|--------|--------|-------------|------------------|
|`[Int32]`|false   |7       |false        |TitleStyleFontSize|

#### **TitleFontFamily**
The font family of the Y-axis title.

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[String]`|false   |8       |false        |TitleStyleFontFamily|

#### **MinValue**
The minimum value of the Y-axis.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |9       |false        |

#### **MaxValue**
The maximum value of the Y-axis.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |10      |false        |

#### **LabelMinWidth**
The minimum width of the Y-axis labels.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |11      |false        |

#### **LabelMaxWidth**
The maximum width of the Y-axis labels.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |12      |false        |

#### **LabelAlign**
The alignment of the Y-axis labels. Accepted values are 'left', 'center', or 'right'.
Valid Values:

* left
* center
* right

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **LabelFontSize**
The font size of the Y-axis labels.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |14      |false        |

#### **LabelFontFamily**
The font family of the Y-axis labels.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **LabelFontWeight**
The font weight of the Y-axis labels.
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
|`[String]`|false   |16      |false        |

#### **LabelFontColor**
The color of the Y-axis labels.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |17      |false        |

#### **Reversed**
Indicates whether the Y-axis should be reversed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Opposite**
Indicates whether the Y-axis should be positioned on the opposite side.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Logarithmic**
Indicates whether the Y-axis should have a logarithmic scale.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ForceNiceScale**
Indicates whether the Y-axis should have a nice scale.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Floating**
Indicates whether the Y-axis should be floating.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SeriesName**
The name of the series associated with the Y-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |18      |false        |

---

### Syntax
```PowerShell
New-ChartAxisY [-Show] [-ShowAlways] [[-TitleText] <String>] [[-TitleRotate] <String>] [[-TitleOffsetX] <Int32>] [[-TitleOffsetY] <Int32>] [[-TitleFontWeight] <String>] [[-TitleColor] <String>] [[-TitleFontSize] <Int32>] [[-TitleFontFamily] <String>] [[-MinValue] <Int32>] [[-MaxValue] <Int32>] [[-LabelMinWidth] <Int32>] [[-LabelMaxWidth] <Int32>] [[-LabelAlign] <String>] [[-LabelFontSize] <Object>] [[-LabelFontFamily] <String>] [[-LabelFontWeight] <String>] [[-LabelFontColor] <String[]>] [-Reversed] [-Opposite] [-Logarithmic] [-ForceNiceScale] [-Floating] [[-SeriesName] <String>] [<CommonParameters>]
```
