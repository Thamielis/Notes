Join-Worksheet
--------------

### Synopsis
Combines data on all the sheets in an Excel worksheet onto a single sheet.

---

### Description

Join-Worksheet can work in two main ways, either Combining data which has the same layout from many pages into one, or Combining pages which have nothing in common. In the former case the header row is copied from the first sheet and, by default, each row of data is labelled with the name of the sheet it came from.

In the latter case -NoHeader is specified, and each copied block can have the sheet it came from placed above it as a title.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

PS\> foreach ($computerName in @('Server1', 'Server2', 'Server3', 'Server4')) {
    Get-Service -ComputerName $computerName |
        Select-Object -Property Status, Name, DisplayName, StartType |
            Export-Excel -Path .\test.xlsx -WorkSheetname $computerName -AutoSize
}
PS\> $ptDef = New-PivotTableDefinition -PivotTableName "Pivot1" -SourceWorkSheet "Combined" -PivotRows "Status" -PivotFilter "MachineName" -PivotData @{Status='Count'} -IncludePivotChart -ChartType BarClustered3D
PS\> Join-Worksheet -Path .\test.xlsx -WorkSheetName combined -FromLabel "MachineName" -HideSource-AutoSize -FreezeTopRow -BoldTopRow -PivotTableDefinition $pt -Show
The foreach command gets a list of services running on four servers and exports each list to its own page in Test.xlsx. And $PtDef=... creates a definition for a PivotTable.

The Join-Worksheet command uses the same file and merges the results into a sheet named "Combined". It sets a column header of "Machinename", this column will contain the name of the sheet the data was copied from; after copying the data to the sheet "Combined", the other sheets will be hidden. Join-Worksheet finishes by calling Export-Excel to AutoSize cells, freeze the top row and make it bold and add thePivotTable.
> EXAMPLE 2

PS\> Get-CimInstance -ClassName win32_logicaldisk |
        Select-Object -Property DeviceId,VolumeName, Size,Freespace |
            Export-Excel -Path "$env:computerName.xlsx" -WorkSheetname Volumes -NumberFormat "0,000"
PS\> Get-NetAdapter| Select-Object Name,InterfaceDescription,MacAddress,LinkSpeed |
          Export-Excel -Path "$env:COMPUTERNAME.xlsx" -WorkSheetname NetAdapter
PS\> Join-Worksheet -Path "$env:COMPUTERNAME.xlsx"-WorkSheetName Summary -Title "Summary" -TitleBold -TitleSize 22 -NoHeader -LabelBlocks -AutoSize -HideSource -show
The first two commands get logical-disk and network-card information; each type is exported to its own sheet in a workbook.

The Join-Worksheet command copies both onto a page named "Summary".Because the data is dissimilar, -NoHeader is specified, ensuring the whole of each page is copied. Specifying -LabelBlocks causes each sheet's name to become a title on the summary page above the copied data. The source data is hidden, a title is added in 22 point boldface and the columns are sized to fit the data.

---

### Parameters
#### **Path**
Path to a new or existing .XLSX file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |False        |

#### **ExcelPackage**
An object representing an Excel Package - either from Open-ExcelPackage or specifying -PassThru to Export-Excel.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[ExcelPackage]`|true    |named   |False        |

#### **WorkSheetName**
The name of a sheet within the workbook where the other sheets will be joined together - "Combined" by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Clearsheet**
If specified ,any pre-existing target for the joined data will be deleted and re-created; otherwise data will be appended on this sheet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NoHeader**
Join-Worksheet assumes each sheet has identical headers and the headers should be copied to the target sheet, unless -NoHeader is specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FromLabel**
If -NoHeader is NOT specified, then rows of data will be labeled with the name of the sheet they came from. FromLabel is the header for this column. If it is null or empty, the labels will be omitted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **LabelBlocks**
If specified, the copied blocks of data will have the name of the sheet they were copied from inserted above them as a title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AutoSize**
Sets the width of the Excel columns to display all the data in their cells.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FreezeTopRow**
Freezes headers etc. in the top row.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FreezeFirstColumn**
Freezes titles etc. in the left column.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FreezeTopRowFirstColumn**
Freezes top row and left column (equivalent to Freeze pane 2,2 ).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FreezePane**
Freezes panes at specified coordinates (in the formRowNumber , ColumnNumber).

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |named   |False        |

#### **AutoFilter**
Enables the Excel filter on the headers of the combined sheet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **BoldTopRow**
Makes the top row boldface.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HideSource**
If specified, hides the sheets that the data is copied from.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Title**
Text of a title to be placed in Cell A1.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TitleFillPattern**
Sets the fill pattern for the title cell.
Valid Values:

* None
* Solid
* DarkGray
* MediumGray
* LightGray
* Gray125
* Gray0625
* DarkVertical
* DarkHorizontal
* DarkDown
* DarkUp
* DarkGrid
* DarkTrellis
* LightVertical
* LightHorizontal
* LightDown
* LightUp
* LightGrid
* LightTrellis

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelFillStyle]`|false   |named   |False        |

#### **TitleBackgroundColor**
Sets the cell background color for the title cell.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **TitleBold**
Sets the title in boldface type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TitleSize**
Sets the point size for the title.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **PivotTableDefinition**
Hashtable(s) with Sheet PivotRows, PivotColumns, PivotData, IncludePivotChart and ChartType values to specify a definition for one or morePivotTable(s).

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |False        |

#### **ExcelChartDefinition**
A hashtable containing ChartType, Title, NoLegend, ShowCategory, ShowPercent, Yrange, Xrange and SeriesHeader for one or more [non-pivot] charts.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |False        |

#### **ConditionalFormat**
One or more conditional formatting rules defined with New-ConditionalFormattingIconSet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |False        |

#### **ConditionalText**
Applies a Conditional formatting rule defined with New-ConditionalText.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |False        |

#### **AutoNameRange**
Makes each column a named range.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RangeName**
Makes the data in the worksheet a named range.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TableName**
Makes the data in the worksheet a table with a name and applies a style to it. Name must not contain spaces.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **TableStyle**
Selects the style for the named table - defaults to "Medium6".
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

#### **ReturnRange**
If specified, returns the range of cells in the combined sheet, in the format "A1:Z100".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Show**
Opens the Excel file immediately after creation. Convenient for viewing the results instantly without having to search for the file first.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PassThru**
If specified, an object representing the unsaved Excel package will be returned, it then needs to be saved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
Join-Worksheet [[-Path] <String>] [-WorkSheetName <Object>] [-Clearsheet] [-NoHeader] [-FromLabel <String>] [-LabelBlocks] [-AutoSize] [-FreezeTopRow] [-FreezeFirstColumn] [-FreezeTopRowFirstColumn] [-FreezePane <Int32[]>] [-AutoFilter] [-BoldTopRow] [-HideSource] [-Title <String>] [-TitleFillPattern {None | Solid | DarkGray | MediumGray | LightGray | Gray125 | Gray0625 | DarkVertical | DarkHorizontal | DarkDown | DarkUp | DarkGrid | DarkTrellis | LightVertical | LightHorizontal | LightDown | LightUp | LightGrid | LightTrellis}] [-TitleBackgroundColor <Object>] [-TitleBold] [-TitleSize <Int32>] [-PivotTableDefinition <Hashtable>] [-ExcelChartDefinition <Object[]>] [-ConditionalFormat <Object[]>] [-ConditionalText <Object[]>] [-AutoNameRange] [-RangeName <String>] [-ReturnRange] [-Show] [-PassThru] [<CommonParameters>]
```
```PowerShell
Join-Worksheet [[-Path] <String>] [-WorkSheetName <Object>] [-Clearsheet] [-NoHeader] [-FromLabel <String>] [-LabelBlocks] [-AutoSize] [-FreezeTopRow] [-FreezeFirstColumn] [-FreezeTopRowFirstColumn] [-FreezePane <Int32[]>] [-BoldTopRow] [-HideSource] [-Title <String>] [-TitleFillPattern {None | Solid | DarkGray | MediumGray | LightGray | Gray125 | Gray0625 | DarkVertical | DarkHorizontal | DarkDown | DarkUp | DarkGrid | DarkTrellis | LightVertical | LightHorizontal | LightDown | LightUp | LightGrid | LightTrellis}] [-TitleBackgroundColor <Object>] [-TitleBold] [-TitleSize <Int32>] [-PivotTableDefinition <Hashtable>] [-ExcelChartDefinition <Object[]>] [-ConditionalFormat <Object[]>] [-ConditionalText <Object[]>] [-AutoNameRange] [-RangeName <String>] -TableName <String> [-TableStyle {None | Custom | Light1 | Light2 | Light3 | Light4 | Light5 | Light6 | Light7 | Light8 | Light9 | Light10 | Light11 | Light12 | Light13 | Light14 | Light15 | Light16 | Light17 | Light18 | Light19 | Light20 | Light21 | Medium1 | Medium2 | Medium3 | Medium4 | Medium5 | Medium6 | Medium7 | Medium8 | Medium9 | Medium10 | Medium11 | Medium12 | Medium13 | Medium14 | Medium15 | Medium16 | Medium17 | Medium18 | Medium19 | Medium20 | Medium21 | Medium22 | Medium23 | Medium24 | Medium25 | Medium26 | Medium27 | Medium28 | Dark1 | Dark2 | Dark3 | Dark4 | Dark5 | Dark6 | Dark7 | Dark8 | Dark9 | Dark10 | Dark11}] [-ReturnRange] [-Show] [-PassThru] [<CommonParameters>]
```
```PowerShell
Join-Worksheet -ExcelPackage <ExcelPackage> [-WorkSheetName <Object>] [-Clearsheet] [-NoHeader] [-FromLabel <String>] [-LabelBlocks] [-AutoSize] [-FreezeTopRow] [-FreezeFirstColumn] [-FreezeTopRowFirstColumn] [-FreezePane <Int32[]>] [-BoldTopRow] [-HideSource] [-Title <String>] [-TitleFillPattern {None | Solid | DarkGray | MediumGray | LightGray | Gray125 | Gray0625 | DarkVertical | DarkHorizontal | DarkDown | DarkUp | DarkGrid | DarkTrellis | LightVertical | LightHorizontal | LightDown | LightUp | LightGrid | LightTrellis}] [-TitleBackgroundColor <Object>] [-TitleBold] [-TitleSize <Int32>] [-PivotTableDefinition <Hashtable>] [-ExcelChartDefinition <Object[]>] [-ConditionalFormat <Object[]>] [-ConditionalText <Object[]>] [-AutoNameRange] [-RangeName <String>] -TableName <String> [-TableStyle {None | Custom | Light1 | Light2 | Light3 | Light4 | Light5 | Light6 | Light7 | Light8 | Light9 | Light10 | Light11 | Light12 | Light13 | Light14 | Light15 | Light16 | Light17 | Light18 | Light19 | Light20 | Light21 | Medium1 | Medium2 | Medium3 | Medium4 | Medium5 | Medium6 | Medium7 | Medium8 | Medium9 | Medium10 | Medium11 | Medium12 | Medium13 | Medium14 | Medium15 | Medium16 | Medium17 | Medium18 | Medium19 | Medium20 | Medium21 | Medium22 | Medium23 | Medium24 | Medium25 | Medium26 | Medium27 | Medium28 | Dark1 | Dark2 | Dark3 | Dark4 | Dark5 | Dark6 | Dark7 | Dark8 | Dark9 | Dark10 | Dark11}] [-ReturnRange] [-Show] [-PassThru] [<CommonParameters>]
```
```PowerShell
Join-Worksheet -ExcelPackage <ExcelPackage> [-WorkSheetName <Object>] [-Clearsheet] [-NoHeader] [-FromLabel <String>] [-LabelBlocks] [-AutoSize] [-FreezeTopRow] [-FreezeFirstColumn] [-FreezeTopRowFirstColumn] [-FreezePane <Int32[]>] [-AutoFilter] [-BoldTopRow] [-HideSource] [-Title <String>] [-TitleFillPattern {None | Solid | DarkGray | MediumGray | LightGray | Gray125 | Gray0625 | DarkVertical | DarkHorizontal | DarkDown | DarkUp | DarkGrid | DarkTrellis | LightVertical | LightHorizontal | LightDown | LightUp | LightGrid | LightTrellis}] [-TitleBackgroundColor <Object>] [-TitleBold] [-TitleSize <Int32>] [-PivotTableDefinition <Hashtable>] [-ExcelChartDefinition <Object[]>] [-ConditionalFormat <Object[]>] [-ConditionalText <Object[]>] [-AutoNameRange] [-RangeName <String>] [-ReturnRange] [-Show] [-PassThru] [<CommonParameters>]
```
