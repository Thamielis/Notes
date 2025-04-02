New-ExcelChartDefinition
------------------------

### Synopsis
Creates a Definition of a chart which can be added using Export-Excel, or Add-PivotTable

---

### Description

All the parameters which are passed to Add-ExcelChart can be added to a chart-definition object and passed to Export-Excel with the -ExcelChartDefinition parameter, or to Add-PivotTable with the -PivotChartDefinition parameter. This command sets up those definition objects.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

```PowerShell
PS\> $cDef = New-ExcelChartDefinition  -ChartType line -XRange "X" -YRange "Sinx"  -Title "Graph of Sine X" -TitleBold -TitleSize 14 -Column 2 -ColumnOffSetPixels 35 -Width 800 -XAxisTitleText "Degrees" -XAxisTitleBold -XAxisTitleSize 12 -XMajorUnit 30 -XMinorUnit 10 -XMinValue 0 -XMaxValue 361  -XAxisNumberformat "000" -YMinValue -1.25 -YMaxValue 1.25 -YMajorUnit 0.25 -YAxisNumberformat "0.00" -YAxisTitleText "Sine" -YAxisTitleBold -YAxisTitleSize 12  -SeriesHeader "Sin(x)" -LegendSize 8 -legendBold  -LegendPosition Bottom
PS\> 0..360 | ForEach-Object {[pscustomobject][ordered]@{x = $_; Sinx = "=Sin(Radians(x)) "}} | Export-Excel -AutoNameRange -now -WorkSheetname SinX -ExcelChartDefinition $cDef -Show
This reworks an example from Add-Excel-Chart but here the chart is defined and the defintion stored in $cDef and then Export-Excel uses $cDef .
```

---

### Parameters
#### **Title**
The title for the chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |False        |

#### **Header**
No longer used. This may be removed in future versions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |False        |

#### **ChartType**
One of the built-in chart types, such as Pie, ClusteredColumn, Line etc. Defaults to "ColumnStacked".
Valid Values:

* Area
* Line
* Pie
* Bubble
* ColumnClustered
* ColumnStacked
* ColumnStacked100
* ColumnClustered3D
* ColumnStacked3D
* ColumnStacked1003D
* BarClustered
* BarStacked
* BarStacked100
* BarClustered3D
* BarStacked3D
* BarStacked1003D
* LineStacked
* LineStacked100
* LineMarkers
* LineMarkersStacked
* LineMarkersStacked100
* PieOfPie
* PieExploded
* PieExploded3D
* BarOfPie
* XYScatterSmooth
* XYScatterSmoothNoMarkers
* XYScatterLines
* XYScatterLinesNoMarkers
* AreaStacked
* AreaStacked100
* AreaStacked3D
* AreaStacked1003D
* DoughnutExploded
* RadarMarkers
* RadarFilled
* Surface
* SurfaceWireframe
* SurfaceTopView
* SurfaceTopViewWireframe
* Bubble3DEffect
* StockHLC
* StockOHLC
* StockVHLC
* StockVOHLC
* CylinderColClustered
* CylinderColStacked
* CylinderColStacked100
* CylinderBarClustered
* CylinderBarStacked
* CylinderBarStacked100
* CylinderCol
* ConeColClustered
* ConeColStacked
* ConeColStacked100
* ConeBarClustered
* ConeBarStacked
* ConeBarStacked100
* ConeCol
* PyramidColClustered
* PyramidColStacked
* PyramidColStacked100
* PyramidBarClustered
* PyramidBarStacked
* PyramidBarStacked100
* PyramidCol
* XYScatter
* Radar
* Doughnut
* Pie3D
* Line3D
* Column3D
* Area3D

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[eChartType]`|false   |3       |False        |

#### **ChartTrendLine**
Superimposes one of Excel's trenline types on the chart.
Valid Values:

* Exponential
* Linear
* Logarithmic
* MovingAvgerage
* Polynomial
* Power

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[eTrendLine[]]`|false   |4       |False        |

#### **XRange**
The range of cells containing values for the X-Axis - usually labels.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |False        |

#### **YRange**
The range(s) of cells holding values for the Y-Axis - usually "data".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |False        |

#### **Width**
Width of the chart in pixels. Defaults to 500.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |False        |

#### **Height**
Height of the chart in pixels. Defaults to 350.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |False        |

#### **Row**
Row position of the top left corner of the chart. 0 places it at the top of the sheet, 1 below row 1 and so on.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |False        |

#### **RowOffSetPixels**
Offset to position the chart by a fraction of a row.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |10      |False        |

#### **Column**
Column position of the top left corner of the chart. 0 places it at the edge of the sheet, 1 to the right of column A and so on.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |11      |False        |

#### **ColumnOffSetPixels**
Offset to position the chart by a fraction of a column.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |12      |False        |

#### **LegendPosition**
Location of the key, either "Left", "Right", "Top", "Bottom" or "TopRight".
Valid Values:

* Top
* Left
* Right
* Bottom
* TopRight

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[eLegendPosition]`|false   |13      |False        |

#### **LegendSize**
Font size for the key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |14      |False        |

#### **LegendBold**
Sets the key in bold type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NoLegend**
If specified, turns off display of the key. If you only have one data series it may be preferable to use the title to say what the chart is.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShowCategory**
Attaches a category label in charts which support this.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShowPercent**
Attaches a percentage label in charts which support this.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SeriesHeader**
Specifies explicit name(s) for the data series, which will appear in the legend/key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |15      |False        |

#### **TitleBold**
Sets the title in bold face.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TitleSize**
Sets the point size for the title.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |16      |False        |

#### **XAxisTitleText**
Specifies a title for the X-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |17      |False        |

#### **XAxisTitleBold**
Sets the X-axis title in bold face.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **XAxisTitleSize**
Sets the font size for the axis title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |18      |False        |

#### **XAxisNumberformat**
A number formatting string, like "\#,\#\#0.00", for numbers along the X-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |19      |False        |

#### **XMajorUnit**
Spacing for the major gridlines / tick marks along the X-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |20      |False        |

#### **XMinorUnit**
Spacing for the minor gridlines / tick marks along the X-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |21      |False        |

#### **XMaxValue**
Maximum value for the scale along the X-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |22      |False        |

#### **XMinValue**
Minimum value for the scale along the X-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |23      |False        |

#### **XAxisPosition**
Position for the X-axis ("Top" or" Bottom").
Valid Values:

* Left
* Bottom
* Right
* Top

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[eAxisPosition]`|false   |24      |False        |

#### **YAxisTitleText**
Specifies a title for the Y-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |25      |False        |

#### **YAxisTitleBold**
Sets the Y-axis title in bold face.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **YAxisTitleSize**
Sets the font size for the Y-axis title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |26      |False        |

#### **YAxisNumberformat**
A number formatting string, like "\#,\#\#0.00", for numbers on the Y-axis

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |27      |False        |

#### **YMajorUnit**
Spacing for the major gridlines / tick marks on the Y-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |28      |False        |

#### **YMinorUnit**
Spacing for the minor gridlines / tick marks on the Y-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |29      |False        |

#### **YMaxValue**
Maximum value on the Y-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |30      |False        |

#### **YMinValue**
Minimum value on the Y-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |31      |False        |

#### **YAxisPosition**
Position for the Y-axis ("Left" or "Right").
Valid Values:

* Left
* Bottom
* Right
* Top

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[eAxisPosition]`|false   |32      |False        |

---

### Notes

---

### Syntax
```PowerShell
New-ExcelChartDefinition [[-Title] <Object>] [[-RowOffSetPixels] <Object>] [[-Column] <Object>] [[-ColumnOffSetPixels] <Object>] [[-LegendPosition] {Top | Left | Right | Bottom | TopRight}] [[-LegendSize] <Object>] [[-SeriesHeader] <Object>] [[-TitleSize] <Int32>] [[-XAxisTitleText] <String>] [[-XAxisTitleSize] <Object>] [[-XAxisNumberformat] <String>] [[-Header] <Object>] [[-XMajorUnit] <Object>] [[-XMinorUnit] <Object>] [[-XMaxValue] <Object>] [[-XMinValue] <Object>] [[-XAxisPosition] {Left | Bottom | Right | Top}] [[-YAxisTitleText] <String>] [[-YAxisTitleSize] <Object>] [[-YAxisNumberformat] <String>] [[-YMajorUnit] <Object>] [[-YMinorUnit] <Object>] [[-ChartType] {Area | Line | Pie | Bubble | ColumnClustered | ColumnStacked | ColumnStacked100 | ColumnClustered3D | ColumnStacked3D | ColumnStacked1003D | BarClustered | BarStacked | BarStacked100 | BarClustered3D | BarStacked3D | BarStacked1003D | LineStacked | LineStacked100 | LineMarkers | LineMarkersStacked | LineMarkersStacked100 | PieOfPie | PieExploded | PieExploded3D | BarOfPie | XYScatterSmooth | XYScatterSmoothNoMarkers | XYScatterLines | XYScatterLinesNoMarkers | AreaStacked | AreaStacked100 | AreaStacked3D | AreaStacked1003D | DoughnutExploded | RadarMarkers | RadarFilled | Surface | SurfaceWireframe | SurfaceTopView | SurfaceTopViewWireframe | Bubble3DEffect | StockHLC | StockOHLC | StockVHLC | StockVOHLC | CylinderColClustered | CylinderColStacked | CylinderColStacked100 | CylinderBarClustered | CylinderBarStacked | CylinderBarStacked100 | CylinderCol | ConeColClustered | ConeColStacked | ConeColStacked100 | ConeBarClustered | ConeBarStacked | ConeBarStacked100 | ConeCol | PyramidColClustered | PyramidColStacked | PyramidColStacked100 | PyramidBarClustered | PyramidBarStacked | PyramidBarStacked100 | PyramidCol | XYScatter | Radar | Doughnut | Pie3D | Line3D | Column3D | Area3D}] [[-YMaxValue] <Object>] [[-YMinValue] <Object>] [[-YAxisPosition] {Left | Bottom | Right | Top}] [[-ChartTrendLine] {Exponential | Linear | Logarithmic | MovingAvgerage | Polynomial | Power}] [[-XRange] <Object>] [[-YRange] <Object>] [[-Width] <Object>] [[-Height] <Object>] [[-Row] <Object>] [-LegendBold] [-NoLegend] [-ShowCategory] [-ShowPercent] [-TitleBold] [-XAxisTitleBold] [-YAxisTitleBold] [<CommonParameters>]
```
