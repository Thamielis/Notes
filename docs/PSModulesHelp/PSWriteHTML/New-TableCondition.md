New-TableCondition
------------------

### Synopsis
Creates a new table condition with specified parameters and styling options for pass and fail conditions.

---

### Description

This function creates a new table condition with the specified parameters and allows customization of the styling options for both pass and fail conditions.

---

### Examples
> EXAMPLE 1

```PowerShell
An example of how to use this function.
```

---

### Parameters
#### **Name**
Specifies the name of the condition.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |1       |false        |ColumnName|

#### **HighlightHeaders**
Specifies an array of headers to highlight based on the condition.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **ComparisonType**
Specifies the type of comparison to be performed. Valid values are 'number', 'string', 'bool', or 'date'.
Valid Values:

* number
* string
* bool
* date

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |3       |false        |Type   |

#### **Operator**
Specifies the comparison operator to be used.
Valid Values:

* lt
* le
* eq
* ge
* gt
* ne
* contains
* like
* notlike
* notcontains
* between
* betweenInclusive
* in
* notin

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Value**
Specifies the value to compare against.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |5       |false        |

#### **Row**
Switch parameter to indicate if the styling should be applied to the entire row.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Inline**
Switch parameter to indicate if the styling should be applied inline.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CaseSensitive**
Switch parameter to indicate if the comparison should be case-sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DateTimeFormat**
Specifies the format for date and time comparisons.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **ReverseCondition**
Switch parameter to reverse the comparison logic.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Color**
Specifies the text color for pass conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **BackgroundColor**
Specifies the background color for pass conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **FontSize**
Specifies the font size for pass conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **FontWeight**
Specifies the font weight for pass conditions.
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
|`[String]`|false   |10      |false        |

#### **FontStyle**
Specifies the font style for pass conditions.
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **FontVariant**
Specifies the font variant for pass conditions.
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **FontFamily**
Specifies the font family for pass conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **Alignment**
Specifies the alignment for pass conditions.
Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

#### **TextDecoration**
Specifies the text decoration for pass conditions.
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **TextTransform**
Specifies the text transformation for pass conditions.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |16      |false        |

#### **Direction**
Specifies the text direction for pass conditions.
Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |17      |false        |

#### **FailColor**
Specifies the text color for fail conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |18      |false        |

#### **FailBackgroundColor**
Specifies the background color for fail conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |19      |false        |

#### **FailFontSize**
Specifies the font size for fail conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |20      |false        |

#### **FailFontWeight**
Specifies the font weight for fail conditions.
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
|`[String]`|false   |21      |false        |

#### **FailFontStyle**
Specifies the font style for fail conditions.
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |22      |false        |

#### **FailFontVariant**
Specifies the font variant for fail conditions.
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |23      |false        |

#### **FailFontFamily**
Specifies the font family for fail conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |24      |false        |

#### **FailAlignment**
Specifies the alignment for fail conditions.
Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |25      |false        |

#### **FailTextDecoration**
Specifies the text decoration for fail conditions.
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |26      |false        |

#### **FailTextTransform**
Specifies the text transformation for fail conditions.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |27      |false        |

#### **FailDirection**
Specifies the text direction for fail conditions.
Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |28      |false        |

---

### Notes
Additional notes about the function.

---

### Syntax
```PowerShell
New-TableCondition [-Name] <String> [[-HighlightHeaders] <String[]>] [[-ComparisonType] <String>] [[-Operator] <String>] [-Value] <Object> [-Row] [-Inline] [-CaseSensitive] [[-DateTimeFormat] <String>] [-ReverseCondition] [[-Color] <String>] [[-BackgroundColor] <String>] [[-FontSize] <Object>] [[-FontWeight] <String>] [[-FontStyle] <String>] [[-FontVariant] <String>] [[-FontFamily] <String>] [[-Alignment] <String>] [[-TextDecoration] <String>] [[-TextTransform] <String>] [[-Direction] <String>] [[-FailColor] <String>] [[-FailBackgroundColor] <String>] [[-FailFontSize] <Object>] [[-FailFontWeight] <String>] [[-FailFontStyle] <String>] [[-FailFontVariant] <String>] [[-FailFontFamily] <String>] [[-FailAlignment] <String>] [[-FailTextDecoration] <String>] [[-FailTextTransform] <String>] [[-FailDirection] <String>] [<CommonParameters>]
```
