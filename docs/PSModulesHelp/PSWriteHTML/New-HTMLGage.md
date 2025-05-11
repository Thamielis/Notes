New-HTMLGage
------------

### Synopsis
Creates a new HTML gauge with customizable options.

---

### Description

This function creates a new HTML gauge with various customizable options such as type, colors, fonts, values, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLGage -Value 75 -Label "Progress" -Type "Donut" -MinValue 0 -MaxValue 100 -SectorColors @("red", "yellow", "green")
Creates a new donut gauge with a value of 75, labeled as "Progress", with a range from 0 to 100, and sector colors red, yellow, and green.
```

---

### Parameters
#### **GageContent**
The content of the gauge.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Type**
Specifies the type of gauge to create. Valid values are 'Gage' and 'Donut'. Default is 'Gage'.
Valid Values:

* Gage
* Donut

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **BackgroundGaugageColor**
The background color of the gauge.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Value**
The value to display on the gauge. This parameter is mandatory.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Decimal]`|true    |4       |false        |

#### **ValueSymbol**
The symbol to display with the value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **ValueColor**
The color of the value displayed on the gauge.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **ValueFont**
The font of the value displayed on the gauge.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **MinValue**
The minimum value of the gauge.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |8       |false        |

#### **MinText**
The text to display for the minimum value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **MaxValue**
The maximum value of the gauge.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |10      |false        |

#### **MaxText**
The text to display for the maximum value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **Reverse**
Indicates whether the gauge should be displayed in reverse.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DecimalNumbers**
The number of decimal places to display.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |12      |false        |

#### **GaugageWidth**
The width of the gauge.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Decimal]`|false   |13      |false        |

#### **Label**
The label to display on the gauge.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

#### **LabelColor**
The color of the label.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **Counter**
Indicates whether a counter should be displayed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ShowInnerShadow**
Indicates whether an inner shadow should be displayed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoGradient**
Indicates whether gradient should be disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ShadowOpacity**
The opacity of the shadow.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |16      |false        |

#### **ShadowSize**
The size of the shadow.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |17      |false        |

#### **ShadowVerticalOffset**
The vertical offset of the shadow.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |18      |false        |

#### **Pointer**
Indicates whether a pointer should be displayed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PointerTopLength**
The length of the top of the pointer.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |19      |false        |

#### **PointerBottomLength**
The length of the bottom of the pointer.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |20      |false        |

#### **PointerBottomWidth**
The width of the bottom of the pointer.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |21      |false        |

#### **StrokeColor**
The color of the stroke.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |22      |false        |

#### **PointerStrokeWidth**
The width of the pointer stroke.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |23      |false        |

#### **PointerStrokeLinecap**
The linecap style of the pointer stroke. Valid values are 'none', 'square', 'round'.
Valid Values:

* none
* square
* round

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |24      |false        |

#### **PointerColor**
The color of the pointer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |25      |false        |

#### **HideValue**
Indicates whether the value should be hidden.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideMinMax**
Indicates whether the min/max values should be hidden.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FormatNumber**
Indicates whether the number should be formatted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisplayRemaining**
Indicates whether the remaining value should be displayed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HumanFriendly**
Indicates whether the value should be displayed in a human-friendly format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HumanFriendlyDecimal**
The number of decimal places to display in human-friendly format.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |26      |false        |

#### **SectorColors**
An array of colors to use for different sectors of the gauge.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |27      |false        |

---

### Syntax
```PowerShell
New-HTMLGage [[-GageContent] <ScriptBlock>] [[-Type] <String>] [[-BackgroundGaugageColor] <String>] [-Value] <Decimal> [[-ValueSymbol] <String>] [[-ValueColor] <String>] [[-ValueFont] <String>] [[-MinValue] <Nullable`1>] [[-MinText] <String>] [[-MaxValue] <Nullable`1>] [[-MaxText] <String>] [-Reverse] [[-DecimalNumbers] <Int32>] [[-GaugageWidth] <Decimal>] [[-Label] <String>] [[-LabelColor] <String>] [-Counter] [-ShowInnerShadow] [-NoGradient] [[-ShadowOpacity] <Nullable`1>] [[-ShadowSize] <Nullable`1>] [[-ShadowVerticalOffset] <Nullable`1>] [-Pointer] [[-PointerTopLength] <Nullable`1>] [[-PointerBottomLength] <Nullable`1>] [[-PointerBottomWidth] <Nullable`1>] [[-StrokeColor] <String>] [[-PointerStrokeWidth] <Nullable`1>] [[-PointerStrokeLinecap] <Object>] [[-PointerColor] <String>] [-HideValue] [-HideMinMax] [-FormatNumber] [-DisplayRemaining] [-HumanFriendly] [[-HumanFriendlyDecimal] <Int32>] [[-SectorColors] <String[]>] [<CommonParameters>]
```
