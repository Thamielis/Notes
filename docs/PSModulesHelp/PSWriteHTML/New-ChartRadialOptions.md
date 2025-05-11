New-ChartRadialOptions
----------------------

### Synopsis
Creates customizable options for a radial chart.

---

### Description

This function defines various customizable options for a radial chart, such as circle type, angles, colors, shadows, labels, gradients, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartRadialOptions -CircleType 'FullCircleTop' -StartAngle 0 -EndAngle 180 -HollowBackGroundColor 'white' -HollowMargin '10px' -HollowSize '50%' -TrackDropShadow 'black' -TrackDropShadowTop '2px' -TrackDropShadowLeft '2px' -TrackDropShadowBlur '5px' -TrackDropShadowOpacity '0.5' -DataLabelNameOffsetY '20px' -DataLabelNameColor 'black' -DataLabelNameFontSize '12px' -DataLabelValueShow -DataLabelValueColor 'red' -DataLabelValueFontSize '14px' -FillType 'solid' -GradientShade 'dark' -GradientType 'vertical' -GradientToColors @('red', 'blue') -GraidentStops @('0%', '100%') -StrokeLineCap 'round' -Labels @('Label1', 'Label2')
Creates customizable options for a radial chart with specified parameters.
```

---

### Parameters
#### **CircleType**
Specifies the type of circle for the radial chart. Valid values are 'FullCircleTop', 'FullCircleBottom', 'FullCircleBottomLeft', 'FullCircleLeft', 'Speedometer', 'SemiCircleGauge'.
Valid Values:

* FullCircleTop
* FullCircleBottom
* FullCircleBottomLeft
* FullCircleLeft
* Speedometer
* SemiCircleGauge

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **StartAngle**
Specifies the starting angle for the radial chart.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **EndAngle**
Specifies the ending angle for the radial chart.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **HollowBackGroundColor**
Specifies the color for the hollow background of the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HollowMargin**
Specifies the margin for the hollow area of the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HollowSize**
Specifies the size of the hollow area in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TrackDropShadow**
Specifies the drop shadow for the track of the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TrackDropShadowTop**
Specifies the top shadow for the track of the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TrackDropShadowLeft**
Specifies the left shadow for the track of the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TrackDropShadowBlur**
Specifies the blur effect for the drop shadow of the track in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TrackDropShadowOpacity**
Specifies the opacity of the drop shadow for the track in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DataLabelNameOffsetY**
Specifies the Y-axis offset for the data label name in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DataLabelNameColor**
Specifies the color for the data label name in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DataLabelNameFontSize**
Specifies the font size for the data label name in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DataLabelValueShow**
Indicates whether to show the data label value in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DataLabelValueColor**
Specifies the color for the data label value in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DataLabelValueFontSize**
Specifies the font size for the data label value in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FillType**
Specifies the fill type for the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GradientShade**
Specifies the shade for the gradient in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GradientType**
Specifies the type of gradient for the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GradientToColors**
Specifies the colors for the gradient in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GraidentStops**
Specifies the gradient stops for the radial chart.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |named   |false        |

#### **StrokeLineCap**
Specifies the line cap for the stroke in the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Labels**
Specifies an array of labels for the radial chart.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-ChartRadialOptions [-CircleType <Object>] [-HollowBackGroundColor <String>] [-HollowMargin <String>] [-HollowSize <String>] [-TrackDropShadow <String>] [-TrackDropShadowTop <String>] [-TrackDropShadowLeft <String>] [-TrackDropShadowBlur <String>] [-TrackDropShadowOpacity <String>] [-DataLabelNameOffsetY <String>] [-DataLabelNameColor <String>] [-DataLabelNameFontSize <String>] [-DataLabelValueShow] [-DataLabelValueColor <String>] [-DataLabelValueFontSize <String>] [-FillType <String>] [-GradientShade <String>] [-GradientType <String>] [-GradientToColors <String>] [-GraidentStops <Array>] [-StrokeLineCap <String>] [-Labels <String[]>] [<CommonParameters>]
```
```PowerShell
New-ChartRadialOptions [-StartAngle <Nullable`1>] [-EndAngle <Nullable`1>] [-HollowBackGroundColor <String>] [-HollowMargin <String>] [-HollowSize <String>] [-TrackDropShadow <String>] [-TrackDropShadowTop <String>] [-TrackDropShadowLeft <String>] [-TrackDropShadowBlur <String>] [-TrackDropShadowOpacity <String>] [-DataLabelNameOffsetY <String>] [-DataLabelNameColor <String>] [-DataLabelNameFontSize <String>] [-DataLabelValueShow] [-DataLabelValueColor <String>] [-DataLabelValueFontSize <String>] [-FillType <String>] [-GradientShade <String>] [-GradientType <String>] [-GradientToColors <String>] [-GraidentStops <Array>] [-StrokeLineCap <String>] [-Labels <String[]>] [<CommonParameters>]
```
