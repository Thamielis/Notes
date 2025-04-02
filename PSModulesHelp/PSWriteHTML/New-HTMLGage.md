New-HTMLGage
------------

### Synopsis

New-HTMLGage [[-GageContent] <scriptblock>] [[-Type] <string>] [[-BackgroundGaugageColor] <string>] [-Value] <decimal> [[-ValueSymbol] <string>] [[-ValueColor] <string>] [[-ValueFont] <string>] [[-MinValue] <int>] [[-MinText] <string>] [[-MaxValue] <int>] [[-MaxText] <string>] [[-DecimalNumbers] <int>] [[-GaugageWidth] <decimal>] [[-Label] <string>] [[-LabelColor] <string>] [[-ShadowOpacity] <decimal>] [[-ShadowSize] <int>] [[-ShadowVerticalOffset] <int>] [[-PointerTopLength] <int>] [[-PointerBottomLength] <int>] [[-PointerBottomWidth] <int>] [[-StrokeColor] <string>] [[-PointerStrokeWidth] <int>] [[-PointerStrokeLinecap] <Object>] [[-PointerColor] <string>] [[-HumanFriendlyDecimal] <int>] [[-SectorColors] <string[]>] [-Reverse] [-Counter] [-ShowInnerShadow] [-NoGradient] [-Pointer] [-HideValue] [-HideMinMax] [-FormatNumber] [-DisplayRemaining] [-HumanFriendly] [<CommonParameters>]

---

### Description

---

### Parameters
#### **BackgroundGaugageColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **Counter**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DecimalNumbers**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |11      |false        |

#### **DisplayRemaining**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **FormatNumber**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **GageContent**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **GaugageWidth**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[decimal]`|false   |12      |false        |

#### **HideMinMax**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **HideValue**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **HumanFriendly**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **HumanFriendlyDecimal**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |25      |false        |

#### **Label**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |13      |false        |

#### **LabelColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |14      |false        |

#### **MaxText**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |10      |false        |

#### **MaxValue**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |9       |false        |

#### **MinText**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |8       |false        |

#### **MinValue**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |7       |false        |

#### **NoGradient**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Pointer**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **PointerBottomLength**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |19      |false        |

#### **PointerBottomWidth**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |20      |false        |

#### **PointerColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |24      |false        |

#### **PointerStrokeLinecap**

Valid Values:

* none
* square
* round

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |23      |false        |

#### **PointerStrokeWidth**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |22      |false        |

#### **PointerTopLength**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |18      |false        |

#### **Reverse**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **SectorColors**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |26      |false        |

#### **ShadowOpacity**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[decimal]`|false   |15      |false        |

#### **ShadowSize**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |16      |false        |

#### **ShadowVerticalOffset**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |17      |false        |

#### **ShowInnerShadow**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **StrokeColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |21      |false        |

#### **Type**

Valid Values:

* Gage
* Donut

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **Value**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[decimal]`|true    |3       |false        |

#### **ValueColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |5       |false        |

#### **ValueFont**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |6       |false        |

#### **ValueSymbol**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |4       |false        |

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
{@{name=New-HTMLGage; CommonParameters=True; parameter=System.Object[]}}
```
