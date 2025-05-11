New-TableConditionGroup
-----------------------

### Synopsis
Creates a new table condition group with specified conditions and styling options.

---

### Description

This function creates a new table condition group with the specified conditions and allows customization of the styling options for both pass and fail conditions.

---

### Examples
> EXAMPLE 1

```PowerShell
New-TableConditionGroup -Conditions { 
    New-HTMLTableCondition -Name 'Test1' -Value 1 -ComparisonType number
    New-HTMLTableCondition -Name 'Test2' -Value 2 -ComparisonType number
} -Logic 'OR' -HighlightHeaders 'Test1', 'Test2', 'DisplayName', 'DomainName' -Color 'Green' -BackgroundColor 'LightGreen' -FontSize 12 -FontWeight 'bold' -Alignment 'center'
Description:
Creates a new table condition group with specified conditions, logic, highlighted headers, and styling options for pass conditions.
```

---

### Parameters
#### **Conditions**
Specifies the conditions to be applied within the condition group.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Logic**
Specifies the logic to be used for combining conditions. Valid values are 'AND', 'OR', or 'NONE'.
Valid Values:

* AND
* OR
* NONE

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **HighlightHeaders**
Specifies an array of headers to highlight based on the conditions.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

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

#### **Color**
Specifies the text color for pass conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **BackgroundColor**
Specifies the background color for pass conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **FontSize**
Specifies the font size for pass conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

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
|`[String]`|false   |7       |false        |

#### **FontStyle**
Specifies the font style for pass conditions.
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **FontVariant**
Specifies the font variant for pass conditions.
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **FontFamily**
Specifies the font family for pass conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **Alignment**
Specifies the alignment for pass conditions.
Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **TextDecoration**
Specifies the text decoration for pass conditions.
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **TextTransform**
Specifies the text transformation for pass conditions.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **Direction**
Specifies the text direction for pass conditions.
Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

#### **FailColor**
Specifies the text color for fail conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **FailBackgroundColor**
Specifies the background color for fail conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |16      |false        |

#### **FailFontSize**
Specifies the font size for fail conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |17      |false        |

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
|`[String]`|false   |18      |false        |

#### **FailFontStyle**
Specifies the font style for fail conditions.
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |19      |false        |

#### **FailFontVariant**
Specifies the font variant for fail conditions.
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |20      |false        |

#### **FailFontFamily**
Specifies the font family for fail conditions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |21      |false        |

#### **FailAlignment**
Specifies the alignment for fail conditions.
Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |22      |false        |

#### **FailTextDecoration**
Specifies the text decoration for fail conditions.
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |23      |false        |

#### **FailTextTransform**
Specifies the text transformation for fail conditions.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |24      |false        |

#### **FailDirection**
Specifies the text direction for fail conditions.
Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |25      |false        |

---

### Notes
Additional notes about the function.

---

### Syntax
```PowerShell
New-TableConditionGroup [[-Conditions] <ScriptBlock>] [[-Logic] <String>] [[-HighlightHeaders] <String[]>] [-Row] [-Inline] [[-Color] <String>] [[-BackgroundColor] <String>] [[-FontSize] <Object>] [[-FontWeight] <String>] [[-FontStyle] <String>] [[-FontVariant] <String>] [[-FontFamily] <String>] [[-Alignment] <String>] [[-TextDecoration] <String>] [[-TextTransform] <String>] [[-Direction] <String>] [[-FailColor] <String>] [[-FailBackgroundColor] <String>] [[-FailFontSize] <Object>] [[-FailFontWeight] <String>] [[-FailFontStyle] <String>] [[-FailFontVariant] <String>] [[-FailFontFamily] <String>] [[-FailAlignment] <String>] [[-FailTextDecoration] <String>] [[-FailTextTransform] <String>] [[-FailDirection] <String>] [<CommonParameters>]
```
