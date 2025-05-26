Merge-Object
------------

### Synopsis
Merges all the input objects using the specified conflict resolution strategy

---

### Description

---

### Parameters
#### **Object**
The objects to merge

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[Object[]]`|true    |named   |true (ByValue)|

#### **Strategy**
The conflict resolution strategy
Valid Values:

* Add
* Override
* Fail

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[MergeStrategy]`|true    |named   |false        |

#### **Resolver**
Resolves merge conflicts between two objects

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |named   |false        |

---

### Outputs
* The merged value

---

### Syntax
```PowerShell
Merge-Object -Object <Object[]> -Resolver <ScriptBlock> [<CommonParameters>]
```
```PowerShell
Merge-Object -Object <Object[]> -Strategy {Add | Override | Fail} [<CommonParameters>]
```
