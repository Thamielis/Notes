Reduce-Object
-------------

### Synopsis
Reduces a pipeline with the given reducer function

---

### Description

---

### Parameters
#### **Reducer**
The function applied to the accumulator and each element of the input

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |1       |false        |

#### **Object**
The objects to merge

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[Object[]]`|true    |2       |true (ByValue)|

#### **ParamStyle**

Valid Values:

* Implicit
* Explicit
* Infer

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[ParamStyle]`|false   |3       |false        |

#### **Direction**

Valid Values:

* Left
* Right

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Direction]`|false   |4       |false        |

---

### Outputs
* The accumulated value

---

### Notes
Reduce is an unapproved Verb, but none of the approved verbs accurately describe what we're doing,
so we are conforming to Verb-Noun convention like other *-Object cmdlets instead

---

### Syntax
```PowerShell
Reduce-Object [-Reducer] <ScriptBlock> [-Object] <Object[]> [[-ParamStyle] {Implicit | Explicit | Infer}] [[-Direction] {Left | Right}] [<CommonParameters>]
```
