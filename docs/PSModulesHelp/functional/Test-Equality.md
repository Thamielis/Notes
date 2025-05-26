Test-Equality
-------------

### Synopsis
Returns true if all elements in the pipeline are equival

---

### Description

Compares each element in the pipeline to the first pipeline element using a
deep/recursive equality check of the properties and items

---

### Parameters
#### **Object**
The objects to compare for equality

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[Object[]]`|true    |1       |true (ByValue)|

---

### Outputs
* [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)

---

### Syntax
```PowerShell
Test-Equality [-Object] <Object[]> [<CommonParameters>]
```
