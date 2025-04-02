Set-OfficeExcelCellStyle
------------------------

### Synopsis

Set-OfficeExcelCellStyle [[-Worksheet] <Object>] [[-Row] <int>] [[-Column] <int>] [[-Format] <string>] [[-FormatID] <int>] [[-Bold] <bool>] [[-FontCharSet] <XLFontCharSet>] [[-FontColor] <string>] [[-BackGroundColor] <string>] [[-PatternType] <XLFillPatternValues>] [[-FontFamilyNumbering] <XLFontFamilyNumberingValues>] [[-FontName] <string>] [[-FontSize] <double>] [[-Italic] <bool>] [[-Shadow] <bool>] [[-Strikethrough] <bool>] [[-Underline] <XLFontUnderlineValues>] [[-VerticalAlignment] <XLFontVerticalTextAlignmentValues>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **BackGroundColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |8       |false        |

#### **Bold**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |5       |false        |

#### **Column**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |2       |false        |

#### **FontCharSet**

Valid Values:

* Ansi
* Default
* Symbol
* Mac
* ShiftJIS
* Hangul
* Hangul
* Johab
* GB2312
* ChineseBig5
* Greek
* Turkish
* Vietnamese
* Hebrew
* Arabic
* Baltic
* Russian
* Thai
* EastEurope
* Oem

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[XLFontCharSet]`|false   |6       |false        |

#### **FontColor**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[string]`|false   |7       |false        |Color  |

#### **FontFamilyNumbering**

Valid Values:

* NotApplicable
* Roman
* Swiss
* Modern
* Script
* Decorative

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[XLFontFamilyNumberingValues]`|false   |10      |false        |

#### **FontName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |11      |false        |

#### **FontSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[double]`|false   |12      |false        |

#### **Format**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **FormatID**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |4       |false        |

#### **Italic**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |13      |false        |

#### **PatternType**

Valid Values:

* DarkDown
* DarkGray
* DarkGrid
* DarkHorizontal
* DarkTrellis
* DarkUp
* DarkVertical
* Gray0625
* Gray125
* LightDown
* LightGray
* LightGrid
* LightHorizontal
* LightTrellis
* LightUp
* LightVertical
* MediumGray
* None
* Solid

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[XLFillPatternValues]`|false   |9       |false        |

#### **Row**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |1       |false        |

#### **Shadow**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |14      |false        |

#### **Strikethrough**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |15      |false        |

#### **Underline**

Valid Values:

* Double
* DoubleAccounting
* None
* Single
* SingleAccounting

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[XLFontUnderlineValues]`|false   |16      |false        |

#### **VerticalAlignment**

Valid Values:

* Baseline
* Subscript
* Superscript

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[XLFontVerticalTextAlignmentValues]`|false   |17      |false        |

#### **Worksheet**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |0       |false        |

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
{@{name=Set-OfficeExcelCellStyle; CommonParameters=True; parameter=System.Object[]}}
```
