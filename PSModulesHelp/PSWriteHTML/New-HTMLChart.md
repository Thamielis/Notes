New-HTMLChart
-------------

### Synopsis

New-HTMLChart [[-ChartSettings] <scriptblock>] [[-Title] <string>] [[-TitleAlignment] <string>] [[-TitleMargin] <int>] [[-TitleOffsetX] <int>] [[-TitleOffsetY] <int>] [[-TitleFloating] <int>] [[-TitleFontSize] <Object>] [[-TitleFontWeight] <string>] [[-TitleFontFamily] <string>] [[-TitleColor] <string>] [[-SubTitle] <string>] [[-SubTitleAlignment] <string>] [[-SubTitleMargin] <int>] [[-SubTitleOffsetX] <int>] [[-SubTitleOffsetY] <int>] [[-SubTitleFloating] <int>] [[-SubTitleFontSize] <Object>] [[-SubTitleFontWeight] <string>] [[-SubTitleFontFamily] <string>] [[-SubTitleColor] <string>] [[-Height] <Object>] [[-Width] <Object>] [[-Id] <string>] [[-Group] <string>] [-Gradient] [-Patterned] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ChartSettings**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **Gradient**

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[switch]`|false   |Named   |false        |GradientColors|

#### **Group**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |24      |false        |

#### **Height**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |21      |false        |

#### **Id**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |23      |false        |

#### **Patterned**

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[switch]`|false   |Named   |false        |PatternedColors|

#### **SubTitle**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |11      |false        |

#### **SubTitleAlignment**

Valid Values:

* center
* left
* right

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |12      |false        |

#### **SubTitleColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |20      |false        |

#### **SubTitleFloating**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |16      |false        |

#### **SubTitleFontFamily**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |19      |false        |

#### **SubTitleFontSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |17      |false        |

#### **SubTitleFontWeight**

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
|`[string]`|false   |18      |false        |

#### **SubTitleMargin**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |13      |false        |

#### **SubTitleOffsetX**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |14      |false        |

#### **SubTitleOffsetY**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |15      |false        |

#### **Title**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **TitleAlignment**

Valid Values:

* center
* left
* right

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **TitleColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |10      |false        |

#### **TitleFloating**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |6       |false        |

#### **TitleFontFamily**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |9       |false        |

#### **TitleFontSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **TitleFontWeight**

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
|`[string]`|false   |8       |false        |

#### **TitleMargin**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |3       |false        |

#### **TitleOffsetX**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |4       |false        |

#### **TitleOffsetY**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |5       |false        |

#### **Width**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |22      |false        |

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
{@{name=New-HTMLChart; CommonParameters=True; parameter=System.Object[]}}
```
