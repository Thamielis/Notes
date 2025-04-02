Select-Properties
-----------------

### Synopsis
Allows for easy selecting property names from one or multiple objects

---

### Description

Allows for easy selecting property names from one or multiple objects. This is especially useful with using AllProperties parameter where we want to make sure to get all properties from all objects.

---

### Examples
> EXAMPLE 1

```PowerShell
$Object1 = [PSCustomobject] @{
    Name1 = '1'
    Name2 = '3'
    Name3 = '5'
}
$Object2 = [PSCustomobject] @{
    Name4 = '2'
    Name5 = '6'
    Name6 = '7'
}
Select-Properties -Objects $Object1, $Object2 -AllProperties

#OR:

$Object1, $Object2 | Select-Properties -AllProperties -ExcludeProperty Name6 -Property Name3
```
> EXAMPLE 2

```PowerShell
$Object3 = [Ordered] @{
    Name1 = '1'
    Name2 = '3'
    Name3 = '5'
}
$Object4 = [Ordered] @{
    Name4 = '2'
    Name5 = '6'
    Name6 = '7'
}
Select-Properties -Objects $Object3, $Object4 -AllProperties

$Object3, $Object4 | Select-Properties -AllProperties
```

---

### Parameters
#### **Objects**
One or more objects

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[Array]`|false   |1       |true (ByValue, ByPropertyName)|

#### **Property**
Properties to include

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ExcludeProperty**
Properties to exclude

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **AllProperties**
All unique properties from all objects

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PropertyNameReplacement**
Default property name when object has no properties

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Select-Properties [[-Objects] <Array>] [-Property <String[]>] [-ExcludeProperty <String[]>] [-AllProperties] [-PropertyNameReplacement <String>] [<CommonParameters>]
```
