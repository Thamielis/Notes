Convert-TwoArraysIntoOne
------------------------

### Synopsis
Combines two arrays into a single array by pairing elements from each array.

---

### Description

This function takes two arrays as input and combines them into a single array by pairing elements from each array. It creates a new array where each element is a combination of an element from the first array and the corresponding element from the second array.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-TwoArraysIntoOne -Object @("A", "B", "C") -ObjectToAdd @(1, 2, 3)
# Combines the arrays ["A", "B", "C"] and [1, 2, 3] into a single array: ["A (1)", "B (2)", "C (3)"].
```
> EXAMPLE 2

```PowerShell
$Array1 = @("Apple", "Banana", "Cherry")
$Array2 = @(5, 10, 15)
Convert-TwoArraysIntoOne -Object $Array1 -ObjectToAdd $Array2
# Combines the arrays $Array1 and $Array2 into a single array where each element pairs an item from $Array1 with the corresponding item from $Array2.
```

---

### Parameters
#### **Object**
Specifies the first array containing elements to be combined.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **ObjectToAdd**
Specifies the second array containing elements to be paired with elements from the first array.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Convert-TwoArraysIntoOne [[-Object] <Object>] [[-ObjectToAdd] <Object>] [<CommonParameters>]
```
