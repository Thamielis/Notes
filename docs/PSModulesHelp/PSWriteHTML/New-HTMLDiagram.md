New-HTMLDiagram
---------------

### Synopsis
Creates a new HTML diagram with customizable options.

---

### Description

This function creates a new HTML diagram with customizable options such as diagram data, height, width, image bundling, background image, background size, auto-resize, loading bar, filtering, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLDiagram -Diagram {
    // Diagram configuration settings here
} -Height 500 -Width 800 -BundleImages -BackGroundImage 'https://example.com/background.jpg' -BackgroundSize 'cover' -DisableLoader -EnableFiltering -MinimumFilteringChars 2 -EnableFilteringButton
Creates a new HTML diagram with custom configuration settings including height, width, bundled images, background image, disabled loading bar, enabled filtering, and a filtering button.
```
> EXAMPLE 2

```PowerShell
New-HTMLDiagram -Diagram {
    // More diagram configuration settings
} -Height 600 -Width 1000
Creates a new HTML diagram with additional configuration settings and default options for height and width.
```

---

### Parameters
#### **Diagram**
Specifies the diagram data to be displayed. This should be a ScriptBlock containing the diagram configuration.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Height**
Specifies the height of the diagram.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Width**
Specifies the width of the diagram.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **BundleImages**
Indicates whether to bundle images used in the diagram.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BackGroundImage**
Specifies the background image for the diagram.

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |4       |false        |

#### **BackgroundSize**
Specifies the size of the background image. Default is '100% 100%'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **NoAutoResize**
Indicates whether auto-resize functionality is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableLoader**
Indicates whether the loading bar should be disabled.

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[Switch]`|false   |named   |false        |DisableLoadingBar|

#### **EnableFiltering**
Indicates whether filtering functionality is enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MinimumFilteringChars**
Specifies the minimum number of characters required for filtering.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |

#### **EnableFilteringButton**
Indicates whether a filtering button should be displayed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLDiagram [[-Diagram] <ScriptBlock>] [[-Height] <Object>] [[-Width] <Object>] [-BundleImages] [[-BackGroundImage] <Uri>] [[-BackgroundSize] <String>] [-NoAutoResize] [-DisableLoader] [-EnableFiltering] [[-MinimumFilteringChars] <Int32>] [-EnableFilteringButton] [<CommonParameters>]
```
