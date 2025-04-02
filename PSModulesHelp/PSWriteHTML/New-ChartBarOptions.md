New-ChartBarOptions
-------------------

### Synopsis

New-ChartBarOptions [[-Type] <Object>] [[-DataLabelsEnabled] <bool>] [[-DataLabelsOffsetX] <int>] [[-DataLabelsFontSize] <string>] [[-DataLabelsColor] <string>] [-Patterned] [-Gradient] [-Distributed] [-Vertical] [<CommonParameters>]

---

### Description

---

### Parameters
#### **DataLabelsColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |4       |false        |

#### **DataLabelsEnabled**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |1       |false        |

#### **DataLabelsFontSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **DataLabelsOffsetX**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |2       |false        |

#### **Distributed**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Gradient**

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[switch]`|false   |Named   |false        |GradientColors|

#### **Patterned**

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[switch]`|false   |Named   |false        |PatternedColors|

#### **Type**

Valid Values:

* bar
* barStacked
* barStacked100Percent

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |0       |false        |

#### **Vertical**

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
{@{name=New-ChartBarOptions; CommonParameters=True; parameter=System.Object[]}}
```
