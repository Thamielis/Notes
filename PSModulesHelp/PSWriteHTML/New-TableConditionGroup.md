New-TableConditionGroup
-----------------------

### Synopsis

New-TableConditionGroup [[-Conditions] <scriptblock>] [[-Logic] <string>] [[-HighlightHeaders] <string[]>] [[-Color] <string>] [[-BackgroundColor] <string>] [[-FontSize] <Object>] [[-FontWeight] <string>] [[-FontStyle] <string>] [[-FontVariant] <string>] [[-FontFamily] <string>] [[-Alignment] <string>] [[-TextDecoration] <string>] [[-TextTransform] <string>] [[-Direction] <string>] [[-FailColor] <string>] [[-FailBackgroundColor] <string>] [[-FailFontSize] <Object>] [[-FailFontWeight] <string>] [[-FailFontStyle] <string>] [[-FailFontVariant] <string>] [[-FailFontFamily] <string>] [[-FailAlignment] <string>] [[-FailTextDecoration] <string>] [[-FailTextTransform] <string>] [[-FailDirection] <string>] [-Row] [-Inline] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Alignment**

Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |10      |false        |

#### **BackgroundColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |4       |false        |

#### **Color**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **Conditions**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **Direction**

Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |13      |false        |

#### **FailAlignment**

Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |21      |false        |

#### **FailBackgroundColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |15      |false        |

#### **FailColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |14      |false        |

#### **FailDirection**

Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |24      |false        |

#### **FailFontFamily**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |20      |false        |

#### **FailFontSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |16      |false        |

#### **FailFontStyle**

Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |18      |false        |

#### **FailFontVariant**

Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |19      |false        |

#### **FailFontWeight**

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
|`[string]`|false   |17      |false        |

#### **FailTextDecoration**

Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |22      |false        |

#### **FailTextTransform**

Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |23      |false        |

#### **FontFamily**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |9       |false        |

#### **FontSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **FontStyle**

Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |7       |false        |

#### **FontVariant**

Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |8       |false        |

#### **FontWeight**

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
|`[string]`|false   |6       |false        |

#### **HighlightHeaders**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |2       |false        |

#### **Inline**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Logic**

Valid Values:

* AND
* OR
* NONE

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **Row**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **TextDecoration**

Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |11      |false        |

#### **TextTransform**

Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |12      |false        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=New-TableConditionGroup; CommonParameters=True; parameter=System.Object[]}}
```
