New-DiagramLink
---------------

### Synopsis
Short description

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
#### **From**
Parameter description

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **To**
Parameter description

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Label**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **ArrowsToEnabled**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ArrowsToScaleFacto**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |4       |false        |

#### **ArrowsToType**
Parameter description
Valid Values:

* arrow
* bar
* circle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **ArrowsMiddleEnabled**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ArrowsMiddleScaleFactor**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |6       |false        |

#### **ArrowsMiddleType**
Parameter description
Valid Values:

* arrow
* bar
* circle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **ArrowsFromEnabled**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ArrowsFromScaleFactor**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |8       |false        |

#### **ArrowsFromType**
Parameter description
Valid Values:

* arrow
* bar
* circle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **ArrowStrikethrough**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Chosen**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Color**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **ColorHighlight**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **ColorHover**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **ColorInherit**
Parameter description
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
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |14      |false        |

#### **Dashes**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Length**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **FontColor**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |16      |false        |

#### **FontSize**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |17      |false        |

#### **FontName**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |18      |false        |

#### **FontBackground**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |19      |false        |

#### **FontStrokeWidth**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |20      |false        |

#### **FontStrokeColor**
Parameter description

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
Parameter description
Valid Values:

* false
* true
* markdown
* html

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |23      |false        |

#### **FontVAdjust**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |24      |false        |

#### **WidthConstraint**
Parameter description

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
General notes

---

### Syntax
```PowerShell
New-DiagramLink [[-From] <String[]>] [[-To] <String[]>] [[-Label] <String>] [-ArrowsToEnabled] [[-ArrowsToScaleFacto] <Nullable`1>] [[-ArrowsToType] <String>] [-ArrowsMiddleEnabled] [[-ArrowsMiddleScaleFactor] <Nullable`1>] [[-ArrowsMiddleType] <String>] [-ArrowsFromEnabled] [[-ArrowsFromScaleFactor] <Nullable`1>] [[-ArrowsFromType] <String>] [-ArrowStrikethrough] [-Chosen] [[-Color] <String>] [[-ColorHighlight] <String>] [[-ColorHover] <String>] [[-ColorInherit] <String>] [[-ColorOpacity] <Nullable`1>] [-Dashes] [[-Length] <String>] [[-FontColor] <String>] [[-FontSize] <Object>] [[-FontName] <String>] [[-FontBackground] <String>] [[-FontStrokeWidth] <Object>] [[-FontStrokeColor] <String>] [[-FontAlign] <String>] [[-FontMulti] <String>] [[-FontVAdjust] <Nullable`1>] [[-WidthConstraint] <Nullable`1>] [[-SmoothType] <String>] [[-SmoothForceDirection] <String>] [[-SmoothRoundness] <String>] [<CommonParameters>]
```
