New-ChartAxisY
--------------

### Synopsis

New-ChartAxisY [[-TitleText] <string>] [[-TitleRotate] <string>] [[-TitleOffsetX] <int>] [[-TitleOffsetY] <int>] [[-TitleFontWeight] <string>] [[-TitleColor] <string>] [[-TitleFontSize] <int>] [[-TitleFontFamily] <string>] [[-MinValue] <int>] [[-MaxValue] <int>] [[-LabelMinWidth] <int>] [[-LabelMaxWidth] <int>] [[-LabelAlign] <string>] [[-LabelFontSize] <Object>] [[-LabelFontFamily] <string>] [[-LabelFontWeight] <string>] [[-LabelFontColor] <string[]>] [[-SeriesName] <string>] [-Show] [-ShowAlways] [-Reversed] [-Opposite] [-Logarithmic] [-ForceNiceScale] [-Floating] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Floating**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ForceNiceScale**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **LabelAlign**

Valid Values:

* left
* center
* right

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |12      |false        |

#### **LabelFontColor**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |16      |false        |

#### **LabelFontFamily**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |14      |false        |

#### **LabelFontSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |13      |false        |

#### **LabelFontWeight**

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
|`[string]`|false   |15      |false        |

#### **LabelMaxWidth**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |11      |false        |

#### **LabelMinWidth**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |10      |false        |

#### **Logarithmic**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **MaxValue**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |9       |false        |

#### **MinValue**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |8       |false        |

#### **Opposite**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Reversed**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **SeriesName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |17      |false        |

#### **Show**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ShowAlways**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **TitleColor**

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[string]`|false   |5       |false        |TitleStyleColor|

#### **TitleFontFamily**

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[string]`|false   |7       |false        |TitleStyleFontFamily|

#### **TitleFontSize**

|Type   |Required|Position|PipelineInput|Aliases           |
|-------|--------|--------|-------------|------------------|
|`[int]`|false   |6       |false        |TitleStyleFontSize|

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
|`[string]`|false   |4       |false        |

#### **TitleOffsetX**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |2       |false        |

#### **TitleOffsetY**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |3       |false        |

#### **TitleRotate**

Valid Values:

* 90
* 270

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **TitleText**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |0       |false        |

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
{@{name=New-ChartAxisY; CommonParameters=True; parameter=System.Object[]}}
```
