Compare-ObjectProperties
------------------------

### Synopsis
Compares the properties of two objects and returns the differences.

---

### Description

This function compares the properties of two objects and returns the differences found between them. It compares each property of the reference object with the corresponding property of the difference object.

---

### Examples
> EXAMPLE 1

```PowerShell
$ad1 = Get-ADUser amelia.mitchell -Properties *
$ad2 = Get-ADUser carolyn.quinn -Properties *
Compare-ObjectProperties $ad1 $ad2
```

---

### Parameters
#### **ReferenceObject**
The reference object to compare properties against.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |1       |false        |

#### **DifferenceObject**
The object whose properties are compared against the reference object.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |2       |false        |

#### **CaseSensitive**
Indicates whether the comparison should be case-sensitive. Default is false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Compare-ObjectProperties [[-ReferenceObject] <PSObject>] [[-DifferenceObject] <PSObject>] [-CaseSensitive] [<CommonParameters>]
```
