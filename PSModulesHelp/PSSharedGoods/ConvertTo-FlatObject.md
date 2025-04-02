ConvertTo-FlatObject
--------------------

### Synopsis
Flattends a nested object into a single level object.

---

### Description

Flattends a nested object into a single level object.

---

### Examples
> EXAMPLE 1

```PowerShell
$Object3 = [PSCustomObject] @{
    "Name"    = "Przemyslaw Klys"
    "Age"     = "30"
    "Address" = @{
        "Street"  = "Kwiatowa"
        "City"    = "Warszawa"
"Country" = [ordered] @{
            "Name" = "Poland"
        }
        List      = @(
            [PSCustomObject] @{
                "Name" = "Adam Klys"
                "Age"  = "32"
            }
            [PSCustomObject] @{
                "Name" = "Justyna Klys"
                "Age"  = "33"
            }
            [PSCustomObject] @{
                "Name" = "Justyna Klys"
                "Age"  = 30
            }
            [PSCustomObject] @{
                "Name" = "Justyna Klys"
                "Age"  = $null
            }
        )
    }
    ListTest  = @(
        [PSCustomObject] @{
            "Name" = "Sława Klys"
            "Age"  = "33"
        }
    )
}

$Object3 | ConvertTo-FlatObject
```

---

### Parameters
#### **Objects**
The object (or objects) to be flatten.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[Object[]]`|false   |1       |true (ByValue)|

#### **Separator**
The separator used between the recursive property names

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Base**
The first index name of an embedded array:
* 1, arrays will be 1 based: <Parent>.1, <Parent>.2, <Parent>.3, …
* 0, arrays will be 0 based: <Parent>.0, <Parent>.1, <Parent>.2, …
* "", the first item in an array will be unnamed and than followed with 1: <Parent>, <Parent>.1, <Parent>.2, …
Valid Values:

* 
* 0
* 1

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Depth**
The maximal depth of flattening a recursive property. Any negative value will result in an unlimited depth and could cause a infinitive loop.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **ExcludeProperty**
The propertys to be excluded from the output.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **Path**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **OutputObject**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |7       |false        |

---

### Notes
Based on https://powersnippets.com/convertto-flatobject/

---

### Syntax
```PowerShell
ConvertTo-FlatObject [[-Objects] <Object[]>] [[-Separator] <String>] [[-Base] <Object>] [[-Depth] <Int32>] [[-ExcludeProperty] <String[]>] [[-Path] <String[]>] [[-OutputObject] <IDictionary>] [<CommonParameters>]
```
