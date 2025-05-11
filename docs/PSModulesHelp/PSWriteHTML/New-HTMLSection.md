New-HTMLSection
---------------

### Synopsis
Creates a new HTML section with customizable styling options.

---

### Description

The New-HTMLSection function creates a new HTML section with various customizable styling options such as text alignment, background color, flexbox properties, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLSection -Content { "This is the content of the section." } -HeaderText "Section Title" -HeaderTextColor "blue" -HeaderTextSize "20px" -HeaderTextAlignment "center" -HeaderBackGroundColor "lightgray" -BackgroundColor "white" -CanCollapse -Height "200px" -Width "50%" -Wrap "wrap" -Direction "row" -AlignContent "center" -AlignItems "center" -JustifyContent "flex-start" -BorderRadius "10px" -AnchorName "section1" -StyleSheetsConfiguration @{ Section = 'customSection'; SectionText = 'customSectionText' }
```
> EXAMPLE 2

```PowerShell
$content = {
    "This is a sample content."
}
New-HTMLSection -Content $content -HeaderText "Sample Section" -HeaderTextColor "red" -HeaderTextSize "18px" -HeaderTextAlignment "left" -HeaderBackGroundColor "lightblue" -BackgroundColor "lightyellow" -Height "150px" -Wrap "nowrap" -Direction "column" -AlignContent "flex-start" -AlignItems "flex-start" -JustifyContent "center" -BorderRadius "5px" -AnchorName "sampleSection" -StyleSheetsConfiguration @{ Section = 'customSection'; SectionText = 'customSectionText' }
```

---

### Parameters
#### **Content**
Specifies the content of the HTML section as a ScriptBlock.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **HeaderText**
Specifies the header text of the section.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |Name<br/>Title|

#### **HeaderTextColor**
Specifies the text color of the header.

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|false   |named   |false        |TextColor|

#### **HeaderTextSize**
Specifies the text size of the header.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|false   |named   |false        |TextSize|

#### **HeaderTextAlignment**
Specifies the text alignment of the header. Valid values are 'center', 'left', 'right', 'justify'.
Valid Values:

* center
* left
* right
* justify

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |named   |false        |TextAlignment|

#### **HeaderBackGroundColor**
Specifies the background color of the header.

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[String]`|false   |named   |false        |TextBackGroundColor|

#### **BackgroundColor**
Specifies the background color of the section.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|false   |named   |false        |BackgroundShade|

#### **CanCollapse**
Indicates whether the section can be collapsed.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|false   |named   |false        |Collapsable|

#### **IsHidden**
Indicates whether the section is initially hidden.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Collapsed**
Indicates whether the section is collapsed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Height**
Specifies the height of the section.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **Width**
Specifies the width of the section. Default value is '100%'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **Invisible**
Indicates whether the section is invisible.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Margin**
Specifies the margin of the section.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **Wrap**
Specifies the flex-wrap property. Valid values are 'wrap', 'nowrap', 'wrap-reverse'.
Valid Values:

* wrap
* nowrap
* wrap-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Direction**
Specifies the flex-direction property. Valid values are 'row', 'row-reverse', 'column', 'column-reverse'.
Valid Values:

* row
* row-reverse
* column
* column-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AlignContent**
Specifies the align-content property. Valid values are 'flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch'.
Valid Values:

* flex-start
* flex-end
* center
* space-between
* space-around
* stretch

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AlignItems**
Specifies the align-items property. Valid values are 'stretch', 'flex-start', 'flex-end', 'center', 'baseline'.
Valid Values:

* stretch
* flex-start
* flex-end
* center
* baseline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **JustifyContent**
Specifies the justify-content property. Valid values are 'flex-start', 'flex-end', 'center'.
Valid Values:

* flex-start
* flex-end
* center

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderRadius**
Specifies the border radius of the section. Valid values are '0px', '5px', '10px', '15px', '20px', '25px'.
Valid Values:

* 0px
* 5px
* 10px
* 15px
* 20px
* 25px

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AnchorName**
Specifies the anchor name for the section.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StyleSheetsConfiguration**
Specifies the configuration for style sheets.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLSection [[-Content] <ScriptBlock>] [-HeaderText <String>] [-HeaderTextColor <String>] [-HeaderTextSize <String>] [-HeaderTextAlignment <String>] [-HeaderBackGroundColor <String>] [-BackgroundColor <String>] [-CanCollapse] [-IsHidden] [-Collapsed] [-Height <Object>] [-Width <Object>] [-Invisible] [-Margin <Object>] [-Wrap <String>] [-Direction <String>] [-AlignContent <String>] [-AlignItems <String>] [-JustifyContent <String>] [-BorderRadius <String>] [-AnchorName <String>] [-StyleSheetsConfiguration <IDictionary>] [<CommonParameters>]
```
