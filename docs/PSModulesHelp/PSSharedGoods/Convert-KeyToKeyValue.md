Convert-KeyToKeyValue
---------------------

### Synopsis
Converts keys of an object to key-value pairs.

---

### Description

This function takes an object and converts its keys to key-value pairs, where the key is the original key concatenated with its corresponding value.

---

### Examples
> EXAMPLE 1

```PowerShell
$Object = @{
    Key1 = 'Value1'
    Key2 = 'Value2'
}
Convert-KeyToKeyValue -Object $Object
# Returns a new hash table with keys as 'Key1 (Value1)' and 'Key2 (Value2)'.
```

---

### Parameters
#### **Object**
Specifies the object whose keys are to be converted to key-value pairs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Convert-KeyToKeyValue [[-Object] <Object>] [<CommonParameters>]
```
