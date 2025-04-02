New-DiagramNode
---------------

### Synopsis
Creates nodes on a diagram

---

### Description

Creates nodes on a diagram

---

### Examples
> EXAMPLE 1

```PowerShell
An example
```

---

### Parameters
#### **HtmlTextBox**
Experimental TextBox to put HTML instead of Image using SVG

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |named   |false        |

#### **Id**
Id of a node. If not set, label will be used as Id.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Label**
Label for a diagram

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Title**
Label that shows up when hovering over node

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **To**
Parameter description

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ArrowsToEnabled**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ArrowsMiddleEnabled**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ArrowsFromEnabled**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LinkColor**
Parameter description

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|false   |named   |false        |EdgeColor|

#### **Shape**
Parameter description
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

#### **ImageType**
Parameter description
Valid Values:

* squareImage
* circularImage

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Image**
Parameter description

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |named   |false        |

#### **BorderWidth**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **BorderWidthSelected**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **BrokenImages**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Chosen**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ColorBorder**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ColorBackground**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ColorHighlightBorder**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ColorHighlightBackground**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ColorHoverBorder**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ColorHoverBackground**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FixedX**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **FixedY**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **FontColor**
Color of the label text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontSize**
Size of the label text.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **FontName**
Font face (or font family) of the label text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontBackground**
When not undefined but a color string, a background rectangle will be drawn behind the label in the supplied color.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontStrokeWidth**
As an alternative to the background rectangle, a stroke can be drawn around the text. When a value higher than 0 is supplied, the stroke will be draw

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **FontStrokeColor**
This is the color of the stroke assuming the value for stroke is higher than 0.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontAlign**
This can be set to 'left' to make the label left-aligned. Otherwise, defaults to 'center'.
Valid Values:

* center
* left

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontMulti**
If false, the label is treated as pure text drawn with the base font.
If true or 'html' the label may be multifonted, with bold, italic and code markup, interpreted as html.
If the value is 'markdown' or 'md' the label may be multifonted, with bold, italic and code markup, interpreted as markdown.
The bold, italic, bold-italic and monospaced fonts may be set up under in the font.bold, font.ital, font.boldital and font.mono properties, respectively.
Valid Values:

* false
* true
* markdown
* html

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontVAdjust**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Size**
The size is used to determine the size of node shapes that do not have the label inside of them.
These shapes are: image, circularImage, diamond, dot, star, triangle, triangleDown, hexagon, square and icon

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **X**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Y**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **IconAsImage**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IconColor**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconBrands**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconRegular**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconSolid**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Level**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **HeightConstraintMinimum**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **HeightConstraintVAlign**
Parameter description
Valid Values:

* top
* middle
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WidthConstraintMinimum**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **WidthConstraintMaximum**
Parameter description

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-DiagramNode [-HtmlTextBox <ScriptBlock>] [-Id <String>] [-Label <String>] [-Title <String>] [-To <String[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <String>] [-Shape <String>] [-BorderWidth <Nullable`1>] [-BorderWidthSelected <Nullable`1>] [-Chosen <Nullable`1>] [-ColorBorder <String>] [-ColorBackground <String>] [-ColorHighlightBorder <String>] [-ColorHighlightBackground <String>] [-ColorHoverBorder <String>] [-ColorHoverBackground <String>] [-FixedX <Nullable`1>] [-FixedY <Nullable`1>] [-FontColor <String>] [-FontSize <Nullable`1>] [-FontName <String>] [-FontBackground <String>] [-FontStrokeWidth <Nullable`1>] [-FontStrokeColor <String>] [-FontAlign <String>] [-FontMulti <String>] [-FontVAdjust <Nullable`1>] [-Size <Nullable`1>] [-X <Nullable`1>] [-Y <Nullable`1>] [-Level <Nullable`1>] [-HeightConstraintMinimum <Nullable`1>] [-HeightConstraintVAlign <String>] [-WidthConstraintMinimum <Nullable`1>] [-WidthConstraintMaximum <Nullable`1>] [<CommonParameters>]
```
```PowerShell
New-DiagramNode [-HtmlTextBox <ScriptBlock>] [-Id <String>] [-Label <String>] [-Title <String>] [-To <String[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <String>] [-ImageType <String>] [-Image <Uri>] [-BorderWidth <Nullable`1>] [-BorderWidthSelected <Nullable`1>] [-BrokenImages <String>] [-Chosen <Nullable`1>] [-ColorBorder <String>] [-ColorBackground <String>] [-ColorHighlightBorder <String>] [-ColorHighlightBackground <String>] [-ColorHoverBorder <String>] [-ColorHoverBackground <String>] [-FixedX <Nullable`1>] [-FixedY <Nullable`1>] [-FontColor <String>] [-FontSize <Nullable`1>] [-FontName <String>] [-FontBackground <String>] [-FontStrokeWidth <Nullable`1>] [-FontStrokeColor <String>] [-FontAlign <String>] [-FontMulti <String>] [-FontVAdjust <Nullable`1>] [-Size <Nullable`1>] [-X <Nullable`1>] [-Y <Nullable`1>] [-Level <Nullable`1>] [-HeightConstraintMinimum <Nullable`1>] [-HeightConstraintVAlign <String>] [-WidthConstraintMinimum <Nullable`1>] [-WidthConstraintMaximum <Nullable`1>] [<CommonParameters>]
```
```PowerShell
New-DiagramNode [-HtmlTextBox <ScriptBlock>] [-Id <String>] [-Label <String>] [-Title <String>] [-To <String[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <String>] [-BorderWidth <Nullable`1>] [-BorderWidthSelected <Nullable`1>] [-Chosen <Nullable`1>] [-FixedX <Nullable`1>] [-FixedY <Nullable`1>] [-FontColor <String>] [-FontSize <Nullable`1>] [-FontName <String>] [-FontBackground <String>] [-FontStrokeWidth <Nullable`1>] [-FontStrokeColor <String>] [-FontAlign <String>] [-FontMulti <String>] [-FontVAdjust <Nullable`1>] [-Size <Nullable`1>] [-X <Nullable`1>] [-Y <Nullable`1>] [-IconAsImage] [-IconColor <String>] [-IconSolid <String>] [-Level <Nullable`1>] [-HeightConstraintMinimum <Nullable`1>] [-HeightConstraintVAlign <String>] [-WidthConstraintMinimum <Nullable`1>] [-WidthConstraintMaximum <Nullable`1>] [<CommonParameters>]
```
```PowerShell
New-DiagramNode [-HtmlTextBox <ScriptBlock>] [-Id <String>] [-Label <String>] [-Title <String>] [-To <String[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <String>] [-BorderWidth <Nullable`1>] [-BorderWidthSelected <Nullable`1>] [-Chosen <Nullable`1>] [-FixedX <Nullable`1>] [-FixedY <Nullable`1>] [-FontColor <String>] [-FontSize <Nullable`1>] [-FontName <String>] [-FontBackground <String>] [-FontStrokeWidth <Nullable`1>] [-FontStrokeColor <String>] [-FontAlign <String>] [-FontMulti <String>] [-FontVAdjust <Nullable`1>] [-Size <Nullable`1>] [-X <Nullable`1>] [-Y <Nullable`1>] [-IconAsImage] [-IconColor <String>] [-IconRegular <String>] [-Level <Nullable`1>] [-HeightConstraintMinimum <Nullable`1>] [-HeightConstraintVAlign <String>] [-WidthConstraintMinimum <Nullable`1>] [-WidthConstraintMaximum <Nullable`1>] [<CommonParameters>]
```
```PowerShell
New-DiagramNode [-HtmlTextBox <ScriptBlock>] [-Id <String>] [-Label <String>] [-Title <String>] [-To <String[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <String>] [-BorderWidth <Nullable`1>] [-BorderWidthSelected <Nullable`1>] [-Chosen <Nullable`1>] [-FixedX <Nullable`1>] [-FixedY <Nullable`1>] [-FontColor <String>] [-FontSize <Nullable`1>] [-FontName <String>] [-FontBackground <String>] [-FontStrokeWidth <Nullable`1>] [-FontStrokeColor <String>] [-FontAlign <String>] [-FontMulti <String>] [-FontVAdjust <Nullable`1>] [-Size <Nullable`1>] [-X <Nullable`1>] [-Y <Nullable`1>] [-IconAsImage] [-IconColor <String>] [-IconBrands <String>] [-Level <Nullable`1>] [-HeightConstraintMinimum <Nullable`1>] [-HeightConstraintVAlign <String>] [-WidthConstraintMinimum <Nullable`1>] [-WidthConstraintMaximum <Nullable`1>] [<CommonParameters>]
```
