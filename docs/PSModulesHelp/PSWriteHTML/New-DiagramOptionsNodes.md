New-DiagramOptionsNodes
-----------------------

### Synopsis
Creates a custom object representing options for diagram nodes.

---

### Description

This function creates a custom object with various settings for diagram nodes, such as border width, colors, font styles, shape, constraints, and margins.

---

### Examples
> EXAMPLE 1

```PowerShell
New-DiagramOptionsNodes -BorderWidth 1 -BorderWidthSelected 2 -ColorBorder '#2B7CE9' -ColorBackground '#97C2FC' -Shape 'circle' -Size 50
Creates a new diagram node with specified border widths, colors, shape, and size.
```
> EXAMPLE 2

```PowerShell
New-DiagramOptionsNodes -FontColor '#000000' -FontSize 12 -FontName 'Arial' -Shape 'square' -Size 30
Creates a new diagram node with specified font color, size, font family, shape, and size.
```

---

### Parameters
#### **BorderWidth**
Specifies the width of the border around the node.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **BorderWidthSelected**
Specifies the width of the border around the node when selected.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **BrokenImage**
Specifies the image to display if the node image is broken.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Chosen**
Indicates whether the node is chosen.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ColorBorder**
Specifies the color of the node border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ColorBackground**
Specifies the background color of the node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ColorHighlightBorder**
Specifies the color of the node border when highlighted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ColorHighlightBackground**
Specifies the background color of the node when highlighted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ColorHoverBorder**
Specifies the color of the node border when hovered over.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ColorHoverBackground**
Specifies the background color of the node when hovered over.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FixedX**
Indicates whether the node's X position is fixed.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **FixedY**
Indicates whether the node's Y position is fixed.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **FontColor**
Specifies the color of the node's font.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontSize**
Specifies the font size of the node text in pixels.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **FontName**
Specifies the font family of the node text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontBackground**
Specifies the background color of the node's font.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontStrokeWidth**
Specifies the stroke width of the node's font.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **FontStrokeColor**
Specifies the stroke color of the node's font.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontAlign**
Specifies the alignment of the node's text (center or left).
Valid Values:

* center
* left

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontMulti**
Specifies the multi-line mode for the node's text (false, true, markdown, html).
Valid Values:

* false
* true
* markdown
* html

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontVAdjust**
Specifies the vertical adjustment of the node's text.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Size**
Specifies the size of the node.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Shape**
Specifies the shape of the node (circle, dot, diamond, ellipse, database, box, square, triangle, triangleDown, text, star, hexagon).
Valid Values:

* circle
* dot
* diamond
* ellipse
* database
* box
* square
* triangle
* triangleDown
* text
* star
* hexagon

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HeightConstraintMinimum**
Specifies the minimum height constraint for the node.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **HeightConstraintVAlign**
Specifies the vertical alignment of the node within its height constraint (top, middle, bottom).
Valid Values:

* top
* middle
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WidthConstraintMinimum**
Specifies the minimum width constraint for the node.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **WidthConstraintMaximum**
Specifies the maximum width constraint for the node.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Margin**
Specifies the margin around the node on all sides.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **MarginTop**
Specifies the top margin around the node.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **MarginRight**
Specifies the right margin around the node.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **MarginBottom**
Specifies the bottom margin around the node.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **MarginLeft**
Specifies the left margin around the node.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-DiagramOptionsNodes [-BorderWidth <Nullable`1>] [-BorderWidthSelected <Nullable`1>] [-BrokenImage <String>] [-Chosen <Nullable`1>] [-ColorBorder <String>] [-ColorBackground <String>] [-ColorHighlightBorder <String>] [-ColorHighlightBackground <String>] [-ColorHoverBorder <String>] [-ColorHoverBackground <String>] [-FixedX <Nullable`1>] [-FixedY <Nullable`1>] [-FontColor <String>] [-FontSize <Nullable`1>] [-FontName <String>] [-FontBackground <String>] [-FontStrokeWidth <Nullable`1>] [-FontStrokeColor <String>] [-FontAlign <String>] [-FontMulti <String>] [-FontVAdjust <Nullable`1>] [-Size <Nullable`1>] [-Shape <String>] [-HeightConstraintMinimum <Nullable`1>] [-HeightConstraintVAlign <String>] [-WidthConstraintMinimum <Nullable`1>] [-WidthConstraintMaximum <Nullable`1>] [-Margin <Nullable`1>] [-MarginTop <Nullable`1>] [-MarginRight <Nullable`1>] [-MarginBottom <Nullable`1>] [-MarginLeft <Nullable`1>] [<CommonParameters>]
```
