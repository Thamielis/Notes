ConvertTo-FlatHashtable
-----------------------

### Synopsis
Converts nested hashtable into flat hashtable using delimiter

---

### Description

Converts nested hashtable into flat hashtable using delimiter

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertTo-FlatHashTable -InputObject ([ordered] @{
    RootEntry       = 'OK1'
    Parent          = @{
        Child1 = 'OK2'
        Child2 = 'Ok3'
    }
    ParentDifferent = @{
        Child7 = 'NotOk'
        Child8 = @{
            Child10 = 'OKLetsSee'
            Child11 = @{
                SpecialCase = 'Oooop'
            }
        }
    }
}) | Format-Table *
```

---

### Parameters
#### **InputObject**
Ordered Dictionary or Hashtable

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |1       |false        |

#### **Delimiter**
Delimiter for key name when merging nested hashtables. By default colon is used

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Name**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
ConvertTo-FlatHashtable [[-InputObject] <IDictionary>] [[-Delimiter] <String>] [[-Name] <String>] [<CommonParameters>]
```
