Copy-Dictionary
---------------

### Synopsis
Copies dictionary/hashtable

---

### Description

Copies dictionary uusing PS Serializer. Replaces usage of BinnaryFormatter due to no support in PS 7.4

---

### Examples
> EXAMPLE 1

```PowerShell
$Test = [ordered] @{
    Test  = 'Test'
    Test1 = @{
        Test2 = 'Test2'
        Test3 = @{
            Test4 = 'Test4'
        }
    }
    Test2 = @(
        "1", "2", "3"
    )
    Test3 = [PSCustomObject] @{
        Test4 = 'Test4'
        Test5 = 'Test5'
    }
}
$New1 = Copy-Dictionary -Dictionary $Test
$New1
```

---

### Parameters
#### **Dictionary**
Dictionary to copy

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |1       |false        |

---

### Syntax
```PowerShell
Copy-Dictionary [[-Dictionary] <IDictionary>] [<CommonParameters>]
```
