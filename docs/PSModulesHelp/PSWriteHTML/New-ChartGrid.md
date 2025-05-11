New-ChartGrid
-------------

### Synopsis
Creates a new chart grid with customizable options.

---

### Description

This function creates a new chart grid with the provided parameters. It allows customization of the grid visibility, colors, opacity, padding, and other styling options.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartGrid -Show -BorderColor 'black' -StrokeDash 2 -Position 'front' -xAxisLinesShow -yAxisLinesShow -RowColors @('red', 'blue') -RowOpacity 0.7 -ColumnColors @('green', 'yellow') -ColumnOpacity 0.8 -PaddingTop 10 -PaddingRight 5 -PaddingBottom 15 -PaddingLeft 5
Creates a new chart grid with specified options including visible grid, black border color, dashed border style, front position, visible x-axis and y-axis lines, red and blue row colors with 0.7 opacity, green and yellow column colors with 0.8 opacity, and padding values.
```
> EXAMPLE 2

```PowerShell
New-ChartGrid -Show -BorderColor 'gray' -RowColors @('orange', 'purple') -ColumnColors @('pink', 'cyan') -PaddingTop 5 -PaddingRight 5 -PaddingBottom 5 -PaddingLeft 5
Creates a new chart grid with visible grid, gray border color, orange and purple row colors, pink and cyan column colors, and equal padding values.
```

---

### Parameters
#### **Show**
Indicates whether the grid is visible.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BorderColor**
The color of the grid border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **StrokeDash**
The style of the grid border. Default is 0.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **Position**
The position of the grid. Accepted values are 'front', 'back', 'default'. Default is 'default'.
Valid Values:

* front
* back
* default

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **xAxisLinesShow**
Indicates whether the x-axis lines are visible.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **yAxisLinesShow**
Indicates whether the y-axis lines are visible.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RowColors**
An array of colors for the rows in the grid.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **RowOpacity**
The opacity of the row colors. Valid range is 0 to 1. Default is 0.5.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |5       |false        |

#### **ColumnColors**
An array of colors for the columns in the grid.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **ColumnOpacity**
The opacity of the column colors. Valid range is 0 to 1. Default is 0.5.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |7       |false        |

#### **PaddingTop**
The top padding of the grid.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |8       |false        |

#### **PaddingRight**
The right padding of the grid.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |9       |false        |

#### **PaddingBottom**
The bottom padding of the grid.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |10      |false        |

#### **PaddingLeft**
The left padding of the grid.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |11      |false        |

---

### Syntax
```PowerShell
New-ChartGrid [-Show] [[-BorderColor] <String>] [[-StrokeDash] <Int32>] [[-Position] <String>] [-xAxisLinesShow] [-yAxisLinesShow] [[-RowColors] <String[]>] [[-RowOpacity] <Double>] [[-ColumnColors] <String[]>] [[-ColumnOpacity] <Double>] [[-PaddingTop] <Int32>] [[-PaddingRight] <Int32>] [[-PaddingBottom] <Int32>] [[-PaddingLeft] <Int32>] [<CommonParameters>]
```
