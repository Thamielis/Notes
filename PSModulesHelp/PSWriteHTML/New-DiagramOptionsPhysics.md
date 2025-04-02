New-DiagramOptionsPhysics
-------------------------

### Synopsis
Short description

---

### Description

Long description

---

### Examples
> EXAMPLE 1

```PowerShell
An example
```

---

### Parameters
#### **Enabled**
Toggle the physics system on or off. This property is optional. If you define any of the options below and enabled is undefined, this will be set to true.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Solver**
You can select your own solver. Possible options: 'barnesHut', 'repulsion', 'hierarchicalRepulsion', 'forceAtlas2Based'. When setting the hierarchical layout, the hierarchical repulsion solver is automatically selected, regardless of what you fill in here.
Valid Values:

* barnesHut
* repulsion
* hierarchicalRepulsion
* forceAtlas2Based

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StabilizationEnabled**
Toggle the stabilization. This is an optional property. If undefined, it is automatically set to true when any of the properties of this object are defined.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Stabilizationiterations**
The physics module tries to stabilize the network on load up til a maximum number of iterations defined here. If the network stabilized with less, you are finished before the maximum number.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **StabilizationupdateInterval**
When stabilizing, the DOM can freeze. You can chop the stabilization up into pieces to show a loading bar for instance. The interval determines after how many iterations the stabilizationProgress event is triggered.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **StabilizationonlyDynamicEdges**
If you have predefined the position of all nodes and only want to stabilize the dynamic smooth edges, set this to true. It freezes all nodes except the invisible dynamic smooth curve support nodes. If you want the visible nodes to move and stabilize, do not use this.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Stabilizationfit**
Toggle whether or not you want the view to zoom to fit all nodes when the stabilization is finished.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **MaxVelocity**
The physics module limits the maximum velocity of the nodes to increase the time to stabilization. This is the maximum value.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **MinVelocity**
Once the minimum velocity is reached for all nodes, we assume the network has been stabilized and the simulation stops.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Timestep**
The physics simulation is discrete. This means we take a step in time, calculate the forces, move the nodes and take another step. If you increase this number the steps will be too large and the network can get unstable. If you see a lot of jittery movement in the network, you may want to reduce this value a little.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **AdaptiveTimestep**
If this is enabled, the timestep will intelligently be adapted (only during the stabilization stage if stabilization is enabled!) to greatly decrease stabilization times. The timestep configured above is taken as the minimum timestep. This can be further improved by using the improvedLayout algorithm.
Layout: https://visjs.github.io/vis-network/docs/network/layout.html#layout

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **BarnesHutTheta**
This parameter determines the boundary between consolidated long range forces and individual short range forces. To oversimplify higher values are faster but generate more errors, lower values are slower but with less errors.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **BarnesHutGravitationalConstant**
Gravity attracts. We like repulsion. So the value is negative. If you want the repulsion to be stronger, decrease the value (so -10000, -50000).

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **BarnesHutCentralGravity**
There is a central gravity attractor to pull the entire network back to the center.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **BarnesHutSpringLength**
The edges are modelled as springs. This springLength here is the rest length of the spring.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **BarnesHutSpringConstant**
This is how 'sturdy' the springs are. Higher values mean stronger springs.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **BarnesHutDamping**
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **BarnesHutAvoidOverlap**
Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ForceAtlas2BasedTheta**
This parameter determines the boundary between consolidated long range forces and individual short range forces. To oversimplify higher values are faster but generate more errors, lower values are slower but with less errors.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ForceAtlas2BasedGravitationalConstant**
This is similar to the barnesHut method except that the falloff is linear instead of quadratic. The connectivity is also taken into account as a factor of the mass. If you want the repulsion to be stronger, decrease the value (so -1000, -2000).

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ForceAtlas2BasedCentralGravity**
There is a central gravity attractor to pull the entire network back to the center. This is not dependent on distance.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ForceAtlas2BasedSpringLength**
The edges are modelled as springs. This springLength here is the rest length of the spring.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ForceAtlas2BasedSpringConstant**
This is how 'sturdy' the springs are. Higher values mean stronger springs.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ForceAtlas2BasedDamping**
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ForceAtlas2BasedAvoidOverlap**
Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **RepulsionNodeDistance**
This is the range of influence for the repulsion.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **RepulsionCentralGravity**
There is a central gravity attractor to pull the entire network back to the center.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **RepulsionSpringLength**
The edges are modelled as springs. This springLength here is the rest length of the spring.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **RepulsionSpringConstant**
This is how 'sturdy' the springs are. Higher values mean stronger springs.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **RepulsionDamping**
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **HierarchicalRepulsionNodeDistance**
This is the range of influence for the repulsion. Default (Number) Default 120

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **HierarchicalRepulsionCentralGravity**
There is a central gravity attractor to pull the entire network back to the center. Default (Number) 0.0

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **HierarchicalRepulsionSpringLength**
The edges are modelled as springs. This springLength here is the rest length of the spring.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **HierarchicalRepulsionSpringConstant**
This is how 'sturdy' the springs are. Higher values mean stronger springs.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **HierarchicalRepulsionDamping**
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **HierarchicalRepulsionAvoidOverlap**
Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **WindX**
The amount of force to be applied pushing non-fixed nodes to the right (positive value) or to the left (negative value).

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **WindY**
The amount of force to be applied pushing non-fixed nodes downwards (positive value) or upwards (negative value).

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-DiagramOptionsPhysics [-Enabled <Nullable`1>] [-Solver <String>] [-StabilizationEnabled <Nullable`1>] [-Stabilizationiterations <Nullable`1>] [-StabilizationupdateInterval <Nullable`1>] [-StabilizationonlyDynamicEdges <Nullable`1>] [-Stabilizationfit <Nullable`1>] [-MaxVelocity <Nullable`1>] [-MinVelocity <Nullable`1>] [-Timestep <Nullable`1>] [-AdaptiveTimestep <Nullable`1>] [-BarnesHutTheta <Nullable`1>] [-BarnesHutGravitationalConstant <Nullable`1>] [-BarnesHutCentralGravity <Nullable`1>] [-BarnesHutSpringLength <Nullable`1>] [-BarnesHutSpringConstant <Nullable`1>] [-BarnesHutDamping <Nullable`1>] [-BarnesHutAvoidOverlap <Nullable`1>] [-WindX <Nullable`1>] [-WindY <Nullable`1>] [<CommonParameters>]
```
```PowerShell
New-DiagramOptionsPhysics [-Enabled <Nullable`1>] [-Solver <String>] [-StabilizationEnabled <Nullable`1>] [-Stabilizationiterations <Nullable`1>] [-StabilizationupdateInterval <Nullable`1>] [-StabilizationonlyDynamicEdges <Nullable`1>] [-Stabilizationfit <Nullable`1>] [-MaxVelocity <Nullable`1>] [-MinVelocity <Nullable`1>] [-Timestep <Nullable`1>] [-AdaptiveTimestep <Nullable`1>] [-ForceAtlas2BasedTheta <Nullable`1>] [-ForceAtlas2BasedGravitationalConstant <Nullable`1>] [-ForceAtlas2BasedCentralGravity <Nullable`1>] [-ForceAtlas2BasedSpringLength <Nullable`1>] [-ForceAtlas2BasedSpringConstant <Nullable`1>] [-ForceAtlas2BasedDamping <Nullable`1>] [-ForceAtlas2BasedAvoidOverlap <Nullable`1>] [-WindX <Nullable`1>] [-WindY <Nullable`1>] [<CommonParameters>]
```
```PowerShell
New-DiagramOptionsPhysics [-Enabled <Nullable`1>] [-Solver <String>] [-StabilizationEnabled <Nullable`1>] [-Stabilizationiterations <Nullable`1>] [-StabilizationupdateInterval <Nullable`1>] [-StabilizationonlyDynamicEdges <Nullable`1>] [-Stabilizationfit <Nullable`1>] [-MaxVelocity <Nullable`1>] [-MinVelocity <Nullable`1>] [-Timestep <Nullable`1>] [-AdaptiveTimestep <Nullable`1>] [-RepulsionNodeDistance <Nullable`1>] [-RepulsionCentralGravity <Nullable`1>] [-RepulsionSpringLength <Nullable`1>] [-RepulsionSpringConstant <Nullable`1>] [-RepulsionDamping <Nullable`1>] [-WindX <Nullable`1>] [-WindY <Nullable`1>] [<CommonParameters>]
```
```PowerShell
New-DiagramOptionsPhysics [-Enabled <Nullable`1>] [-Solver <String>] [-StabilizationEnabled <Nullable`1>] [-Stabilizationiterations <Nullable`1>] [-StabilizationupdateInterval <Nullable`1>] [-StabilizationonlyDynamicEdges <Nullable`1>] [-Stabilizationfit <Nullable`1>] [-MaxVelocity <Nullable`1>] [-MinVelocity <Nullable`1>] [-Timestep <Nullable`1>] [-AdaptiveTimestep <Nullable`1>] [-HierarchicalRepulsionNodeDistance <Nullable`1>] [-HierarchicalRepulsionCentralGravity <Nullable`1>] [-HierarchicalRepulsionSpringLength <Nullable`1>] [-HierarchicalRepulsionSpringConstant <Nullable`1>] [-HierarchicalRepulsionDamping <Nullable`1>] [-HierarchicalRepulsionAvoidOverlap <Nullable`1>] [-WindX <Nullable`1>] [-WindY <Nullable`1>] [<CommonParameters>]
```
