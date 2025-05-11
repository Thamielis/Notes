New-HTMLList
------------

### Synopsis
Creates an HTML list with customizable styling options.

---

### Description

The New-HTMLList function generates an HTML list with various styling options such as color, font size, font weight, alignment, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLList -ListItems { 'Item 1', 'Item 2', 'Item 3' } -Type Unordered -Color 'blue' -FontSize 12 -FontWeight 'bold' -Alignment 'center'
Creates an unordered HTML list with three items ('Item 1', 'Item 2', 'Item 3') displayed in blue color, font size 12, bold font weight, and centered alignment.
```
> EXAMPLE 2

```PowerShell
New-HTMLList -ListItems { 'Apple', 'Banana', 'Cherry' } -Type Ordered -FontFamily 'Arial' -TextDecoration 'underline' -Direction 'rtl'
Creates an ordered HTML list with three items ('Apple', 'Banana', 'Cherry') using Arial font family, underlined text decoration, and right-to-left text direction.
```

---

### Parameters
#### **ListItems**
Specifies the list items to be included in the HTML list.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Type**
Specifies the type of list to create. Valid values are 'Unordered' (default) and 'Ordered'.
Valid Values:

* Unordered
* Ordered

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Color**
Specifies the color of the text in the list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BackGroundColor**
Specifies the background color of the list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontSize**
Specifies the font size of the text in the list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

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

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontStyle**
Specifies the style of the font. Valid values are 'normal', 'italic', and 'oblique'.
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontVariant**
Specifies the variant of the font. Valid values are 'normal' and 'small-caps'.
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontFamily**
Specifies the font family for the text in the list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Alignment**
Specifies the alignment of the text within the list. Valid values are 'left', 'center', 'right', and 'justify'.
Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextDecoration**
Specifies the decoration of the text. Valid values are 'none', 'line-through', 'overline', and 'underline'.
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextTransform**
Specifies the transformation of the text. Valid values are 'uppercase', 'lowercase', and 'capitalize'.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Direction**
Specifies the direction of the text. Valid value is 'rtl' (right-to-left).
Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LineBreak**
Indicates whether to include line breaks between list items.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Reversed**
Indicates whether the list should be displayed in reverse order.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLList [[-ListItems] <ScriptBlock>] [-Type <String>] [-Color <String>] [-BackGroundColor <String>] [-FontSize <Object>] [-FontWeight <String>] [-FontStyle <String>] [-FontVariant <String>] [-FontFamily <String>] [-Alignment <String>] [-TextDecoration <String>] [-TextTransform <String>] [-Direction <String>] [-LineBreak] [-Reversed] [<CommonParameters>]
```
