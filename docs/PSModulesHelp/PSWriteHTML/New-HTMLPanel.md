New-HTMLPanel
-------------

### Synopsis
Creates a new HTML panel with customizable styling options.

---

### Description

The New-HTMLPanel function creates a new HTML panel with various styling options such as background color, width, margin, alignment, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLPanel -Content { "This is the content of the panel" } -BackgroundColor "lightblue" -Width "50%" -Margin "10px" -AlignContentText "center" -BorderRadius "5px" -AnchorName "myPanel" -StyleSheetsConfiguration @{ Panel = "customPanel" }
Creates a new HTML panel with specified content, background color, width, margin, alignment, border radius, anchor name, and custom style sheet configuration.
```

---

### Parameters
#### **Content**
Specifies the content of the HTML panel as a ScriptBlock.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **BackgroundColor**
Specifies the background color of the HTML panel.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|false   |named   |false        |BackgroundShade|

#### **Invisible**
Indicates whether the panel should be invisible.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Width**
Specifies the width of the panel.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |flex-basis|

#### **Margin**
Specifies the margin of the panel.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AlignContentText**
Specifies the alignment of the content within the panel.
Valid Values:

* center
* left
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderRadius**
Specifies the border radius of the panel.
Valid Values:

* 0px
* 5px
* 10px
* 15px
* 20px
* 25px

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AnchorName**
Specifies the anchor name of the panel.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StyleSheetsConfiguration**
Specifies the style sheets configuration for the panel.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLPanel [[-Content] <ScriptBlock>] [-BackgroundColor <String>] [-Invisible] [-Width <String>] [-Margin <String>] [-AlignContentText <String>] [-BorderRadius <String>] [-AnchorName <String>] [-StyleSheetsConfiguration <IDictionary>] [<CommonParameters>]
```
