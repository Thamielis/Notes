New-DiagramOptionsManipulation
------------------------------

### Synopsis
Creates a new object for manipulating diagram options in a network visualization.

---

### Description

This function creates a new object that allows manipulation of diagram options in a network visualization. It provides options to control the initial state of manipulation tools and specify which manipulation actions are allowed.

---

### Examples
> EXAMPLE 1

```PowerShell
$options = New-DiagramOptionsManipulation -InitiallyActive $true -AddNode $true -AddEdge $true
Creates a new object with manipulation options where adding nodes and edges is allowed and the manipulation tools are initially active.
```

---

### Parameters
#### **InitiallyActive**
Specifies whether the manipulation tools are initially active upon loading the visualization.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |1       |false        |

#### **AddNode**
Specifies whether the option to add nodes is enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |2       |false        |

#### **AddEdge**
Specifies whether the option to add edges is enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |3       |false        |

#### **EditNode**
Specifies whether the option to edit nodes is enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |4       |false        |

#### **EditEdge**
Specifies whether the option to edit edges is enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |5       |false        |

#### **DeleteNode**
Specifies whether the option to delete nodes is enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |6       |false        |

#### **DeleteEdge**
Specifies whether the option to delete edges is enabled.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |7       |false        |

---

### Notes
This function is based on the official vis.js documentation for network manipulation: https://visjs.github.io/vis-network/docs/network/manipulation.html
Please note that this implementation is incomplete and may require additional customization.

---

### Syntax
```PowerShell
New-DiagramOptionsManipulation [[-InitiallyActive] <Nullable`1>] [[-AddNode] <Nullable`1>] [[-AddEdge] <Nullable`1>] [[-EditNode] <Nullable`1>] [[-EditEdge] <Nullable`1>] [[-DeleteNode] <Nullable`1>] [[-DeleteEdge] <Nullable`1>] [<CommonParameters>]
```
