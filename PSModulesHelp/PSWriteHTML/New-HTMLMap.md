New-HTMLMap
-----------

### Synopsis

New-HTMLMap [[-MapSettings] <scriptblock>] [-Map] <string> [[-AnchorName] <string>] [[-AreaTitle] <string>] [[-PlotTitle] <string>] [[-FillColor] <string>] [[-StrokeColor] <string>] [[-StrokeWidth] <int>] [-ShowAreaLegend] [-ShowPlotLegend] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AnchorName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **AreaTitle**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **FillColor**

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[string]`|false   |5       |false        |SliceColor|

#### **Map**

Valid Values:

* Poland
* Usa_States
* World_Countries
* European_Union

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |1       |false        |

#### **MapSettings**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **PlotTitle**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |4       |false        |

#### **ShowAreaLegend**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ShowPlotLegend**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **StrokeColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |6       |false        |

#### **StrokeWidth**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |7       |false        |

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
{@{name=New-HTMLMap; CommonParameters=True; parameter=System.Object[]}}
```
