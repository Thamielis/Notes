Merge-Objects
-------------

### Synopsis
Merges two objects into a single object.

---

### Description

This function merges two objects into a single object by combining their properties. If there are duplicate properties, the values from Object2 will overwrite the values from Object1.

---

### Examples
> EXAMPLE 1

$Object1 = [pscustomobject] @{
    'Name' = 'John Doe'
    'Age'  = 30
}
$Object2 = [pscustomobject] @{
    'Age'  = 31
    'City' = 'New York'
}

Merge-Objects -Object1 $Object1 -Object2 $Object2

Description
-----------
Merges $Object1 and $Object2 into a single object. The resulting object will have properties 'Name', 'Age', and 'City' with values 'John Doe', 31, and 'New York' respectively.

---

### Parameters
#### **Object1**
The first object to be merged.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Object2**
The second object to be merged.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Merge-Objects [[-Object1] <Object>] [[-Object2] <Object>] [<CommonParameters>]
```
