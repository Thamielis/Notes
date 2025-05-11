New-GenericObject
-----------------

### Synopsis
Creates an object of a generic type. If using PowerShell version three,
use this syntax:

PS > $r = New-Object "System.Collections.Generic.Dictionary[String, Int32]"

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
New-GenericObject System.Collections.ObjectModel.Collection System.Int32
Creates a simple generic collection
```
> EXAMPLE 2

```PowerShell
New-GenericObject System.Collections.Generic.Dictionary `
      System.String,System.Int32
Creates a generic dictionary with two types
```
> EXAMPLE 3

```PowerShell
$secondType = New-GenericObject System.Collections.Generic.List Int32
PS > New-GenericObject System.Collections.Generic.Dictionary `
      System.String,$secondType.GetType()
Creates a generic list as the second type to a generic dictionary
```
> EXAMPLE 4

```PowerShell
New-GenericObject System.Collections.Generic.LinkedListNode `
      System.String "Hi"
Creates a generic type with a non-default constructor
```

---

### Parameters
#### **TypeName**
The generic type to create

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **TypeParameters**
The types that should be applied to the generic object

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |2       |false        |

#### **ConstructorParameters**
Arguments to be passed to the constructor

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |3       |false        |

---

### Syntax
```PowerShell
New-GenericObject [-TypeName] <String> [-TypeParameters] <String[]> [[-ConstructorParameters] <Object[]>] [<CommonParameters>]
```
