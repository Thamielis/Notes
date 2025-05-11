New-ChartToolbar
----------------

### Synopsis
Creates a new chart toolbar object with customizable options.

---

### Description

This function defines a chart toolbar object with various tools such as download, selection, zoom, zoom in, zoom out, pan, and reset. It allows customization of the toolbar appearance and behavior.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartToolbar -Download -Selection -Zoom -ZoomIn -ZoomOut -Pan -Reset -AutoSelected 'zoom'
Creates a new chart toolbar object with all tools enabled and the default tool set to zoom.
```
> EXAMPLE 2

```PowerShell
New-ChartToolbar -Download -Zoom -ZoomOut -Pan -AutoSelected 'pan'
Creates a new chart toolbar object with download, zoom, zoom out, and pan tools enabled, and the default tool set to pan.
```

---

### Parameters
#### **Download**
Switch parameter to enable the download tool in the toolbar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Selection**
Switch parameter to enable the selection tool in the toolbar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Zoom**
Switch parameter to enable the zoom tool in the toolbar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ZoomIn**
Switch parameter to enable the zoom in tool in the toolbar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ZoomOut**
Switch parameter to enable the zoom out tool in the toolbar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Pan**
Switch parameter to enable the pan tool in the toolbar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Reset**
Switch parameter to enable the reset tool in the toolbar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutoSelected**
Specifies the default tool to be auto-selected when the toolbar is loaded. Valid values are 'zoom', 'selection', or 'pan'. Default is 'zoom'.
Valid Values:

* zoom
* selection
* pan

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
New-ChartToolbar [-Download] [-Selection] [-Zoom] [-ZoomIn] [-ZoomOut] [-Pan] [-Reset] [[-AutoSelected] <String>] [<CommonParameters>]
```
