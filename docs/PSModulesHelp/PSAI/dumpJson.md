dumpJson
--------

### Synopsis
Converts an object to JSON format.

---

### Description

The `dumpJson` function converts an object to JSON format using the `ConvertTo-Json` cmdlet.

---

### Examples
> EXAMPLE 1

```PowerShell
$obj = @{
    Name = "John Doe"
    Age = 30
    Email = "johndoe@example.com"
}
dumpJson $obj
This example converts a hashtable object to JSON format.
```

---

### Parameters
#### **obj**
Specifies the object to be converted to JSON format.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

#### **Depth**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Compress**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
System.Object

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
dumpJson [[-obj] <Object>] [[-Depth] <Object>] [-Compress] [<CommonParameters>]
```
