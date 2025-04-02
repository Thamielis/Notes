New-DiagramOptionsLayout
------------------------

### Synopsis
Short description

---

### Description

When enabling the hierarchical layout, it overrules some of the other options.
The physics is set to the hierarchical repulsion solver and dynamic smooth edges are converted to static smooth edges.

---

### Examples
> EXAMPLE 1

```PowerShell
An example
```

---

### Parameters
#### **RandomSeed**
When NOT using the hierarchical layout, the nodes are randomly positioned initially. This means that the settled result is different every time. If you provide a random seed manually, the layout will be the same every time. Ideally you try with an undefined seed, reload until you are happy with the layout and use the getSeed() method to ascertain the seed.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |1       |false        |

#### **ImprovedLayout**
When enabled, the network will use the Kamada Kawai algorithm for initial layout. For networks larger than 100 nodes, clustering will be performed automatically to reduce the amount of nodes. This can greatly improve the stabilization times. If the network is very interconnected (no or few leaf nodes), this may not work and it will revert back to the old method. Performance will be improved in the future.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |2       |false        |

#### **ClusterThreshold**
Cluster threshold to which improvedLayout applies.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |3       |false        |

#### **HierarchicalEnabled**
When true, the layout engine positions the nodes in a hierarchical fashion using default settings.
Toggle the usage of the hierarchical layout system. If this option is not defined, it is set to true if any of the properties in this object are defined.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |4       |false        |

#### **HierarchicalLevelSeparation**
The distance between the different levels.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |5       |false        |

#### **HierarchicalNodeSpacing**
Minimum distance between nodes on the free axis. This is only for the initial layout. If you enable physics, the node distance there will be the effective node distance.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |6       |false        |

#### **HierarchicalTreeSpacing**
Distance between different trees (independent networks). This is only for the initial layout. If you enable physics, the repulsion model will denote the distance between the trees.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |7       |false        |

#### **HierarchicalBlockShifting**
Method for reducing whitespace. Can be used alone or together with edge minimization. Each node will check for whitespace and will shift it's branch along with it for as far as it can, respecting the nodeSpacing on any level. This is mainly for the initial layout. If you enable physics, the layout will be determined by the physics. This will greatly speed up the stabilization time though!

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |8       |false        |

#### **HierarchicalEdgeMinimization**
Method for reducing whitespace. Can be used alone or together with block shifting. Enabling block shifting will usually speed up the layout process. Each node will try to move along its free axis to reduce the total length of it's edges. This is mainly for the initial layout. If you enable physics, the layout will be determined by the physics. This will greatly speed up the stabilization time though!

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |9       |false        |

#### **HierarchicalParentCentralization**
When true, the parents nodes will be centered again after the layout algorithm has been finished.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |10      |false        |

#### **HierarchicalDirection**
The direction of the hierarchical layout. The available options are: UD, DU, LR, RL. To simplify: up-down, down-up, left-right, right-left.
Valid Values:

* FromUpToDown
* FromDownToUp
* FromLeftToRight
* FromRigthToLeft

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **HierarchicalSortMethod**
The algorithm used to ascertain the levels of the nodes based on the data. The possible options are: hubsize, directed.
Hubsize takes the nodes with the most edges and puts them at the top. From that the rest of the hierarchy is evaluated.
Directed adheres to the to and from data of the edges. A --> B so B is a level lower than A.
Valid Values:

* hubsize
* directed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **HierarchicalShakeTowards**
Controls whether in directed layout should all the roots be lined up at the top and their child nodes as close to their roots as possible (roots) or all the leaves lined up at the bottom and their parents as close to their children as possible (leaves, default).
Valid Values:

* roots
* leaves

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-DiagramOptionsLayout [[-RandomSeed] <Nullable`1>] [[-ImprovedLayout] <Nullable`1>] [[-ClusterThreshold] <Nullable`1>] [[-HierarchicalEnabled] <Nullable`1>] [[-HierarchicalLevelSeparation] <Nullable`1>] [[-HierarchicalNodeSpacing] <Nullable`1>] [[-HierarchicalTreeSpacing] <Nullable`1>] [[-HierarchicalBlockShifting] <Nullable`1>] [[-HierarchicalEdgeMinimization] <Nullable`1>] [[-HierarchicalParentCentralization] <Nullable`1>] [[-HierarchicalDirection] <String>] [[-HierarchicalSortMethod] <String>] [[-HierarchicalShakeTowards] <String>] [<CommonParameters>]
```
