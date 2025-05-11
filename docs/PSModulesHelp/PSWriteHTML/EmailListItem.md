EmailListItem
-------------

### Synopsis
Creates an HTML list item with customizable text styling.

---

### Description

The EmailListItem function generates an HTML list item with customizable text styling options such as color, font size, font weight, font style, alignment, text decoration, text transformation, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
EmailListItem -Text "Example Text" -Color "red" -FontSize 14 -FontWeight "bold" -Alignment "center"
Creates an HTML list item with the text "Example Text" in red color, font size 14, bold font weight, and centered alignment.
```

---

### Parameters
#### **Text**
Specifies the text content of the list item.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Color**
Specifies the color of the text. Default is an empty array.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **BackGroundColor**
Specifies the background color of the list item. Default is an empty array.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **FontSize**
Specifies the font size of the text. Default is an empty array.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |4       |false        |

#### **FontWeight**
Specifies the font weight of the text. Valid values are 'normal', 'bold', 'bolder', 'lighter', and numeric values from 100 to 900. Default is an empty array.
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
|`[String[]]`|false   |5       |false        |

#### **FontStyle**
Specifies the font style of the text. Valid values are 'normal', 'italic', 'oblique'. Default is an empty array.
Valid Values:

* normal
* italic
* oblique

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **FontVariant**
Specifies the font variant of the text. Valid values are 'normal', 'small-caps'. Default is an empty array.
Valid Values:

* normal
* small-caps

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |7       |false        |

#### **FontFamily**
Specifies the font family of the text. Default is an empty array.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |8       |false        |

#### **Alignment**
Specifies the alignment of the text. Valid values are 'left', 'center', 'right', 'justify'. Default is an empty array.
Valid Values:

* left
* center
* right
* justify

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |9       |false        |

#### **TextDecoration**
Specifies the text decoration of the text. Valid values are 'none', 'line-through', 'overline', 'underline'. Default is an empty array.
Valid Values:

* none
* line-through
* overline
* underline

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |10      |false        |

#### **TextTransform**
Specifies the text transformation of the text. Valid values are 'uppercase', 'lowercase', 'capitalize'. Default is an empty array.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |11      |false        |

#### **Direction**
Specifies the direction of the text. Valid value is 'rtl'. Default is an empty array.
Valid Values:

* rtl

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |12      |false        |

#### **LineBreak**
Indicates whether a line break should be added after the list item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
EmailListItem [[-Text] <String[]>] [[-Color] <String[]>] [[-BackGroundColor] <String[]>] [[-FontSize] <Int32[]>] [[-FontWeight] <String[]>] [[-FontStyle] <String[]>] [[-FontVariant] <String[]>] [[-FontFamily] <String[]>] [[-Alignment] <String[]>] [[-TextDecoration] <String[]>] [[-TextTransform] <String[]>] [[-Direction] <String[]>] [-LineBreak] [<CommonParameters>]
```
