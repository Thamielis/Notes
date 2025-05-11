New-HTMLOrgChart
----------------

### Synopsis
Creates an HTML organizational chart based on the provided nodes and options.

---

### Description

This function generates an interactive HTML organizational chart based on the specified nodes and customization options. Users can define the layout direction, initial visibility level, vertical alignment, and various interactive features like panning, zooming, dragging, and exporting.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTML {
    New-HTMLOrgChart {
        New-OrgChartNode -Name 'CEO' -Title 'Chief Executive Officer' {
            New-OrgChartNode -Name 'Manager' -Title 'Manager'
            New-OrgChartNode -Name 'Supervisor' -Title 'Supervisor'
            New-OrgChartNode -Name 'Employee' -Title 'Employee' {
                New-OrgChartNode -Name 'Assistant' -Title 'Assistant'
            }
        }
    } -AllowExport -ExportExtension pdf -Draggable
} -FilePath $PSScriptRoot\OrgChart.html -ShowHTML -Online
```

---

### Parameters
#### **ChartNodes**
Specifies the nodes to be displayed on the chart. This parameter should contain a script block defining the organizational structure.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Direction**
Specifies the layout direction of the chart. Available values are "TopToBottom" (default), "BottomToTop", "LeftToRight", and "RightToLeft".
Valid Values:

* TopToBottom
* BottomToTop
* LeftToRight
* RightToLeft

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **VisileLevel**
Sets the initial visibility level of the org chart.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **VerticalLevel**
Aligns the nodes vertically starting from the specified level.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **NodeTitle**
Sets the text content of the title section of each org chart node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **ToggleSiblings**
Enables the ability to show/hide left and right sibling nodes by clicking arrows.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Pan**
Enables panning the org chart by mouse drag and drop.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Zoom**
Enables zooming in and out of the org chart using the mouse wheel.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ZoomInLimit**
Sets the maximum zoom-in limit.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |6       |false        |

#### **ZoomOutLimit**
Sets the maximum zoom-out limit.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |7       |false        |

#### **Draggable**
Enables dragging and dropping nodes within the org chart. Note: This feature is not supported on Internet Explorer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowExport**
Enables the export button for the org chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExportFileName**
Specifies the filename when exporting the org chart as an image.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **ExportExtension**
Specifies the format for exporting the org chart. Available values are "png" and "pdf".
Valid Values:

* png
* pdf

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **ChartID**
Specifies a custom ID for the org chart. If not provided, a random ID will be generated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

---

### Notes
This function requires the PSWriteHTML module to be installed. For more information, visit: https://github.com/EvotecIT/PSWriteHTML

---

### Syntax
```PowerShell
New-HTMLOrgChart [[-ChartNodes] <ScriptBlock>] [[-Direction] <String>] [[-VisileLevel] <Int32>] [[-VerticalLevel] <Int32>] [[-NodeTitle] <String>] [-ToggleSiblings] [-Pan] [-Zoom] [[-ZoomInLimit] <Double>] [[-ZoomOutLimit] <Double>] [-Draggable] [-AllowExport] [[-ExportFileName] <String>] [[-ExportExtension] <Object>] [[-ChartID] <String>] [<CommonParameters>]
```
