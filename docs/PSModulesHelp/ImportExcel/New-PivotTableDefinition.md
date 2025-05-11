New-PivotTableDefinition
------------------------

### Synopsis
Creates PivotTable definitons for Export-Excel

---

### Description

Export-Excel allows a single PivotTable to be defined using the parameters -IncludePivotTable, -PivotColumns, -PivotRows, -PivotData, -PivotFilter, -PivotTotals, -PivotDataToColumn, -IncludePivotChart and -ChartType.

Its -PivotTableDefintion paramater allows multiple PivotTables to be defined, with additional parameters. New-PivotTableDefinition is a convenient way to build these definitions.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

```PowerShell
PS\> $pt = New-PivotTableDefinition -PivotTableName "PT1" -SourceWorkSheet "Sheet1" -PivotRows "Status" -PivotData @{Status='Count'} -PivotFilter 'StartType' -IncludePivotChart -ChartType BarClustered3D
PS\> $Pt += New-PivotTableDefinition -PivotTableName "PT2" -SourceWorkSheet "Sheet2" -PivotRows "Company" -PivotData @{Company='Count'} -IncludePivotChart -ChartType PieExploded3D -ShowPercent -ChartTitle "Breakdown of processes by company"
PS\> Get-Service | Select-Object -Property Status,Name,DisplayName,StartType | Export-Excel -Path .\test.xlsx -AutoSize
PS\> Get-Process | Select-Object -Property Name,Company,Handles,CPU,VM | Export-Excel -Path .\test.xlsx -AutoSize -WorksheetName 'sheet2'
PS\> $excel = Export-Excel -Path .\test.xlsx -PivotTableDefinition $pt -Show
This is a re-work of one of the examples in Export-Excel - instead of writing out the pivot definition hash-table, it is built by calling New-PivotTableDefinition.
```

---

### Parameters
#### **PivotTableName**
Name for the new pivot table
This command previously had a typo - and has an alias to avoid breaking scripts This will be removed in a future release

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Object]`|true    |named   |False        |PivtoTableName|

#### **SourceWorkSheet**
Worksheet where the data is found

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **SourceRange**
Address range in the worksheet e.g "A10:F20" - the first row must contain the column names to pivot by: if the range is not specified the whole source sheet will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **PivotRows**
Fields to set as rows in the PivotTable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **PivotData**
A hash-table in form "FieldName"="Function", where function is one of Average, Count, CountNums, Max, Min, Product, None, StdDev, StdDevP, Sum, Var, VarP

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |False        |

#### **PivotColumns**
Fields to set as columns in the PivotTable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **PivotFilter**
Fields to use to filter in the PivotTable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **PivotDataToColumn**
If there are multiple datasets in a PivotTable, by default they are shown seperatate rows under the given row heading; this switch makes them seperate columns.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PivotTotals**
By default PivotTables have Totals for each Row (on the right) and for each column at the bottom. This allows just one or neither to be selected.
Valid Values:

* Both
* Columns
* Rows
* None

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NoTotalsInPivot**
Included for compatibility - equivalent to -PivotTotals "None"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GroupDateRow**
The name of a row field which should be grouped by parts of the date/time (ignored if GroupDatePart is not specified)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **GroupDateColumn**
The name of a column field which should be grouped by parts of the date/time (ignored if GroupDatePart is not specified)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **GroupDatePart**
The Part(s) of the date to use in the grouping (ignored if GroupDateRow is not specified)
Valid Values:

* Years
* Quarters
* Months
* Days
* Hours
* Minutes
* Seconds

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[eDateGroupBy[]]`|false   |named   |False        |

#### **GroupNumericRow**
The name of a row field which should be grouped by Number (e.g 0-99, 100-199, 200-299 )

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **GroupNumericColumn**
The name of a column field which should be grouped by Number (e.g 0-99, 100-199, 200-299 )

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **GroupNumericMin**
The starting point for grouping

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |False        |

#### **GroupNumericMax**
The endpoint for grouping

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |False        |

#### **GroupNumericInterval**
The interval for grouping

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |False        |

#### **PivotNumberFormat**
Number format to apply to the data cells in the PivotTable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PivotTableStyle**
Apply a table style to the PivotTable
Valid Values:

* None
* Custom
* Light1
* Light2
* Light3
* Light4
* Light5
* Light6
* Light7
* Light8
* Light9
* Light10
* Light11
* Light12
* Light13
* Light14
* Light15
* Light16
* Light17
* Light18
* Light19
* Light20
* Light21
* Medium1
* Medium2
* Medium3
* Medium4
* Medium5
* Medium6
* Medium7
* Medium8
* Medium9
* Medium10
* Medium11
* Medium12
* Medium13
* Medium14
* Medium15
* Medium16
* Medium17
* Medium18
* Medium19
* Medium20
* Medium21
* Medium22
* Medium23
* Medium24
* Medium25
* Medium26
* Medium27
* Medium28
* Dark1
* Dark2
* Dark3
* Dark4
* Dark5
* Dark6
* Dark7
* Dark8
* Dark9
* Dark10
* Dark11

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[TableStyles]`|false   |named   |False        |

#### **PivotChartDefinition**
Use a chart definition instead of specifying chart settings one by one

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|true    |named   |True (ByPropertyName)|

#### **IncludePivotChart**
If specified a chart Will be included.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ChartTitle**
Optional title for the pivot chart, by default the title omitted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ChartHeight**
Height of the chart in Pixels (400 by default)

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ChartWidth**
Width of the chart in Pixels (600 by default)

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ChartRow**
Cell position of the top left corner of the chart, there will be this number of rows above the top edge of the chart (default is 0, chart starts at top edge of row 1).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ChartColumn**
Cell position of the top left corner of the chart, there will be this number of cells to the left of the chart (default is 4, chart starts at left edge of column E)

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ChartRowOffSetPixels**
Vertical offset of the chart from the cell corner.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ChartColumnOffSetPixels**
Horizontal offset of the chart from the cell corner.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ChartType**
Type of chart
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
|`[eChartType]`|false   |named   |False        |

#### **NoLegend**
If specified hides the chart legend

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShowCategory**
if specified attaches the category to slices in a pie chart : not supported on all chart types, this may give errors if applied to an unsupported type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShowPercent**
If specified attaches percentages to slices in a pie chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Activate**
If there is already content in the workbook the sheet with the PivotTable will not be active UNLESS Activate is specified

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
New-PivotTableDefinition -PivotTableName <Object> [-SourceWorkSheet <Object>] [-SourceRange <Object>] [-PivotRows <Object>] [-PivotData <Hashtable>] [-PivotColumns <Object>] [-PivotFilter <Object>] [-PivotDataToColumn] [-PivotTotals <String>] [-NoTotalsInPivot] [-GroupDateRow <String>] [-GroupDateColumn <String>] [-GroupDatePart {Years | Quarters | Months | Days | Hours | Minutes | Seconds}] [-GroupNumericRow <String>] [-GroupNumericColumn <String>] [-GroupNumericMin <Double>] [-GroupNumericMax <Double>] [-GroupNumericInterval <Double>] [-PivotNumberFormat <String>] [-PivotTableStyle {None | Custom | Light1 | Light2 | Light3 | Light4 | Light5 | Light6 | Light7 | Light8 | Light9 | Light10 | Light11 | Light12 | Light13 | Light14 | Light15 | Light16 | Light17 | Light18 | Light19 | Light20 | Light21 | Medium1 | Medium2 | Medium3 | Medium4 | Medium5 | Medium6 | Medium7 | Medium8 | Medium9 | Medium10 | Medium11 | Medium12 | Medium13 | Medium14 | Medium15 | Medium16 | Medium17 | Medium18 | Medium19 | Medium20 | Medium21 | Medium22 | Medium23 | Medium24 | Medium25 | Medium26 | Medium27 | Medium28 | Dark1 | Dark2 | Dark3 | Dark4 | Dark5 | Dark6 | Dark7 | Dark8 | Dark9 | Dark10 | Dark11}] -PivotChartDefinition <Object> [-Activate] [<CommonParameters>]
```
```PowerShell
New-PivotTableDefinition -PivotTableName <Object> [-SourceWorkSheet <Object>] [-SourceRange <Object>] [-PivotRows <Object>] [-PivotData <Hashtable>] [-PivotColumns <Object>] [-PivotFilter <Object>] [-PivotDataToColumn] [-PivotTotals <String>] [-NoTotalsInPivot] [-GroupDateRow <String>] [-GroupDateColumn <String>] [-GroupDatePart {Years | Quarters | Months | Days | Hours | Minutes | Seconds}] [-GroupNumericRow <String>] [-GroupNumericColumn <String>] [-GroupNumericMin <Double>] [-GroupNumericMax <Double>] [-GroupNumericInterval <Double>] [-PivotNumberFormat <String>] [-PivotTableStyle {None | Custom | Light1 | Light2 | Light3 | Light4 | Light5 | Light6 | Light7 | Light8 | Light9 | Light10 | Light11 | Light12 | Light13 | Light14 | Light15 | Light16 | Light17 | Light18 | Light19 | Light20 | Light21 | Medium1 | Medium2 | Medium3 | Medium4 | Medium5 | Medium6 | Medium7 | Medium8 | Medium9 | Medium10 | Medium11 | Medium12 | Medium13 | Medium14 | Medium15 | Medium16 | Medium17 | Medium18 | Medium19 | Medium20 | Medium21 | Medium22 | Medium23 | Medium24 | Medium25 | Medium26 | Medium27 | Medium28 | Dark1 | Dark2 | Dark3 | Dark4 | Dark5 | Dark6 | Dark7 | Dark8 | Dark9 | Dark10 | Dark11}] [-IncludePivotChart] [-ChartTitle <String>] [-ChartHeight <Int32>] [-ChartWidth <Int32>] [-ChartRow <Int32>] [-ChartColumn <Int32>] [-ChartRowOffSetPixels <Int32>] [-ChartColumnOffSetPixels <Int32>] [-ChartType {Area | Line | Pie | Bubble | ColumnClustered | ColumnStacked | ColumnStacked100 | ColumnClustered3D | ColumnStacked3D | ColumnStacked1003D | BarClustered | BarStacked | BarStacked100 | BarClustered3D | BarStacked3D | BarStacked1003D | LineStacked | LineStacked100 | LineMarkers | LineMarkersStacked | LineMarkersStacked100 | PieOfPie | PieExploded | PieExploded3D | BarOfPie | XYScatterSmooth | XYScatterSmoothNoMarkers | XYScatterLines | XYScatterLinesNoMarkers | AreaStacked | AreaStacked100 | AreaStacked3D | AreaStacked1003D | DoughnutExploded | RadarMarkers | RadarFilled | Surface | SurfaceWireframe | SurfaceTopView | SurfaceTopViewWireframe | Bubble3DEffect | StockHLC | StockOHLC | StockVHLC | StockVOHLC | CylinderColClustered | CylinderColStacked | CylinderColStacked100 | CylinderBarClustered | CylinderBarStacked | CylinderBarStacked100 | CylinderCol | ConeColClustered | ConeColStacked | ConeColStacked100 | ConeBarClustered | ConeBarStacked | ConeBarStacked100 | ConeCol | PyramidColClustered | PyramidColStacked | PyramidColStacked100 | PyramidBarClustered | PyramidBarStacked | PyramidBarStacked100 | PyramidCol | XYScatter | Radar | Doughnut | Pie3D | Line3D | Column3D | Area3D}] [-NoLegend] [-ShowCategory] [-ShowPercent] [-Activate] [<CommonParameters>]
```
