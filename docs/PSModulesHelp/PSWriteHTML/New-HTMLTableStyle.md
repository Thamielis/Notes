New-HTMLTableStyle
------------------

### Synopsis
Apply new style for HTML Table

---

### Description

Apply new style for HTML Table. Currently only works with DataTables (javascript). It doesn't affect CSS only tables (emails, etc). Keep in mind this affects all tables, not just one.

---

### Examples
> EXAMPLE 1

```PowerShell
$Table = Get-Process | Select-Object -First 3
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Yellow -TextColor Aquamarine -TextAlign center -Type RowOdd
New-HTMLTableStyle -BackgroundColor Red -TextColor Aquamarine -Type Button
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type RowEven
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type Row
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type Header
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Orange -TextColor Aquamarine -TextAlign center -Type Footer
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Orange -TextColor Aquamarine -TextAlign center -Type RowSelectedEven
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Green -TextColor Aquamarine -TextAlign center -Type RowSelectedOdd
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Yellow -TextColor Aquamarine -TextAlign center -Type RowHover
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Red -TextColor Aquamarine -TextAlign center -Type RowHoverSelected
New-HTMLTableStyle -Type Header -BorderLeftStyle dashed -BorderLeftColor Red -BorderLeftWidthSize 1px
New-HTMLTableStyle -Type Footer -BorderLeftStyle dotted -BorderLeftColor Red -BorderleftWidthSize 1px
New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle solid
New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle solid
New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle none

New-HTML -ShowHTML -HtmlData {
    New-HTMLTable -DataTable $table -HideButtons {

    } -DisablePaging
} -FilePath $PSScriptRoot\Example7_TableStyle.html -Online
```

---

### Parameters
#### **Type**
Choose type to apply style on. You can choose from: 'Content', 'Table', 'Header', 'Row', 'Footer', 'RowOdd', 'RowEven', 'RowSelected', 'RowSelectedEven', 'RowSelectedOdd', 'RowHover', 'RowHoverSelected', 'Button'. Content is duplicate to Row.
Valid Values:

* Content
* Table
* Header
* Row
* Footer
* RowOdd
* RowEven
* RowSelected
* RowSelectedEven
* RowSelectedOdd
* RowHover
* RowHoverSelected
* Button

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontSize**
Set font size for the text.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|false   |named   |false        |TextSize|

#### **FontWeight**
Set font weight for the text. Allowed options: 'normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900'
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
|`[String]`|false   |named   |false        |

#### **FontStyle**
Set different font styles to be used for text. Allowed styles: 'normal', 'italic', 'oblique'
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontVariant**
Set different font variant to be used for text. Allowed variants: 'normal', 'small-caps'. In a small-caps font, all lowercase letters are converted to uppercase letters. However, the converted uppercase letters appears in a smaller font size than the original uppercase letters in the text.
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontFamily**
Specify the font to be used for text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BackgroundColor**
Set the background color. Choose one of the 800 colors or provide a hex value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextColor**
Set the text color. Choose one of the 800 colors or provide a hex value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextDecoration**
Set different font decoration. Allowed options are: 'none', 'line-through', 'overline', 'underline'
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextTransform**
Set different text transform. Allowed options are: 'uppercase', 'lowercase', 'capitalize'
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextAlign**
Set the text alignment. Allowed options are: 'left', 'right', 'center', 'justify'
Valid Values:

* left
* right
* center
* justify

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[String]`|false   |named   |false        |FontAlign<br/>Align|

#### **BorderTopStyle**
Set the border style for the top border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'
Valid Values:

* none
* hidden
* dotted
* dashed
* solid
* double
* groove
* ridge
* inset
* outset

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **BorderTopColor**
Set the border color for the top border

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderTopWidthSize**
Set the border width for the top border

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderBottomStyle**
Set the border style for the bottom border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'
Valid Values:

* none
* hidden
* dotted
* dashed
* solid
* double
* groove
* ridge
* inset
* outset

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **BorderBottomColor**
Set the border color for the bottom border

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderBottomWidthSize**
Set the border width for the bottom border

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderLeftStyle**
Set the border style for the left border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'
Valid Values:

* none
* hidden
* dotted
* dashed
* solid
* double
* groove
* ridge
* inset
* outset

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **BorderLeftColor**
Set the border color for the left border

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderLeftWidthSize**
Set the border width for the left border

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderRightStyle**
Set the border style for the right border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'
Valid Values:

* none
* hidden
* dotted
* dashed
* solid
* double
* groove
* ridge
* inset
* outset

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **BorderRightColor**
Set the border color for the right border

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderRightWidthSize**
Set the border width for the right border

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-HTMLTableStyle [-Type <String>] [-FontSize <String>] [-FontWeight <String>] [-FontStyle <String>] [-FontVariant <String>] [-FontFamily <String>] [-BackgroundColor <String>] [-TextColor <String>] [-TextDecoration <String>] [-TextTransform <String>] [-TextAlign <String>] [-BorderTopStyle <Object>] [-BorderTopColor <String>] [-BorderTopWidthSize <String>] [-BorderBottomStyle <Object>] [-BorderBottomColor <String>] [-BorderBottomWidthSize <String>] [-BorderLeftStyle <Object>] [-BorderLeftColor <String>] [-BorderLeftWidthSize <String>] [-BorderRightStyle <Object>] [-BorderRightColor <String>] [-BorderRightWidthSize <String>] [<CommonParameters>]
```
