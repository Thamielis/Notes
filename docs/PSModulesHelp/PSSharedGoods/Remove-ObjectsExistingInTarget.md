Remove-ObjectsExistingInTarget
------------------------------

### Synopsis
Removes objects from the source list that exist in the target list based on specified properties.

---

### Description

This function compares two lists of objects and removes objects from the source list that have matching properties in the target list. It returns either the objects that do not exist in the target list or only the objects that exist in the target list based on the specified properties.

---

### Examples
> EXAMPLE 1

```PowerShell
$sourceList = @(
    [PSCustomObject]@{Id = 1; Name = "A"},
    [PSCustomObject]@{Id = 2; Name = "B"},
    [PSCustomObject]@{Id = 3; Name = "C"}
)
$targetList = @(
    [PSCustomObject]@{Id = 2; Name = "B"},
    [PSCustomObject]@{Id = 3; Name = "C"}
)

Remove-ObjectsExistingInTarget -ObjectSource $sourceList -ObjectTarget $targetList -ComparePropertySource "Id" -ComparePropertyTarget "Id"
# Output: Id Name
#        -- ----
#         1 A
```
> EXAMPLE 2

```PowerShell
$sourceList = @(
    [PSCustomObject]@{Id = 1; Name = "A"},
    [PSCustomObject]@{Id = 2; Name = "B"},
    [PSCustomObject]@{Id = 3; Name = "C"}
)
$targetList = @(
    [PSCustomObject]@{Id = 2; Name = "B"},
    [PSCustomObject]@{Id = 3; Name = "C"}
)

Remove-ObjectsExistingInTarget -ObjectSource $sourceList -ObjectTarget $targetList -ComparePropertySource "Id" -ComparePropertyTarget "Id" -Reverse
# Output: Id Name
#        -- ----
#         2 B
#         3 C
```

---

### Parameters
#### **ObjectSource**
The list of objects to compare against the target list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **ObjectTarget**
The list of objects to compare with.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **ComparePropertySource**
The property in the source objects to compare.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **ComparePropertyTarget**
The property in the target objects to compare.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Reverse**
Switch to return only the objects that exist in the target list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Remove-ObjectsExistingInTarget [[-ObjectSource] <Object>] [[-ObjectTarget] <Object>] [[-ComparePropertySource] <String>] [[-ComparePropertyTarget] <String>] [-Reverse] [<CommonParameters>]
```
