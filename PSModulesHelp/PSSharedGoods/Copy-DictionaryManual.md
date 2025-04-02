Copy-DictionaryManual
---------------------

### Synopsis
Copies a dictionary recursively, handling nested dictionaries and lists.

---

### Description

This function copies a dictionary recursively, handling nested dictionaries and lists. It creates a deep copy of the input dictionary, ensuring that modifications to the copied dictionary do not affect the original dictionary.

---

### Examples
> EXAMPLE 1

```PowerShell
$originalDictionary = @{
    'Key1' = 'Value1'
    'Key2' = @{
        'NestedKey1' = 'NestedValue1'
    }
}
$copiedDictionary = Copy-DictionaryManual -Dictionary $originalDictionary
This example demonstrates how to copy a dictionary with nested values.
```

---

### Parameters
#### **Dictionary**
The dictionary to be copied.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |1       |false        |

---

### Syntax
```PowerShell
Copy-DictionaryManual [[-Dictionary] <IDictionary>] [<CommonParameters>]
```
