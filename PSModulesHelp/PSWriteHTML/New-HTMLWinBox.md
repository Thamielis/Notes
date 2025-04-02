New-HTMLWinBox
--------------

### Synopsis
Short description

---

### Description

Long description

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
Parameter description

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Title**
The window title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **BackgroundColor**
Set the background color for the title

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
Open URL inside the window (loaded via iframe).

|Type   |Required|Position|PipelineInput|Aliases|
|-------|--------|--------|-------------|-------|
|`[Uri]`|false   |14      |false        |Uri    |

#### **Modal**
Shows the window as modal.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Maximize**
Automatically toggles the window into maximized state when created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Theme**

Valid Values:

* modern
* white

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **NoAnimation**
Disables the windows transition animation

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoShadow**
Disables the windows drop shadow

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoHeader**
Hide the window header incl. title and toolbar

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoMinmizeIcon**
Hide the minimize icon

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoMaximizeIcon**
Hide the maximize icon

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoFullScreenIcon**
Hide the fullscreen icon

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoCloseIcon**
Hide the close icon

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoResizeCapability**
Disables the window resizing capability

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoMoveCapability**
Disables the window moving capability

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-HTMLWinBox [[-HTML] <ScriptBlock>] [[-Title] <String>] [[-BackgroundColor] <String>] [[-Index] <Nullable`1>] [[-Border] <String>] [[-Height] <String>] [[-Width] <String>] [[-X] <String>] [[-Y] <String>] [[-Top] <String>] [[-Right] <String>] [[-Bottom] <String>] [[-Left] <String>] [[-Url] <Uri>] [-Modal] [-Maximize] [[-Theme] <String>] [-NoAnimation] [-NoShadow] [-NoHeader] [-NoMinmizeIcon] [-NoMaximizeIcon] [-NoFullScreenIcon] [-NoCloseIcon] [-NoResizeCapability] [-NoMoveCapability] [<CommonParameters>]
```
