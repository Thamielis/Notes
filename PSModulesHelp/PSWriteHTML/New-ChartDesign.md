New-ChartDesign
---------------

### Synopsis
Configures charts gradient, image, pattern and dropShadow options

---

### Description

Long description

---

### Examples
> EXAMPLE 1

```PowerShell
An example
```

---

### Parameters
#### **GradientShade**
Available options for gradient shade
Valid Values:

* light
* dark

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **GradientType**
Available options for gradient type
Valid Values:

* horizontal
* vertical
* diagonal1
* diagonal2

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **GradientShadeIntensity**
Intensity of the gradient shade

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |3       |false        |

#### **GradientGradientToColors**
Optional colors that ends the gradient to.
The main colors array becomes the gradientFromColors and this array becomes the end colors of the gradient.
Each index in the array corresponds to the series-index.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **GradientInverseColors**
Inverse the start and end colors of the gradient.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **GradientOpacityFrom**
Start color's opacity. If you want different opacity for different series, you can pass an array of numbers.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Single[]]`|false   |5       |false        |

#### **GradientOpacityTo**
End color's opacity. If you want different opacity for different series, you can pass an array of numbers.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Single[]]`|false   |6       |false        |

#### **GradientStops**
Stops defines the ramp of colors to use on a gradient

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **ImageSource**
Accepts an array of image paths which will correspond to each series.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |8       |false        |

#### **ImageWidth**
Width of each image for all the series

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |9       |false        |

#### **ImageHeight**
Height of each image for all the series

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |10      |false        |

#### **PatternStyle**
Available pattern styles
Valid Values:

* verticalLines
* horizontalLines
* slantedLines
* squares
* circles

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **PatternWidth**
Pattern width which will be repeated at this interval

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **PatternHeight**
Pattern height which will be repeated at this interval

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **PatternStrokeWidth**
Pattern lines width indicates the thickness of the stroke of pattern.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

#### **DropShadowEnabled**
Enable a dropshadow for paths of the SVG

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DropShadowEnabledOnSries**
Provide series index on which the dropshadow should be enabled.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |15      |false        |

#### **DropShadowTop**
Set top offset for shadow

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |16      |false        |

#### **DropShadowColor**
Give a color to the shadow. If array is provided, each series can have different shadow color

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |17      |false        |

#### **DropShadowLeft**
Set left offset for shadow

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |18      |false        |

#### **DropShadowBlur**
Set blur distance for shadow

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |19      |false        |

#### **DropShadowOpacity**
Set the opacity of shadow

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |20      |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-ChartDesign [[-GradientShade] <String>] [[-GradientType] <String>] [[-GradientShadeIntensity] <Nullable`1>] [[-GradientGradientToColors] <String[]>] [-GradientInverseColors] [[-GradientOpacityFrom] <Single[]>] [[-GradientOpacityTo] <Single[]>] [[-GradientStops] <Object>] [[-ImageSource] <String[]>] [[-ImageWidth] <String[]>] [[-ImageHeight] <String[]>] [[-PatternStyle] <String>] [[-PatternWidth] <String>] [[-PatternHeight] <String>] [[-PatternStrokeWidth] <String>] [-DropShadowEnabled] [[-DropShadowEnabledOnSries] <Array>] [[-DropShadowTop] <Nullable`1>] [[-DropShadowColor] <String[]>] [[-DropShadowLeft] <Nullable`1>] [[-DropShadowBlur] <Nullable`1>] [[-DropShadowOpacity] <Nullable`1>] [<CommonParameters>]
```
