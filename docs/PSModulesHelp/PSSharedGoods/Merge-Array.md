Merge-Array
-----------

### Synopsis
Merge-Array allows to merge two or more arrays together.

---

### Description

Merge-Array allows to merge two or more arrays together. It copies headers from each Array and merges them together allowing for fulll output. 
When used with Prescan parameter it actually is able to show headers from all arrays

---

### Examples
> EXAMPLE 1

```PowerShell
$Array1 = @(
    [PSCustomObject] @{ Name = 'Company1'; Count = 259  }
    [PSCustomObject] @{ Name = 'Company2'; Count = 300 }
)
$Array2 = @(
    [PSCustomObject] @{ Name = 'Company1'; Count = 25 }
    [PSCustomObject] @{ Name = 'Company2'; Count = 100 }
)
$Array3 = @(
    [PSCustomObject] @{ Name1 = 'Company1'; Count3 = 25 }
    [PSCustomObject] @{ Name1 = 'Company2'; Count3 = 100 }
    [PSCustomObject] @{ Name2 = 'Company2'; Count3 = 100 }
)
$Array1 | Format-Table -AutoSize
$Array2 | Format-Table -AutoSize
$Array3 | Format-Table -AutoSize

Merge-Array -Array $Array1, $Array2, $Array3 | Format-Table -AutoSize
Merge-Array -Array $Array1, $Array2, $Array3 -Prescan | Format-Table -AutoSize
```

---

### Parameters
#### **Array**
List of Arrays to process

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Array[]]`|false   |1       |false        |

#### **Prescan**
Scans each element of each array for headers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Merge-Array [[-Array] <Array[]>] [-Prescan] [<CommonParameters>]
```
