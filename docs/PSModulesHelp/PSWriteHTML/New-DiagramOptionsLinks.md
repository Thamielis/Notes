New-DiagramOptionsLinks
-----------------------

### Synopsis
Creates a new set of options for diagram edges in a diagram.

---

### Description

This function creates a new set of options for diagram edges in a diagram. It allows customization of various properties such as arrows, colors, fonts, and constraints for diagram edges.

---

### Examples
> EXAMPLE 1

New-DiagramOptionsLinks -ArrowsToEnabled $true -ArrowsToScaleFactor 2 -ArrowsToType 'arrow' -ArrowsMiddleEnabled $false -ArrowsMiddleScaleFactor 1 -ArrowsMiddleType 'bar' -ArrowsFromEnabled $true -ArrowsFromScaleFactor 2 -ArrowsFromType 'circle' -ArrowStrikethrough $false -Chosen $true -Color 'blue' -ColorHighlight 'yellow' -ColorHover 'green' -ColorInherit 'from' -ColorOpacity 0.8 -Dashes $false -Length '100px' -FontColor 'black' -FontSize 12 -FontName 'Arial' -FontBackground 'white' -FontStrokeWidth 1 -FontStrokeColor 'gray' -FontAlign 'center' -FontMulti 'true' -FontVAdjust 0 -WidthConstraint 150
Description
-----------
Creates a new set of diagram edge options with specific configurations.

---

### Parameters
#### **ArrowsToEnabled**
Specifies whether arrows pointing to the edge are enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |1       |false        |

#### **ArrowsToScaleFactor**
Specifies the scale factor for arrows pointing to the edge.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |2       |false        |

#### **ArrowsToType**
Specifies the type of arrows pointing to the edge. Valid values are 'arrow', 'bar', 'circle'.
Valid Values:

* arrow
* bar
* circle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **ArrowsMiddleEnabled**
Specifies whether arrows in the middle of the edge are enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |4       |false        |

#### **ArrowsMiddleScaleFactor**
Specifies the scale factor for arrows in the middle of the edge.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |5       |false        |

#### **ArrowsMiddleType**
Specifies the type of arrows in the middle of the edge. Valid values are 'arrow', 'bar', 'circle'.
Valid Values:

* arrow
* bar
* circle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **ArrowsFromEnabled**
Specifies whether arrows pointing from the edge are enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |7       |false        |

#### **ArrowsFromScaleFactor**
Specifies the scale factor for arrows pointing from the edge.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |8       |false        |

#### **ArrowsFromType**
Specifies the type of arrows pointing from the edge. Valid values are 'arrow', 'bar', 'circle'.
Valid Values:

* arrow
* bar
* circle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **ArrowStrikethrough**
Specifies whether the arrow should have a strikethrough effect.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |10      |false        |

#### **Chosen**
Specifies whether the edge is chosen.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |11      |false        |

#### **Color**
Specifies the color of the edge.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **ColorHighlight**
Specifies the color of the edge when highlighted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **ColorHover**
Specifies the color of the edge when hovered over.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

#### **ColorInherit**
Specifies how the color of the edge should inherit. Valid values are 'true', 'false', 'from', 'to', 'both'.
Valid Values:

* true
* false
* from
* to
* both

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **ColorOpacity**
Specifies the opacity of the color of the edge. Range between 0 and 1.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |16      |false        |

#### **Dashes**
Specifies whether the edge should be dashed.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |17      |false        |

#### **Length**
Specifies the length of the edge.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |18      |false        |

#### **FontColor**
Specifies the color of the font on the edge.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |19      |false        |

#### **FontSize**
Specifies the font size in pixels.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |20      |false        |

#### **FontName**
Specifies the font name for the edge.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |21      |false        |

#### **FontBackground**
Specifies the background color of the font on the edge.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |22      |false        |

#### **FontStrokeWidth**
Specifies the stroke width of the font in pixels.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |23      |false        |

#### **FontStrokeColor**
Specifies the stroke color of the font on the edge.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |24      |false        |

#### **FontAlign**
Specifies the alignment of the font. Valid values are 'center', 'left'.
Valid Values:

* center
* left

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |25      |false        |

#### **FontMulti**
Specifies whether the font supports multiline. Valid values are 'false', 'true', 'markdown', 'html'.
Valid Values:

* false
* true
* markdown
* html

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |26      |false        |

#### **FontVAdjust**
Specifies the vertical adjustment of the font.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |27      |false        |

#### **WidthConstraint**
Specifies the width constraint of the edge.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |28      |false        |

---

### Syntax
```PowerShell
New-DiagramOptionsLinks [[-ArrowsToEnabled] <Nullable`1>] [[-ArrowsToScaleFactor] <Nullable`1>] [[-ArrowsToType] <String>] [[-ArrowsMiddleEnabled] <Nullable`1>] [[-ArrowsMiddleScaleFactor] <Nullable`1>] [[-ArrowsMiddleType] <String>] [[-ArrowsFromEnabled] <Nullable`1>] [[-ArrowsFromScaleFactor] <Nullable`1>] [[-ArrowsFromType] <String>] [[-ArrowStrikethrough] <Nullable`1>] [[-Chosen] <Nullable`1>] [[-Color] <String>] [[-ColorHighlight] <String>] [[-ColorHover] <String>] [[-ColorInherit] <String>] [[-ColorOpacity] <Nullable`1>] [[-Dashes] <Nullable`1>] [[-Length] <String>] [[-FontColor] <String>] [[-FontSize] <Nullable`1>] [[-FontName] <String>] [[-FontBackground] <String>] [[-FontStrokeWidth] <Nullable`1>] [[-FontStrokeColor] <String>] [[-FontAlign] <String>] [[-FontMulti] <String>] [[-FontVAdjust] <Nullable`1>] [[-WidthConstraint] <Nullable`1>] [<CommonParameters>]
```
