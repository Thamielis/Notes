Set-ExcelColumn
---------------

### Synopsis
Adds or modifies a column in an Excel worksheet, filling values, setting formatting and/or creating named ranges.

---

### Description

Set-ExcelColumn can take a value which is either a string containing a value or formula or a scriptblock which evaluates to a string, and optionally a column number and fills that value down the column.

A column heading can be specified, and the column can be made a named range.

The column can be formatted in the same operation.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

PS\> Set-ExcelColumn -Worksheet $ws -Column 5 -NumberFormat 'Currency'
$ws contains a worksheet object - and column "E" is set to use the local currency format.

Intelisense will complete the names of predefined number formats.

You can see how currency is interpreted on the local computer with the command Expand-NumberFormat currency
> EXAMPLE 2

PS\> Set-ExcelColumn -Worksheet $ws -Heading "WinsToFastLaps"  -Value {"=E$row/C$row"} -Column 7 -AutoSize -AutoNameRange
Here, $WS already contains a worksheet which holds counts of races won and fastest laps recorded by racing drivers (in columns C and E). Set-ExcelColumn specifies that Column 7 should have a heading of "WinsToFastLaps" and the data cells should contain =E2/C2 , =E3/C3 etc the new data cells should become a named range, which will also be named "WinsToFastLaps" and the column width will be set automatically.

When a value begins with "=", it is treated as a formula.

If value is a script block it will be evaluated, so here the string "=E$row/C$Row" will have the number of the current row inserted; see the value parameter for a list of variables which can be used.

Note than when evaluating an expression in a string, it is necessary to wrap it in $() so $row is valid but $($row+1) is needed.

To preventVariables merging into other parts of the string, use the back tick "$columnName`4" will be "G4" - without the backtick the string will look for a variable named "columnName4"
> EXAMPLE 3

```PowerShell
Set-ExcelColumn -Worksheet $ws -Heading "Link" -Value {"https://en.wikipedia.org" + $worksheet.cells["B$Row"].value  }  -AutoSize
In this example, the worksheet in $ws has partial links to Wikipedia pages in column B.

The -Value parameter is a script block which outputs a string beginning "https..." and ending with the value of the cell at column B in the current row.

When given a valid URI, Set-ExcelColumn makes it a hyperlink.

The column will be autosized to fit the links.
```
> EXAMPLE 4

```PowerShell
4..6 | Set-ExcelColumn -Worksheet $ws -AutoNameRange
Again $ws contains a worksheet. Here columns 4 to 6 are made into named ranges, row 1 is used for the range name and the rest of the column becomes the range.
```

---

### Parameters
#### **ExcelPackage**
If specifying the worksheet by name, the ExcelPackage object which contains the worksheet also needs to be passed.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[ExcelPackage]`|true    |named   |False        |

#### **Worksheetname**
The sheet to update can be given as a name or an Excel Worksheet object - this sets it by name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Worksheet**
This passes the worksheet object instead of passing a sheet name and an Excelpackage object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelWorksheet]`|true    |named   |False        |

#### **Column**
Column to fill down - the first column is 1. 0 will be interpreted as first empty column.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |named   |True (ByValue)|

#### **StartRow**
First row to fill data in.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Value**
A value, formula or scriptblock to fill in. A script block can use $worksheet, $row, $column [number], $columnName [letter(s)], $startRow, $startColumn, $endRow, $endColumn.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Heading**
Optional column heading.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **NumberFormat**
Number format to apply to cells for example "dd/MM/yyyy HH:mm", "£\#,\#\#0.00;[Red]-£\#,\#\#0.00", "0.00%" , "\#\#/\#\#" or "0.0E+0" etc.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|false   |named   |False        |NFormat|

#### **BorderAround**
Style of border to draw around the row.
Valid Values:

* None
* Hair
* Dotted
* DashDot
* Thin
* DashDotDot
* Dashed
* MediumDashDotDot
* MediumDashed
* MediumDashDot
* Thick
* Medium
* Double

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[ExcelBorderStyle]`|false   |named   |False        |

#### **FontColor**
Colour for the text - if none specified it will be left as it it is.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Bold**
Make text bold; use -Bold:$false to remove bold.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Italic**
Make text italic; use -Italic:$false to remove italic.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Underline**
Underline the text using the underline style in -UnderlineType; use -Underline:$false to remove underlining.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UnderLineType**
Specifies whether underlining should be single or double, normal or accounting mode. The default is "Single".
Valid Values:

* None
* Single
* Double
* SingleAccounting
* DoubleAccounting

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[ExcelUnderLineType]`|false   |named   |False        |

#### **StrikeThru**
Strike through text; use -StrikeThru:$false to remove strike through.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FontShift**
Subscript or Superscript (or None).
Valid Values:

* None
* Baseline
* Subscript
* Superscript

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[ExcelVerticalAlignmentFont]`|false   |named   |False        |

#### **FontName**
Font to use - Excel defaults to Calibri.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **FontSize**
Point size for the text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |named   |False        |

#### **BackgroundColor**
Change background color.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **BackgroundPattern**
Background pattern - "Solid" by default.
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

#### **PatternColor**
Secondary color for background pattern.

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Object]`|false   |named   |False        |PatternColour|

#### **WrapText**
Turn on Text-Wrapping; use -WrapText:$false to turn off wrapping.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HorizontalAlignment**
Position cell contents to Left, Right, Center etc. Default is "General".
Valid Values:

* General
* Left
* Center
* CenterContinuous
* Right
* Fill
* Distributed
* Justify

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[ExcelHorizontalAlignment]`|false   |named   |False        |

#### **VerticalAlignment**
Position cell contents to Top, Bottom or Center.
Valid Values:

* Top
* Center
* Bottom
* Distributed
* Justify

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[ExcelVerticalAlignment]`|false   |named   |False        |

#### **TextRotation**
Degrees to rotate text; up to +90 for anti-clockwise ("upwards"), or to -90 for clockwise.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **AutoSize**
Attempt to auto-fit cells to the width their contents.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |AutoFit|

#### **Width**
Set cells to a fixed width, ignored if -AutoSize is specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |named   |False        |

#### **AutoNameRange**
Set the inserted data to be a named range.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Hide**
Hide the column.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |Hidden |

#### **Specified**
If specified, returns the range of cells which were affected.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PassThru**
If specified, return an object representing the Column, to allow further work to be done on it.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Outputs
* OfficeOpenXml.ExcelColumn

* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
Set-ExcelColumn -ExcelPackage <ExcelPackage> [-Worksheetname <String>] [-Column <Object>] [-StartRow <Int32>] [-Value <Object>] [-Heading <Object>] [-NumberFormat <Object>] [-BorderAround {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-FontColor <Object>] [-Bold] [-Italic] [-Underline] [-UnderLineType {None | Single | Double | SingleAccounting | DoubleAccounting}] [-StrikeThru] [-FontShift {None | Baseline | Subscript | Superscript}] [-FontName <String>] [-FontSize <Single>] [-BackgroundColor <Object>] [-BackgroundPattern {None | Solid | DarkGray | MediumGray | LightGray | Gray125 | Gray0625 | DarkVertical | DarkHorizontal | DarkDown | DarkUp | DarkGrid | DarkTrellis | LightVertical | LightHorizontal | LightDown | LightUp | LightGrid | LightTrellis}] [-PatternColor <Object>] [-WrapText] [-HorizontalAlignment {General | Left | Center | CenterContinuous | Right | Fill | Distributed | Justify}] [-VerticalAlignment {Top | Center | Bottom | Distributed | Justify}] [-TextRotation <Int32>] [-AutoSize] [-Width <Single>] [-AutoNameRange] [-Hide] [-Specified] [-PassThru] [<CommonParameters>]
```
```PowerShell
Set-ExcelColumn -Worksheet <ExcelWorksheet> [-Column <Object>] [-StartRow <Int32>] [-Value <Object>] [-Heading <Object>] [-NumberFormat <Object>] [-BorderAround {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-FontColor <Object>] [-Bold] [-Italic] [-Underline] [-UnderLineType {None | Single | Double | SingleAccounting | DoubleAccounting}] [-StrikeThru] [-FontShift {None | Baseline | Subscript | Superscript}] [-FontName <String>] [-FontSize <Single>] [-BackgroundColor <Object>] [-BackgroundPattern {None | Solid | DarkGray | MediumGray | LightGray | Gray125 | Gray0625 | DarkVertical | DarkHorizontal | DarkDown | DarkUp | DarkGrid | DarkTrellis | LightVertical | LightHorizontal | LightDown | LightUp | LightGrid | LightTrellis}] [-PatternColor <Object>] [-WrapText] [-HorizontalAlignment {General | Left | Center | CenterContinuous | Right | Fill | Distributed | Justify}] [-VerticalAlignment {Top | Center | Bottom | Distributed | Justify}] [-TextRotation <Int32>] [-AutoSize] [-Width <Single>] [-AutoNameRange] [-Hide] [-Specified] [-PassThru] [<CommonParameters>]
```
