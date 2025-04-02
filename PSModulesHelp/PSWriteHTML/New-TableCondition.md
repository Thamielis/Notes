New-TableCondition
------------------

### Synopsis
Short description

---

### Description

Long description

---

### Examples
> EXAMPLE 1

```PowerShell
An example
```

---

### Parameters
#### **Name**
Parameter description

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |1       |false        |ColumnName|

#### **HighlightHeaders**
By default Name parameter is used as column to be highlighted. In case you want to specify different header(s) to be highlighted you can use this parameter.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **ComparisonType**
Parameter description
Valid Values:

* number
* string
* bool
* date

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |3       |false        |Type   |

#### **Operator**
Parameter description
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
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |5       |false        |

#### **Row**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Inline**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CaseSensitive**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DateTimeFormat**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **ReverseCondition**
By default ColumnValue (left side) is being compared to Condition Value (right side). This switch reverses the comparison

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Color**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **BackgroundColor**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **FontSize**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **FontWeight**
Parameter description
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
Parameter description
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **FontVariant**
Parameter description
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **FontFamily**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **Alignment**
Parameter description
Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

#### **TextDecoration**
Parameter description
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **TextTransform**
Parameter description
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |16      |false        |

#### **Direction**
Parameter description
Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |17      |false        |

#### **FailColor**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |18      |false        |

#### **FailBackgroundColor**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |19      |false        |

#### **FailFontSize**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |20      |false        |

#### **FailFontWeight**
Parameter description
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
Parameter description
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |22      |false        |

#### **FailFontVariant**
Parameter description
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |23      |false        |

#### **FailFontFamily**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |24      |false        |

#### **FailAlignment**
Parameter description
Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |25      |false        |

#### **FailTextDecoration**
Parameter description
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |26      |false        |

#### **FailTextTransform**
Parameter description
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |27      |false        |

#### **FailDirection**
Parameter description
Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |28      |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-TableCondition [-Name] <String> [[-HighlightHeaders] <String[]>] [[-ComparisonType] <String>] [[-Operator] <String>] [-Value] <Object> [-Row] [-Inline] [-CaseSensitive] [[-DateTimeFormat] <String>] [-ReverseCondition] [[-Color] <String>] [[-BackgroundColor] <String>] [[-FontSize] <Object>] [[-FontWeight] <String>] [[-FontStyle] <String>] [[-FontVariant] <String>] [[-FontFamily] <String>] [[-Alignment] <String>] [[-TextDecoration] <String>] [[-TextTransform] <String>] [[-Direction] <String>] [[-FailColor] <String>] [[-FailBackgroundColor] <String>] [[-FailFontSize] <Object>] [[-FailFontWeight] <String>] [[-FailFontStyle] <String>] [[-FailFontVariant] <String>] [[-FailFontFamily] <String>] [[-FailAlignment] <String>] [[-FailTextDecoration] <String>] [[-FailTextTransform] <String>] [[-FailDirection] <String>] [<CommonParameters>]
```
