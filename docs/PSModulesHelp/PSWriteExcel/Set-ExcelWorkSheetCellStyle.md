Set-ExcelWorkSheetCellStyle
---------------------------

### Synopsis

Set-ExcelWorkSheetCellStyle [[-ExcelWorksheet] <ExcelWorksheet>] [[-CellRow] <int>] [[-CellColumn] <int>] [[-Name] <string>] [[-Color] <KnownColor>] [[-Size] <int>] [[-UnderLineType] <ExcelUnderLineType>] [[-VerticalAlignment] <ExcelVerticalAlignment>] [[-PatternType] <ExcelFillStyle>] [-Bold] [-Italic] [-Strike] [-UnderLine] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Bold**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **CellColumn**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |2       |false        |

#### **CellRow**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |1       |false        |

#### **Color**

Valid Values:

* ActiveBorder
* ActiveCaption
* ActiveCaptionText
* AppWorkspace
* Control
* ControlDark
* ControlDarkDark
* ControlLight
* ControlLightLight
* ControlText
* Desktop
* GrayText
* Highlight
* HighlightText
* HotTrack
* InactiveBorder
* InactiveCaption
* InactiveCaptionText
* Info
* InfoText
* Menu
* MenuText
* ScrollBar
* Window
* WindowFrame
* WindowText
* Transparent
* AliceBlue
* AntiqueWhite
* Aqua
* Aquamarine
* Azure
* Beige
* Bisque
* Black
* BlanchedAlmond
* Blue
* BlueViolet
* Brown
* BurlyWood
* CadetBlue
* Chartreuse
* Chocolate
* Coral
* CornflowerBlue
* Cornsilk
* Crimson
* Cyan
* DarkBlue
* DarkCyan
* DarkGoldenrod
* DarkGray
* DarkGreen
* DarkKhaki
* DarkMagenta
* DarkOliveGreen
* DarkOrange
* DarkOrchid
* DarkRed
* DarkSalmon
* DarkSeaGreen
* DarkSlateBlue
* DarkSlateGray
* DarkTurquoise
* DarkViolet
* DeepPink
* DeepSkyBlue
* DimGray
* DodgerBlue
* Firebrick
* FloralWhite
* ForestGreen
* Fuchsia
* Gainsboro
* GhostWhite
* Gold
* Goldenrod
* Gray
* Green
* GreenYellow
* Honeydew
* HotPink
* IndianRed
* Indigo
* Ivory
* Khaki
* Lavender
* LavenderBlush
* LawnGreen
* LemonChiffon
* LightBlue
* LightCoral
* LightCyan
* LightGoldenrodYellow
* LightGray
* LightGreen
* LightPink
* LightSalmon
* LightSeaGreen
* LightSkyBlue
* LightSlateGray
* LightSteelBlue
* LightYellow
* Lime
* LimeGreen
* Linen
* Magenta
* Maroon
* MediumAquamarine
* MediumBlue
* MediumOrchid
* MediumPurple
* MediumSeaGreen
* MediumSlateBlue
* MediumSpringGreen
* MediumTurquoise
* MediumVioletRed
* MidnightBlue
* MintCream
* MistyRose
* Moccasin
* NavajoWhite
* Navy
* OldLace
* Olive
* OliveDrab
* Orange
* OrangeRed
* Orchid
* PaleGoldenrod
* PaleGreen
* PaleTurquoise
* PaleVioletRed
* PapayaWhip
* PeachPuff
* Peru
* Pink
* Plum
* PowderBlue
* Purple
* Red
* RosyBrown
* RoyalBlue
* SaddleBrown
* Salmon
* SandyBrown
* SeaGreen
* SeaShell
* Sienna
* Silver
* SkyBlue
* SlateBlue
* SlateGray
* Snow
* SpringGreen
* SteelBlue
* Tan
* Teal
* Thistle
* Tomato
* Turquoise
* Violet
* Wheat
* White
* WhiteSmoke
* Yellow
* YellowGreen
* ButtonFace
* ButtonHighlight
* ButtonShadow
* GradientActiveCaption
* GradientInactiveCaption
* MenuBar
* MenuHighlight
* RebeccaPurple

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[KnownColor]`|false   |4       |false        |

#### **ExcelWorksheet**

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelWorksheet]`|false   |0       |false        |

#### **Italic**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Name**

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[string]`|false   |3       |false        |FontName|

#### **PatternType**

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
|`[ExcelFillStyle]`|false   |8       |false        |

#### **Size**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |5       |false        |

#### **Strike**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **UnderLine**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **UnderLineType**

Valid Values:

* None
* Single
* Double
* SingleAccounting
* DoubleAccounting

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[ExcelUnderLineType]`|false   |6       |false        |

#### **VerticalAlignment**

Valid Values:

* Top
* Center
* Bottom
* Distributed
* Justify

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[ExcelVerticalAlignment]`|false   |7       |false        |

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
{@{name=Set-ExcelWorkSheetCellStyle; CommonParameters=True; parameter=System.Object[]}}
```
