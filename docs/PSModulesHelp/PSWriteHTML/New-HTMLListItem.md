New-HTMLListItem
----------------

### Synopsis
Creates a new HTML list item with customizable styling options.

---

### Description

The New-HTMLListItem function generates an HTML list item with various styling options such as text color, background color, font size, font weight, alignment, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLListItem -Text 'Item 1' -Color 'blue' -FontSize '12px' -FontWeight 'bold' -Alignment 'center'
Creates an HTML list item with the text 'Item 1' in blue color, font size of 12 pixels, bold font weight, and centered alignment.
```
> EXAMPLE 2

```PowerShell
New-HTMLListItem -Text 'Item 2' -FontFamily 'Arial' -TextDecoration 'underline' -Direction 'rtl'
Creates an HTML list item with the text 'Item 2' in Arial font family, underlined text decoration, and right-to-left direction.
```

---

### Parameters
#### **NestedListItems**
Specifies the nested list items to be included within the current list item.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Text**
Specifies the text content of the list item.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Color**
Specifies the color of the text in the list item.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **BackGroundColor**
Specifies the background color of the list item.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **FontSize**
Specifies the font size of the text in the list item.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |false        |

#### **FontWeight**
Specifies the weight of the font. Valid values include 'normal', 'bold', 'bolder', 'lighter', and numeric values from 100 to 900.
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

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontStyle**
Specifies the style of the font. Valid values are 'normal', 'italic', and 'oblique'.
Valid Values:

* normal
* italic
* oblique

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontVariant**
Specifies the variant of the font. Valid values are 'normal' and 'small-caps'.
Valid Values:

* normal
* small-caps

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontFamily**
Specifies the font family for the text in the list item.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Alignment**
Specifies the alignment of the text within the list item. Valid values are 'left', 'center', 'right', and 'justify'.
Valid Values:

* left
* center
* right
* justify

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **TextDecoration**
Specifies the decoration of the text. Valid values are 'none', 'line-through', 'overline', and 'underline'.
Valid Values:

* none
* line-through
* overline
* underline

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **TextTransform**
Specifies the transformation of the text. Valid values are 'uppercase', 'lowercase', and 'capitalize'.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Direction**
Specifies the direction of the text. Valid value is 'rtl' (right-to-left).
Valid Values:

* rtl

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **LineBreak**
Indicates whether to include a line break after the list item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLListItem [[-NestedListItems] <ScriptBlock>] [[-Text] <String[]>] [[-Color] <String[]>] [[-BackGroundColor] <String[]>] [-FontSize <Object[]>] [-FontWeight <String[]>] [-FontStyle <String[]>] [-FontVariant <String[]>] [-FontFamily <String[]>] [-Alignment <String[]>] [-TextDecoration <String[]>] [-TextTransform <String[]>] [-Direction <String[]>] [-LineBreak] [<CommonParameters>]
```
