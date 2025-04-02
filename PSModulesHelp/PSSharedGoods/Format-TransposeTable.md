Format-TransposeTable
---------------------

### Synopsis
Transposes (pivot) a table of objects

---

### Description

Transposes (pivot) a table of objects

---

### Examples
> EXAMPLE 1

```PowerShell
$T = [PSCustomObject] @{
    Name   = "Server 1"
    Test   = 1
    Test2  = 7
    Ole    = 'bole'
    Trolle = 'A'
    Alle   = 'sd'
}
$T1 = [PSCustomObject] @{
    Name   = "Server 2"
    Test   = 2
    Test2  = 3
    Ole    = '1bole'
    Trolle = 'A'
    Alle   = 'sd'
}
Format-TransposeTable -Object @($T, $T1) -Property "Name" | Format-Table
```
> EXAMPLE 2

```PowerShell
$T2 = [ordered] @{
    Name   = "Server 1"
    Test   = 1
    Test2  = 7
    Ole    = 'bole'
    Trolle = 'A'
    Alle   = 'sd'
}
$T3 = [ordered] @{
    Name   = "Server 2"
    Test   = 2
    Test2  = 3
    Ole    = '1bole'
    Trolle = 'A'
    Alle   = 'sd'
}
$Test = Format-TransposeTable -Object @($T2, $T3)
$Test | Format-Table
```

---

### Parameters
#### **AllObjects**
List of objects to transpose

|Type     |Required|Position|PipelineInput                 |Aliases|
|---------|--------|--------|------------------------------|-------|
|`[Array]`|false   |1       |true (ByValue, ByPropertyName)|Object |

#### **Sort**
Legacy parameter to sort the output
Valid Values:

* ASC
* DESC
* NONE

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Legacy**
Allows to transpose the table in a legacy way

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Property**
Provides a property to name the column based on the property value

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Name**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Format-TransposeTable [[-AllObjects] <Array>] [-Property <String>] [-Name <String>] [<CommonParameters>]
```
```PowerShell
Format-TransposeTable [[-AllObjects] <Array>] [-Sort <String>] [-Legacy] [<CommonParameters>]
```
