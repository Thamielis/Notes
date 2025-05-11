New-HTMLSpanStyle
-----------------

### Synopsis
Creates an HTML <span> element with specified styling.

---

### Description

The New-HTMLSpanStyle function generates an HTML <span> element with customizable styling options such as color, background color, font size, font weight, font style, alignment, text decoration, text transformation, and more.

---

### Examples
> EXAMPLE 1

New-HTMLSpanStyle -Content { "Hello, World!" } -Color 'red' -FontSize '12px' -FontWeight 'bold' -Alignment 'center'
Creates a <span> element with red text, font size of 12 pixels, bold weight, and centered alignment containing the text "Hello, World!".
> EXAMPLE 2

New-HTMLSpanStyle -Content { "This is underlined text" } -Color 'blue' -TextDecoration 'underline'
Creates a <span> element with blue text and underlined decoration containing the text "This is underlined text".

---

### Parameters
#### **Content**
The content to be placed within the <span> element.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Color**
The color of the text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **BackGroundColor**
The background color of the <span> element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **FontSize**
The font size of the text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **LineHeight**
The height of each line of text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **FontWeight**
The weight of the font.
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
|`[String]`|false   |6       |false        |

#### **FontStyle**
The style of the font.
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **FontVariant**
The variant of the font.
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **FontFamily**
The font family to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **Alignment**
The alignment of the text within the <span> element.
Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **TextDecoration**
The decoration to be applied to the text.
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **TextTransform**
The transformation to be applied to the text.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **Direction**
The direction of the text.
Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **Display**
The display style of the <span> element.
Valid Values:

* none
* inline
* block
* inline-block
* contents
* flex
* grid
* inline-flex
* inline-grid
* inline-table
* list-item
* run-in
* table
* table-caption
* table-column-group
* table-header-group
* table-footer-group
* table-row-group
* table-cell
* table-column
* table-row

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

#### **Opacity**
The opacity of the <span> element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |15      |false        |

#### **LineBreak**
Indicates whether to allow line breaks within the <span> element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLSpanStyle [[-Content] <ScriptBlock>] [[-Color] <String>] [[-BackGroundColor] <String>] [[-FontSize] <Object>] [[-LineHeight] <String>] [[-FontWeight] <String>] [[-FontStyle] <String>] [[-FontVariant] <String>] [[-FontFamily] <String>] [[-Alignment] <String>] [[-TextDecoration] <String>] [[-TextTransform] <String>] [[-Direction] <String>] [[-Display] <String>] [[-Opacity] <Double>] [-LineBreak] [<CommonParameters>]
```
