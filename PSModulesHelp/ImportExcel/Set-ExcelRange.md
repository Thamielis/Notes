Set-ExcelRange
--------------

### Synopsis
Applies number, font, alignment and/or color formatting, values or formulas to a range of Excel cells.

---

### Description

Set-ExcelRange was created to set the style elements for a range of cells, this includes auto-sizing and hiding, setting font elements (Name, Size, Bold, Italic, Underline & UnderlineStyle and Subscript & SuperScript), font and background colors, borders, text wrapping, rotation, alignment within cells, and number format.

It was orignally named "Set-Format", but it has been extended to set Values, Formulas and ArrayFormulas (sometimes called Ctrl-shift-Enter [CSE] formulas); because of this, the name has become Set-ExcelRange but the old name of Set-Format is preserved as an alias.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

```PowerShell
PS\> $sheet.Column(3) | Set-ExcelRange -HorizontalAlignment Right -NumberFormat "#,###" -AutoFit
Selects column 3 from a sheet object (within a workbook object, which is a child of the ExcelPackage object) and passes it to Set-ExcelRange which formats numbers as a integers with comma-separated groups, aligns it right, and auto-fits the column to the contents.
```
> EXAMPLE 2

```PowerShell
PS\> Set-ExcelRange -Range $sheet.Cells["E1:H1048576"]  -HorizontalAlignment Right -NumberFormat "#,###"
Instead of piping the address, this version specifies a block of cells and applies similar formatting.
```
> EXAMPLE 3

```PowerShell
PS\> Set-ExcelRange $excel.Workbook.Worksheets[1].Tables["Processes"] -Italic
This time instead of specifying a range of cells, a table is selected by name and formatted as italic.
```

---

### Parameters
#### **Range**
One or more row(s), Column(s) and/or block(s) of cells to format.

|Type      |Required|Position|PipelineInput |Aliases|
|----------|--------|--------|--------------|-------|
|`[Object]`|false   |1       |True (ByValue)|Address|

#### **WorkSheet**
The worksheet where the format is to be applied.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelWorksheet]`|false   |named   |False        |

#### **NumberFormat**
Number format to apply to cells for example "dd/MM/yyyy HH:mm", "£\#,\#\#0.00;[Red]-£\#,\#\#0.00", "0.00%" , "\#\#/\#\#" or "0.0E+0" etc.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|false   |named   |False        |NFormat|

#### **BorderAround**
Style of border to draw around the range.
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
Colour for the text - if none is specified it will be left as it is.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[Object]`|false   |named   |False        |ForegroundColor|

#### **Value**
Value for the cell.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Formula**
Formula for the cell.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **ArrayFormula**
Specifies formula should be an array formula (a.k.a CSE [ctrl-shift-enter] formula).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ResetFont**
Clear Bold, Italic, StrikeThrough and Underline and set color to Black.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Strike through text; use -Strikethru:$false to remove Strike through

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
Background pattern - Solid by default.
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
Degrees to rotate text; up to +90 for anti-clockwise ("upwards"), or to -90 for clockwise.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **AutoSize**
Autofit cells to width (columns or ranges only).

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |AutoFit|

#### **Width**
Set cells to a fixed width (columns or ranges only), ignored if Autosize is specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |named   |False        |

#### **Height**
Set cells to a fixed height (rows or ranges only).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Single]`|false   |named   |False        |

#### **Hidden**
Hide a row or column (not a range); use -Hidden:$false to unhide.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |Hide   |

#### **Locked**
Locks cells. Cells are locked by default use -locked:$false on the whole sheet and then lock specific ones, and enable protection on the sheet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Merge**
Merges cells - it is recommended that you explicitly set -HorizontalAlignment

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
Set-ExcelRange [[-Range] <Object>] [-WorkSheet <ExcelWorksheet>] [-NumberFormat <Object>] [-BorderAround {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderColor <Object>] [-BorderBottom {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderTop {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderLeft {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-BorderRight {None | Hair | Dotted | DashDot | Thin | DashDotDot | Dashed | MediumDashDotDot | MediumDashed | MediumDashDot | Thick | Medium | Double}] [-FontColor <Object>] [-Value <Object>] [-Formula <Object>] [-ArrayFormula] [-ResetFont] [-Bold] [-Italic] [-Underline] [-UnderLineType {None | Single | Double | SingleAccounting | DoubleAccounting}] [-StrikeThru] [-FontShift {None | Baseline | Subscript | Superscript}] [-FontName <String>] [-FontSize <Single>] [-BackgroundColor <Object>] [-BackgroundPattern {None | Solid | DarkGray | MediumGray | LightGray | Gray125 | Gray0625 | DarkVertical | DarkHorizontal | DarkDown | DarkUp | DarkGrid | DarkTrellis | LightVertical | LightHorizontal | LightDown | LightUp | LightGrid | LightTrellis}] [-PatternColor <Object>] [-WrapText] [-HorizontalAlignment {General | Left | Center | CenterContinuous | Right | Fill | Distributed | Justify}] [-VerticalAlignment {Top | Center | Bottom | Distributed | Justify}] [-TextRotation <Int32>] [-AutoSize] [-Width <Single>] [-Height <Single>] [-Hidden] [-Locked] [-Merge] [<CommonParameters>]
```
