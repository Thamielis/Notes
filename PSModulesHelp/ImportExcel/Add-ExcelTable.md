Add-ExcelTable
--------------

### Synopsis
Adds Tables to Excel workbooks.

---

### Description

Unlike named ranges, where the name only needs to be unique within a sheet, Table names must be unique in the workbook.

Tables carry formatting and by default have a filter.

The filter, header, totals, first and last column highlights can all be configured.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

```PowerShell
PS\> Add-ExcelTable -Range $ws.Cells[$dataRange] -TableName $TableName
```

$WS is a worksheet, and $dataRange is a string describing a range of cells - for example "A1:Z10". This range which will become a table, named $TableName

> EXAMPLE 2

```PowerShell
PS\> Add-ExcelTable -Range $ws.cells[$($ws.Dimension.address)] -TableStyle Light1 -TableName Musictable -ShowFilter:$false -ShowTotal -ShowFirstColumn
Again $ws is a worksheet, range here is the whole of the active part of the worksheet. The table style and name are set, the filter is turned off, and a "Totals" row added, and first column is set in bold.
```

---

### Parameters
#### **Range**
The range of cells to assign to a table.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[ExcelRange]`|true    |1       |False        |

#### **TableName**
The name for the Table - this should be unqiue in the Workbook - auto generated names will be used if this is left empty.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |False        |

#### **TableStyle**
The Style for the table, by default "Medium6" is used
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
|`[TableStyles]`|false   |3       |False        |

#### **ShowHeader**
By default the header row is shown - it can be turned off with -ShowHeader:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShowFilter**
By default the filter is enabled - it can be turned off with -ShowFilter:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShowTotal**
Show total adds a totals row. This does not automatically sum the columns but provides a drop-down in each to select sum, average etc

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TableTotalSettings**
A HashTable in the form of either
* ColumnName = "Average"\|"Count"\|"CountNums"\|"Max"\|"Min"\|"None"\|"StdDev"\|"Sum"\|"Var"|<Custom Excel function starting with "="> -
ColumnName = @{
Function = "Average"\|"Count"\|"CountNums"\|"Max"\|"Min"\|"None"\|"StdDev"\|"Sum"\|"Var"|<Custom Excel function starting with "=">
Comment = $HoverComment
}
if specified, -ShowTotal is not needed.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |4       |False        |

#### **ShowFirstColumn**
Highlights the first column in bold.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShowLastColumn**
Highlights the last column in bold.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShowRowStripes**
By default the table formats show striped rows, the can be turned off with -ShowRowStripes:$false

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShowColumnStripes**
Turns on column stripes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PassThru**
If -PassThru is specified, the table object will be returned to allow additional changes to be made.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Outputs
* OfficeOpenXml.Table.ExcelTable

---

### Notes

---

### Syntax
```PowerShell
Add-ExcelTable [-Range] <ExcelRange> [[-TableName] <String>] [[-TableStyle] {None | Custom | Light1 | Light2 | Light3 | Light4 | Light5 | Light6 | Light7 | Light8 | Light9 | Light10 | Light11 | Light12 | Light13 | Light14 | Light15 | Light16 | Light17 | Light18 | Light19 | Light20 | Light21 | Medium1 | Medium2 | Medium3 | Medium4 | Medium5 | Medium6 | Medium7 | Medium8 | Medium9 | Medium10 | Medium11 | Medium12 | Medium13 | Medium14 | Medium15 | Medium16 | Medium17 | Medium18 | Medium19 | Medium20 | Medium21 | Medium22 | Medium23 | Medium24 | Medium25 | Medium26 | Medium27 | Medium28 | Dark1 | Dark2 | Dark3 | Dark4 | Dark5 | Dark6 | Dark7 | Dark8 | Dark9 | Dark10 | Dark11}] [[-TableTotalSettings] <Hashtable>] [-ShowHeader] [-ShowFilter] [-ShowTotal] [-ShowFirstColumn] [-ShowLastColumn] [-ShowRowStripes] [-ShowColumnStripes] [-PassThru] [<CommonParameters>]
```
