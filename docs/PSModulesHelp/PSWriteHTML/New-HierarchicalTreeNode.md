New-HierarchicalTreeNode
------------------------

### Synopsis
Creates a new hierarchical tree node object.

---

### Description

This function creates a new hierarchical tree node object with specified properties.

---

### Examples
> EXAMPLE 1

```PowerShell
$node = New-HierarchicalTreeNode -ID "1" -Label "Node 1" -Description "This is node 1" -To "0"
Creates a new hierarchical tree node with ID "1", label "Node 1", description "This is node 1", and connected to parent node with ID "0".
```
> EXAMPLE 2

```PowerShell
$node = New-HierarchicalTreeNode -ID "2" -Label "Node 2" -Type "Animal" -Description "This is node 2" -To "1"
Creates a new hierarchical tree node with ID "2", label "Node 2", type "Animal", description "This is node 2", and connected to parent node with ID "1".
```

---

### Parameters
#### **ID**
The unique identifier for the node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Label**
The label or name of the node.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |2       |false        |Name   |

#### **Type**
The type of the node. Default value is "Organism".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Description**
The description of the node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **To**
The parent node ID to which this node is connected.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

---

### Syntax
```PowerShell
New-HierarchicalTreeNode [[-ID] <String>] [[-Label] <String>] [[-Type] <String>] [[-Description] <String>] [[-To] <String>] [<CommonParameters>]
```
