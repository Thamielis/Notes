ConvertTo-OrderedDictionary
---------------------------

### Synopsis
Converts a hashtable into an ordered dictionary.

---

### Description

This function takes a hashtable as input and converts it into an ordered dictionary. The ordered dictionary maintains the order of elements as they were added to the hashtable.

---

### Examples
> EXAMPLE 1

```PowerShell
$HashTable = @{
    "Key3" = "Value3"
    "Key1" = "Value1"
    "Key2" = "Value2"
}
ConvertTo-OrderedDictionary -HashTable $HashTable
# Outputs an ordered dictionary where the keys are in the order they were added to the hashtable.
```

---

### Parameters
#### **HashTable**
Specifies the hashtable to be converted into an ordered dictionary.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |1       |true (ByValue)|

---

### Syntax
```PowerShell
ConvertTo-OrderedDictionary [-HashTable] <Object> [<CommonParameters>]
```
