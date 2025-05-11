Compare-ObjectsAdvanced
-----------------------

### Synopsis
Compares two sets of objects based on a specified property.

---

### Description

This function compares two sets of objects based on a specified property. It can be used to identify differences between the objects and perform actions accordingly.

---

### Examples
> EXAMPLE 1

```PowerShell
Compare-ObjectsAdvanced -Object1 $ObjectSet1 -Object2 $ObjectSet2 -CommonProperty 'Name' -Object1Property 'Size' -Object2Property 'Size'
Description:
Compares two sets of objects based on the 'Name' property and the 'Size' property from each set.
```
> EXAMPLE 2

```PowerShell
Compare-ObjectsAdvanced -Object1 $Users -Object2 $Groups -CommonProperty 'DistinguishedName' -AddObjectArrayName @('Type', 'Status') -AddObjectArray @('User', 'Active') -Side 'Right'
Description:
Compares two sets of objects based on the 'DistinguishedName' property, adding 'Type' and 'Status' properties to Object1, and compares from the 'Right' side.
```

---

### Parameters
#### **Object1**
The first set of objects to compare.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Object2**
The second set of objects to compare.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **CommonProperty**
Specifies the common property to compare between the objects. Default is 'DistinguishedName'.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|false   |3       |false        |Property|

#### **AddObjectArrayName**
An array of names for additional properties to add to Object1.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **AddObjectArray**
An array of values for additional properties to add to Object1.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |5       |false        |

#### **Object1Property**
Specifies a property from Object1 to compare.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Object2Property**
Specifies a property from Object2 to compare.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **ObjectPropertySubstitute**
Specifies a substitute property name for comparison. Default is 'SpecialValueToCompare'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **RemoveSideIndicator**
Indicates whether to remove side indicators in the comparison results.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **KeepTemporaryProperty**
Indicates whether to keep temporary properties added during comparison.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Side**
Specifies which side to compare ('Left' or 'Right'). Default is 'Left'.
Valid Values:

* Left
* Right

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

---

### Syntax
```PowerShell
Compare-ObjectsAdvanced [[-Object1] <Object>] [[-Object2] <Object>] [[-CommonProperty] <String>] [[-AddObjectArrayName] <String[]>] [[-AddObjectArray] <Object[]>] [[-Object1Property] <String>] [[-Object2Property] <String>] [[-ObjectPropertySubstitute] <String>] [-RemoveSideIndicator] [-KeepTemporaryProperty] [[-Side] <String>] [<CommonParameters>]
```
