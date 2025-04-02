New-ChartLegend
---------------

### Synopsis

New-ChartLegend [[-Names] <array>] [[-Color] <string[]>] [[-LegendPosition] <string>] [[-HorizontalAlign] <string>] [[-OffsetX] <int>] [[-OffsetY] <int>] [[-ItemMarginHorizontal] <int>] [[-ItemMarginVertical] <int>] [[-FontSize] <Object>] [[-FontFamily] <string>] [[-FontWeight] <string>] [-HideLegend] [-Floating] [-InverseOrder] [-DisableOnItemClickToggleDataSeries] [-DisableOnItemHoverHighlightDataSeries] [-UseSeriesColors] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Color**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |1       |false        |

#### **DisableOnItemClickToggleDataSeries**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DisableOnItemHoverHighlightDataSeries**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Floating**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **FontFamily**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |9       |false        |

#### **FontSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

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
|`[string]`|false   |10      |false        |

#### **HideLegend**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **HorizontalAlign**

Valid Values:

* left
* center
* right

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **InverseOrder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ItemMarginHorizontal**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |6       |false        |

#### **ItemMarginVertical**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |7       |false        |

#### **LegendPosition**

Valid Values:

* top
* left
* right
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **Names**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[array]`|false   |0       |false        |

#### **OffsetX**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |4       |false        |

#### **OffsetY**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |5       |false        |

#### **UseSeriesColors**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

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
{@{name=New-ChartLegend; CommonParameters=True; parameter=System.Object[]}}
```
