Split-Array
-----------

### Synopsis
Split an array into multiple arrays of a specified size or by a specified number of elements

---

### Description

Split an array into multiple arrays of a specified size or by a specified number of elements

---

### Examples
> EXAMPLE 1

```PowerShell
This splits array into multiple arrays of 3
Example below wil return 1,2,3  + 4,5,6 + 7,8,9
Split-array -Objects @(1,2,3,4,5,6,7,8,9,10) -Parts 3
```
> EXAMPLE 2

```PowerShell
This splits array into 3 parts regardless of amount of elements
Split-array -Objects @(1,2,3,4,5,6,7,8,9,10) -Size 3
```

---

### Parameters
#### **Objects**
Lists of objects you would like to split into multiple arrays based on their size or number of parts to split into.

|Type     |Required|Position|PipelineInput|Aliases         |
|---------|--------|--------|-------------|----------------|
|`[Array]`|false   |1       |false        |InArray<br/>List|

#### **Parts**
Parameter description

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **Size**
Parameter description

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

---

### Syntax
```PowerShell
Split-Array [[-Objects] <Array>] [[-Parts] <Int32>] [[-Size] <Int32>] [<CommonParameters>]
```
