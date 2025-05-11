New-DiagramLink
---------------

### Synopsis
Creates a new diagram link between two nodes.

---

### Description

Creates a new diagram link connecting two nodes in a visual representation.

---

### Examples
> EXAMPLE 1

```PowerShell
An example of creating a new diagram link.
```

---

### Parameters
#### **From**
Specifies the starting node of the link.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **To**
Specifies the ending node of the link.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Label**
Specifies the label text for the link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **ArrowsToEnabled**
Switch parameter to enable arrows at the end of the link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ArrowsToScaleFacto**

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |4       |false        |

#### **ArrowsToType**
Specifies the type of arrows at the end of the link. Valid values are 'arrow', 'bar', or 'circle'.
Valid Values:

* arrow
* bar
* circle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **ArrowsMiddleEnabled**
Switch parameter to enable arrows in the middle of the link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ArrowsMiddleScaleFactor**
Specifies the scale factor for the arrows in the middle of the link.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |6       |false        |

#### **ArrowsMiddleType**
Specifies the type of arrows in the middle of the link. Valid values are 'arrow', 'bar', or 'circle'.
Valid Values:

* arrow
* bar
* circle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **ArrowsFromEnabled**
Switch parameter to enable arrows at the start of the link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ArrowsFromScaleFactor**
Specifies the scale factor for the arrows at the start of the link.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |8       |false        |

#### **ArrowsFromType**
Specifies the type of arrows at the start of the link. Valid values are 'arrow', 'bar', or 'circle'.
Valid Values:

* arrow
* bar
* circle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **ArrowStrikethrough**
Switch parameter to enable a strikethrough effect for the link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Chosen**
Switch parameter to mark the link as chosen.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Color**
Specifies the color of the link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **ColorHighlight**
Specifies the highlight color of the link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **ColorHover**
Specifies the hover color of the link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **ColorInherit**
Specifies how the link color should inherit. Valid values are 'true', 'false', 'from', 'to', or 'both'.
Valid Values:

* true
* false
* from
* to
* both

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **ColorOpacity**
Specifies the opacity of the link color. Range between 0 and 1.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |14      |false        |

#### **Dashes**
Switch parameter to enable dashed line style for the link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Length**
Specifies the length of the link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **FontColor**
Specifies the font color for the label.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |16      |false        |

#### **FontSize**
Specifies the font size for the label.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |17      |false        |

#### **FontName**
Specifies the font name for the label.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |18      |false        |

#### **FontBackground**
Specifies the background color for the font.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |19      |false        |

#### **FontStrokeWidth**
Specifies the stroke width for the font. (in pixels)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |20      |false        |

#### **FontStrokeColor**
Specifies the stroke color for the font.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |21      |false        |

#### **FontAlign**
Possible options: 'horizontal','top','middle','bottom'.
The alignment determines how the label is aligned over the edge.
The default value horizontal aligns the label horizontally, regardless of the orientation of the edge.
When an option other than horizontal is chosen, the label will align itself according to the edge.
Valid Values:

* horizontal
* top
* middle
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |22      |false        |

#### **FontMulti**
Specifies whether the label supports multiple lines or markdown/html formatting.
Valid Values:

* false
* true
* markdown
* html

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |23      |false        |

#### **FontVAdjust**
Specifies the vertical adjustment for the label.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |24      |false        |

#### **WidthConstraint**
Specifies the width constraint for the link.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |25      |false        |

#### **SmoothType**
Possible options: 'dynamic', 'continuous', 'discrete', 'diagonalCross', 'straightCross', 'horizontal', 'vertical', 'curvedCW', 'curvedCCW', 'cubicBezier'.
Take a look at this example to see what these look like and pick the one that you like best! When using dynamic, the edges will have an invisible support node guiding the shape.
This node is part of the physics simulation.
Valid Values:

* dynamic
* continuous
* discrete
* diagonalCross
* straightCross
* horizontal
* vertical
* curvedCW
* curvedCCW
* cubicBezier

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |26      |false        |

#### **SmoothForceDirection**
Accepted options: ['horizontal', 'vertical', 'none'].
This options is only used with the cubicBezier curves.
When true, horizontal is chosen, when false, the direction that is larger (x distance between nodes vs y distance between nodes) is used.
If the x distance is larger, horizontal. This is ment to be used with hierarchical layouts.
Valid Values:

* horizontal
* vertical
* none

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |27      |false        |

#### **SmoothRoundness**
Accepted range: 0 .. 1.0. This parameter tweaks the roundness of the smooth curves for all types EXCEPT dynamic.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |28      |false        |

---

### Notes
Additional notes

---

### Syntax
```PowerShell
New-DiagramLink [[-From] <String[]>] [[-To] <String[]>] [[-Label] <String>] [-ArrowsToEnabled] [[-ArrowsToScaleFacto] <Nullable`1>] [[-ArrowsToType] <String>] [-ArrowsMiddleEnabled] [[-ArrowsMiddleScaleFactor] <Nullable`1>] [[-ArrowsMiddleType] <String>] [-ArrowsFromEnabled] [[-ArrowsFromScaleFactor] <Nullable`1>] [[-ArrowsFromType] <String>] [-ArrowStrikethrough] [-Chosen] [[-Color] <String>] [[-ColorHighlight] <String>] [[-ColorHover] <String>] [[-ColorInherit] <String>] [[-ColorOpacity] <Nullable`1>] [-Dashes] [[-Length] <String>] [[-FontColor] <String>] [[-FontSize] <Object>] [[-FontName] <String>] [[-FontBackground] <String>] [[-FontStrokeWidth] <Object>] [[-FontStrokeColor] <String>] [[-FontAlign] <String>] [[-FontMulti] <String>] [[-FontVAdjust] <Nullable`1>] [[-WidthConstraint] <Nullable`1>] [[-SmoothType] <String>] [[-SmoothForceDirection] <String>] [[-SmoothRoundness] <String>] [<CommonParameters>]
```
