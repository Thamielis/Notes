Get-PSMDConstructor
-------------------

### Synopsis
Returns information on the available constructors of a type.

---

### Description

Returns information on the available constructors of a type.
Accepts any object as pipeline input:
- if it's a type, it will retrieve its constructors.
- If it's not a type, it will retrieve the constructor from the type of object passed

Will not duplicate constructors if multiple objects of the same type are passed.
In order to retrieve the constructor of an array, wrap it into another array.

---

### Examples
> EXAMPLE 1

Get-ChildItem | Get-PSMDConstructor
Scans all objects in the given path, than tries to retrieve the constructor for each kind of object returned
(generally, this will return the constructors for file and folder objects)
> EXAMPLE 2

```PowerShell
Get-PSMDConstructor $result
Returns the constructors of objects stored in $result
```

---

### Parameters
#### **InputObject**
The object the constructor of which should be retrieved.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

#### **NonPublic**
Show non-public constructors instead.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-PSMDConstructor [[-InputObject] <Object>] [-NonPublic] [<CommonParameters>]
```
