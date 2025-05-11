New-CarouselSlide
-----------------

### Synopsis
Creates a new carousel slide with specified content, background color, and height.

---

### Description

This function creates a new carousel slide with the provided content, background color, and height. The slide content is specified using a script block, the background color is a string representing a color, and the height is a numerical value.

---

### Examples
> EXAMPLE 1

```PowerShell
New-CarouselSlide -SlideContent { "This is the content of the slide" } -BackgroundColor 'blue' -Height 200
Creates a new carousel slide with the specified content, background color 'blue', and height of 200 pixels.
```

---

### Parameters
#### **SlideContent**
The script block containing the content to be displayed on the slide.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **BackgroundColor**
The background color of the slide specified as a string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Height**
The height of the slide.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Syntax
```PowerShell
New-CarouselSlide [[-SlideContent] <ScriptBlock>] [[-BackgroundColor] <String>] [[-Height] <Object>] [<CommonParameters>]
```
