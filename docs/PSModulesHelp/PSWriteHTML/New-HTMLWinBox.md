New-HTMLWinBox
--------------

### Synopsis
Creates a customizable HTML window box with various options for styling and functionality.

---

### Description

This function allows you to create an HTML window box with customizable features such as title, background color, initial position, size, URL content, modal display, theme, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
$Data = Get-Process | Select-Object -First 3
New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example-WinBox01.html" {
    New-HTMLWinBox -Title 'This is a test Window' -BackgroundColor Red {
        New-HTMLText -Text 'This is a text within modal dialog'
        New-HTMLTable -DataTable $Data
    } -Width 50% -Height 50% -X center -Y center
} -Online -ShowHTML
```

---

### Parameters
#### **HTML**
Specifies the HTML content to be displayed within the window box.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Title**
Specifies the title of the window box.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **BackgroundColor**
Specifies the background color of the window box title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Index**
Set the initial z-index of the window to this value (could be increased automatically when unfocused/focused).

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |4       |false        |

#### **Border**
Set the border width of the window (supports all css units, like px, %, em, rem, vh, vmax).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Height**
Set the initial width/height of the window (supports units "px" and "%").

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Width**
Set the initial width/height of the window (supports units "px" and "%").

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **X**
Set the initial position of the window (supports: "right" for x-axis, "bottom" for y-axis, "center" for both, units "px" and "%" for both).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **Y**
Set the initial position of the window (supports: "right" for x-axis, "bottom" for y-axis, "center" for both, units "px" and "%" for both).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **Top**
Set or limit the viewport of the window's available area (supports units "px" and "%").

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **Right**
Set or limit the viewport of the window's available area (supports units "px" and "%").

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **Bottom**
Set or limit the viewport of the window's available area (supports units "px" and "%").

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **Left**
Set or limit the viewport of the window's available area (supports units "px" and "%").

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **Url**
Specifies the URL content to be loaded inside the window box via iframe.

|Type   |Required|Position|PipelineInput|Aliases|
|-------|--------|--------|-------------|-------|
|`[Uri]`|false   |14      |false        |Uri    |

#### **Modal**
Indicates whether the window box should be displayed as a modal window.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Maximize**
Automatically maximizes the window box when created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Theme**
Specifies the theme of the window box.
Valid Values:

* modern
* white

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **NoAnimation**
Disables transition animations for the window box.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoShadow**
Disables the drop shadow effect for the window box.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoHeader**
Hides the header of the window box, including the title and toolbar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoMinmizeIcon**
Hides the minimize icon in the window box.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoMaximizeIcon**
Hides the maximize icon in the window box.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoFullScreenIcon**
Hides the fullscreen icon in the window box.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoCloseIcon**
Hides the close icon in the window box.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoResizeCapability**
Disables the resizing capability of the window box.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoMoveCapability**
Disables the moving capability of the window box.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
This function provides a flexible way to create interactive and styled window boxes in HTML.

---

### Syntax
```PowerShell
New-HTMLWinBox [[-HTML] <ScriptBlock>] [[-Title] <String>] [[-BackgroundColor] <String>] [[-Index] <Nullable`1>] [[-Border] <String>] [[-Height] <String>] [[-Width] <String>] [[-X] <String>] [[-Y] <String>] [[-Top] <String>] [[-Right] <String>] [[-Bottom] <String>] [[-Left] <String>] [[-Url] <Uri>] [-Modal] [-Maximize] [[-Theme] <String>] [-NoAnimation] [-NoShadow] [-NoHeader] [-NoMinmizeIcon] [-NoMaximizeIcon] [-NoFullScreenIcon] [-NoCloseIcon] [-NoResizeCapability] [-NoMoveCapability] [<CommonParameters>]
```
