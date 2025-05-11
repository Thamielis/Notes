New-DiagramOptionsInteraction
-----------------------------

### Synopsis
Creates a new diagram options interaction object with customizable options.

---

### Description

This function defines a diagram options interaction object with various interactive features such as dragging nodes, dragging view, hiding edges on drag, hiding edges on zoom, hiding nodes on drag, hover effects, keyboard navigation, multiselect, navigation buttons, and selection options.

---

### Examples
> EXAMPLE 1

```PowerShell
New-DiagramOptionsInteraction -DragNodes -DragView -HideEdgesOnDrag -HideNodesOnDrag -Hover -KeyboardEnabled -Multiselect -Selectable -SelectConnectedEdges
Creates a new diagram options interaction object with basic interactive features enabled.
```
> EXAMPLE 2

```PowerShell
New-DiagramOptionsInteraction -DragNodes -DragView -HideEdgesOnDrag -HideNodesOnDrag -Hover -KeyboardEnabled -Multiselect -Selectable -SelectConnectedEdges -NavigationButtons
Creates a new diagram options interaction object with navigation buttons added.
```

---

### Parameters
#### **DragNodes**
Specifies whether dragging nodes is enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |1       |false        |

#### **DragView**
Specifies whether dragging the view is enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |2       |false        |

#### **HideEdgesOnDrag**
Specifies whether edges are hidden when dragging.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |3       |false        |

#### **HideEdgesOnZoom**
Specifies whether edges are hidden when zooming.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |4       |false        |

#### **HideNodesOnDrag**
Specifies whether nodes are hidden when dragging.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |5       |false        |

#### **Hover**
Specifies whether hover effects are enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |6       |false        |

#### **HoverConnectedEdges**
Specifies whether connected edges are affected by hover.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |7       |false        |

#### **KeyboardEnabled**
Specifies whether keyboard navigation is enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |8       |false        |

#### **KeyboardSpeedX**
Specifies the speed of movement in the X direction using the keyboard.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |9       |false        |

#### **KeyboardSpeedY**
Specifies the speed of movement in the Y direction using the keyboard.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |10      |false        |

#### **KeyboardSpeedZoom**
Specifies the speed of zooming using the keyboard.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |11      |false        |

#### **KeyboardBindToWindow**
Specifies whether keyboard events are bound to the window.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |12      |false        |

#### **Multiselect**
Specifies whether multiple selections are allowed.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |13      |false        |

#### **NavigationButtons**
Specifies whether navigation buttons are displayed.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |14      |false        |

#### **Selectable**
Specifies whether nodes and edges are selectable.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |15      |false        |

#### **SelectConnectedEdges**
Specifies whether connected edges are selected along with nodes.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |16      |false        |

#### **TooltipDelay**

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |17      |false        |

#### **ZoomView**

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |18      |false        |

---

### Notes
Based on options https://visjs.github.io/vis-network/docs/network/interaction.html#

---

### Syntax
```PowerShell
New-DiagramOptionsInteraction [[-DragNodes] <Nullable`1>] [[-DragView] <Nullable`1>] [[-HideEdgesOnDrag] <Nullable`1>] [[-HideEdgesOnZoom] <Nullable`1>] [[-HideNodesOnDrag] <Nullable`1>] [[-Hover] <Nullable`1>] [[-HoverConnectedEdges] <Nullable`1>] [[-KeyboardEnabled] <Nullable`1>] [[-KeyboardSpeedX] <Nullable`1>] [[-KeyboardSpeedY] <Nullable`1>] [[-KeyboardSpeedZoom] <Nullable`1>] [[-KeyboardBindToWindow] <Nullable`1>] [[-Multiselect] <Nullable`1>] [[-NavigationButtons] <Nullable`1>] [[-Selectable] <Nullable`1>] [[-SelectConnectedEdges] <Nullable`1>] [[-TooltipDelay] <Nullable`1>] [[-ZoomView] <Nullable`1>] [<CommonParameters>]
```
