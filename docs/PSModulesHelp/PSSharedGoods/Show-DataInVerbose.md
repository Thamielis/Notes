Show-DataInVerbose
------------------

### Synopsis
Displays the properties of an object in a verbose manner.

---

### Description

This function takes an object as input and displays each property of the object in a verbose format.

---

### Examples
> EXAMPLE 1

```PowerShell
$data = [PSCustomObject]@{
    Name = "John Doe"
    Age = 30
    City = "New York"
}
Show-DataInVerbose -Object $data
Description:
Displays the properties of the $data object in a verbose manner.
```

---

### Parameters
#### **Object**
Specifies the object whose properties will be displayed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Show-DataInVerbose [[-Object] <Object>] [<CommonParameters>]
```
