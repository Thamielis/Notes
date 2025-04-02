Set-ExcelRow
------------

### Synopsis
Fills values into a [new] row in an Excel spreadsheet, and sets row formats.

---

### Description

Set-ExcelRow accepts either a Worksheet object or an ExcelPackage object returned by Export-Excel and the name of a sheet, and inserts the chosen contents into a row of the sheet.

The contents can be a constant, like "42", a formula or a script block which is converted into a constant or a formula.

The first cell of the row can optionally be given a heading.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

PS\> Set-ExcelRow -Worksheet $ws -Heading Total -Value {"=sum($columnName`2:$columnName$endrow)" }
$Ws contains a worksheet object, and no Row number is specified so Set-ExcelRow will select the next row after the end of the data in the sheet.

The first cell in the row will contain "Total", and each of the other cells will contain =Sum(xx2:xx99) where xx is the column name, and 99 is the last row of data.

Note the use of the backtick in the script block (`2) to Prevent 2 becoming part of the variable "ColumnName"

The script block can use $Worksheet, $Row, $Column (number), $ColumnName (letter), $StartRow/Column and $EndRow/Column.
> EXAMPLE 2

```PowerShell
PS\> Set-ExcelRow -Worksheet $ws -Heading Total -HeadingBold -Value {"=sum($columnName`2:$columnName$endrow)" } -NumberFormat 'Currency' -StartColumn 2 -Bold -BorderTop Double -BorderBottom Thin
This builds on the previous example, but this time the label "Total" appears in column 2 and the formula fills from column 3 onwards.

The formula and heading are set in bold face, and the formula is formatted for the local currency, and given a double line border above and single line border below.
```

---

### Parameters
#### **ExcelPackage**
An Excel package object - for example from Export-Excel -PassThru - if specified requires a sheet name to be passed a parameter.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[ExcelPackage]`|true    |named   |False        |

#### **Worksheetname**
The name of the sheet to update in the package.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Worksheet**
A worksheet object instead of passing a name and package.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelWorksheet]`|true    |named   |False        |

#### **Row**
Row to fill right - first row is 1. 0 will be interpreted as first unused row.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |named   |True (ByValue)|

#### **StartColumn**
Position in the row to start from.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Value**
Value, Formula or ScriptBlock to fill in. A ScriptBlock can use $worksheet, $row, $Column [number], $ColumnName [letter(s)], $startRow, $startColumn, $endRow, $endColumn.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Heading**
Optional row-heading.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **HeadingBold**
Set the heading in bold type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HeadingSize**
Change the font-size of the heading.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **NumberFormat**
Number format to apply to cells e.g. "dd/MM/yyyy HH:mm", "£\#,\#\#0.00;[Red]-£\#,\#\#0.00", "0.00%" , "\#\#/\#\#" , "0.0E+0" etc.

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

#### **BorderColor**
Color of the border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **BorderBottom**
Style for the bottom border.
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

#### **BorderTop**
Style for the top border.
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

#### **BorderLeft**
Style for the left border.
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

#### **BorderRight**
Style for the right border.
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
Color for the text - if not specified the font will be left as it it is.

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
Subscript or Superscript (or none).
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
Background pattern - solid by default.
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
Position cell contents to Left, Right, Center etc. default is 'General'.
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
Degrees to rotate text. Up to +90 for anti-clockwise ("upwards"), or to -90 for clockwise.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Height**
Set cells to a fixed height.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |named   |False        |

#### **Hide**
Hide the row.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |Hidden |

#### **ReturnRange**
If sepecified, returns the range of cells which were affected.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PassThru**
If Specified, return a row object to allow further work to be done.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Outputs
* OfficeOpenXml.ExcelRow

* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
Set-ExcelRow -ExcelPackage <ExcelPackage> [-Worksheetname <Object>] [-Row <Object>] [-StartColumn <Int32>] [-Value <Object>] [-Heading <Object>] [-HeadingBold] [-HeadingSize <Int32>] [-NumberFormat <Object>] [-BorderAround {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderColor <Object>] [-BorderBottom {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderTop {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderLeft {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderRight {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-FontColor <Object>] [-Bold] [-Italic] [-Underline] [-UnderLineType {None | Single | Double | SingleAccounting | DoubleAccounting}] [-StrikeThru] [-FontShift {None | Baseline | Subscript | Superscript}] [-FontName <String>] [-FontSize <Single>] [-BackgroundColor <Object>] [-BackgroundPattern {None | Solid | DarkGray | MediumGray | LightGray | Gray125 | Gray0625 | DarkVertical | DarkHorizontal | DarkDown | DarkUp | DarkGrid | DarkTrellis | LightVertical | LightHorizontal | LightDown | LightUp | LightGrid | LightTrellis}] [-PatternColor <Object>] [-WrapText] [-HorizontalAlignment {General | Left | Center | CenterContinuous | Right | Fill | Distributed | Justify}] [-VerticalAlignment {Top | Center | Bottom | Distributed | Justify}] [-TextRotation <Int32>] [-Height <Single>] [-Hide] [-ReturnRange] [-PassThru] [<CommonParameters>]
```
```PowerShell
Set-ExcelRow -Worksheet <ExcelWorksheet> [-Row <Object>] [-StartColumn <Int32>] [-Value <Object>] [-Heading <Object>] [-HeadingBold] [-HeadingSize <Int32>] [-NumberFormat <Object>] [-BorderAround {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderColor <Object>] [-BorderBottom {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderTop {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderLeft {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderRight {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-FontColor <Object>] [-Bold] [-Italic] [-Underline] [-UnderLineType {None | Single | Double | SingleAccounting | DoubleAccounting}] [-StrikeThru] [-FontShift {None | Baseline | Subscript | Superscript}] [-FontName <String>] [-FontSize <Single>] [-BackgroundColor <Object>] [-BackgroundPattern {None | Solid | DarkGray | MediumGray | LightGray | Gray125 | Gray0625 | DarkVertical | DarkHorizontal | DarkDown | DarkUp | DarkGrid | DarkTrellis | LightVertical | LightHorizontal | LightDown | LightUp | LightGrid | LightTrellis}] [-PatternColor <Object>] [-WrapText] [-HorizontalAlignment {General | Left | Center | CenterContinuous | Right | Fill | Distributed | Justify}] [-VerticalAlignment {Top | Center | Bottom | Distributed | Justify}] [-TextRotation <Int32>] [-Height <Single>] [-Hide] [-ReturnRange] [-PassThru] [<CommonParameters>]
```
