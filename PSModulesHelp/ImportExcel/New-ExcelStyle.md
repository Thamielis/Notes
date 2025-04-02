New-ExcelStyle
--------------

### Synopsis

New-ExcelStyle [[-Range] <Object>] [[-NumberFormat] <Object>] [[-BorderAround] <ExcelBorderStyle>] [[-BorderColor] <Object>] [[-BorderBottom] <ExcelBorderStyle>] [[-BorderTop] <ExcelBorderStyle>] [[-BorderLeft] <ExcelBorderStyle>] [[-BorderRight] <ExcelBorderStyle>] [[-FontColor] <Object>] [[-Value] <Object>] [[-Formula] <Object>] [[-UnderLineType] <ExcelUnderLineType>] [[-FontShift] <ExcelVerticalAlignmentFont>] [[-FontName] <string>] [[-FontSize] <float>] [[-BackgroundColor] <Object>] [[-BackgroundPattern] <ExcelFillStyle>] [[-PatternColor] <Object>] [[-HorizontalAlignment] <ExcelHorizontalAlignment>] [[-VerticalAlignment] <ExcelVerticalAlignment>] [[-TextRotation] <int>] [[-Width] <float>] [[-Height] <float>] [-ArrayFormula] [-ResetFont] [-Bold] [-Italic] [-Underline] [-StrikeThru] [-WrapText] [-AutoSize] [-Hidden] [-Locked] [-Merge] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ArrayFormula**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **AutoSize**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[switch]`|false   |Named   |false        |AutoFit|

#### **BackgroundColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |15      |false        |

#### **BackgroundPattern**

Valid Values:

* None
* Solid
* DarkGray
* MediumGray
* LightGray
* Gray125
* Gray0625
* DarkVertical
* DarkHorizontal
* DarkDown
* DarkUp
* DarkGrid
* DarkTrellis
* LightVertical
* LightHorizontal
* LightDown
* LightUp
* LightGrid
* LightTrellis

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelFillStyle]`|false   |16      |false        |

#### **Bold**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **BorderAround**

Valid Values:

* None
* Hair
* Dotted
* DashDot
* Thin
* DashDotDot
* Dashed
* MediumDashDotDot
* MediumDashed
* MediumDashDot
* Thick
* Medium
* Double

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[ExcelBorderStyle]`|false   |2       |false        |

#### **BorderBottom**

Valid Values:

* None
* Hair
* Dotted
* DashDot
* Thin
* DashDotDot
* Dashed
* MediumDashDotDot
* MediumDashed
* MediumDashDot
* Thick
* Medium
* Double

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[ExcelBorderStyle]`|false   |4       |false        |

#### **BorderColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **BorderLeft**

Valid Values:

* None
* Hair
* Dotted
* DashDot
* Thin
* DashDotDot
* Dashed
* MediumDashDotDot
* MediumDashed
* MediumDashDot
* Thick
* Medium
* Double

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[ExcelBorderStyle]`|false   |6       |false        |

#### **BorderRight**

Valid Values:

* None
* Hair
* Dotted
* DashDot
* Thin
* DashDotDot
* Dashed
* MediumDashDotDot
* MediumDashed
* MediumDashDot
* Thick
* Medium
* Double

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[ExcelBorderStyle]`|false   |7       |false        |

#### **BorderTop**

Valid Values:

* None
* Hair
* Dotted
* DashDot
* Thin
* DashDotDot
* Dashed
* MediumDashDotDot
* MediumDashed
* MediumDashDot
* Thick
* Medium
* Double

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[ExcelBorderStyle]`|false   |5       |false        |

#### **FontColor**

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[Object]`|false   |8       |false        |ForegroundColor|

#### **FontName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |13      |false        |

#### **FontShift**

Valid Values:

* None
* Baseline
* Subscript
* Superscript

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[ExcelVerticalAlignmentFont]`|false   |12      |false        |

#### **FontSize**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[float]`|false   |14      |false        |

#### **Formula**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |10      |false        |

#### **Height**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[float]`|false   |22      |false        |

#### **Hidden**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[switch]`|false   |Named   |false        |Hide   |

#### **HorizontalAlignment**

Valid Values:

* General
* Left
* Center
* CenterContinuous
* Right
* Fill
* Distributed
* Justify

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[ExcelHorizontalAlignment]`|false   |18      |false        |

#### **Italic**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Locked**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Merge**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **NumberFormat**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|false   |1       |false        |NFormat|

#### **PatternColor**

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Object]`|false   |17      |false        |PatternColour|

#### **Range**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|false   |0       |false        |Address|

#### **ResetFont**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **StrikeThru**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **TextRotation**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |20      |false        |

#### **UnderLineType**

Valid Values:

* None
* Single
* Double
* SingleAccounting
* DoubleAccounting

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[ExcelUnderLineType]`|false   |11      |false        |

#### **Underline**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Value**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **VerticalAlignment**

Valid Values:

* Top
* Center
* Bottom
* Distributed
* Justify

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[ExcelVerticalAlignment]`|false   |19      |false        |

#### **Width**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[float]`|false   |21      |false        |

#### **WrapText**

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
{@{name=New-ExcelStyle; CommonParameters=True; parameter=System.Object[]}}
```
