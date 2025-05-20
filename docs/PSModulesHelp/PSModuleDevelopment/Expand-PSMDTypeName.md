Expand-PSMDTypeName
-------------------

### Synopsis
Returns the full name of the input object's type, as well as the name of the types it inherits from, recursively until System.Object.

---

### Description

Returns the full name of the input object's type, as well as the name of the types it inherits from, recursively until System.Object.

---

### Examples
> EXAMPLE 1

Expand-PSMDTypeName -InputObject "test"
Returns the typenames for the string test ("System.String" and "System.Object")

---

### Parameters
#### **InputObject**
The object whose typename to expand.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

---

### Syntax
```PowerShell
Expand-PSMDTypeName [[-InputObject] <Object>] [<CommonParameters>]
```
