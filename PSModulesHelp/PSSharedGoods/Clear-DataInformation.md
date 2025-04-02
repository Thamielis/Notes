Clear-DataInformation
---------------------

### Synopsis
Cleans up data information by removing empty values and specified keys.

---

### Description

The Clear-DataInformation function removes empty values and specified keys from the provided data. It iterates through the data structure and removes keys with null values or keys not in the specified types required array. It also removes empty domains and the 'FoundDomains' key if it becomes empty.

---

### Examples
> EXAMPLE 1

```PowerShell
$data = @{
    FoundDomains = @{
        Domain1 = @{
            Key1 = 'Value1'
            Key2 = $null
        }
        Domain2 = @{
            Key1 = 'Value1'
            Key2 = 'Value2'
        }
    }
}
Clear-DataInformation -Data $data -TypesRequired @('Key1') -DontRemoveSupportData
This example removes keys with null values from the 'FoundDomains' data structure, keeping only keys of type 'Key1'.
```

---

### Parameters
#### **Data**
The data structure containing information to be cleaned.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |1       |false        |

#### **TypesRequired**
An array of types that are required to be kept in the data structure.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |2       |false        |

#### **DontRemoveSupportData**
A switch parameter to indicate whether to skip removing keys not in TypesRequired.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DontRemoveEmpty**
A switch parameter to indicate whether to skip removing keys with null values.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Clear-DataInformation [[-Data] <IDictionary>] [[-TypesRequired] <Array>] [-DontRemoveSupportData] [-DontRemoveEmpty] [<CommonParameters>]
```
