Compare-MultipleObjects
-----------------------

### Synopsis
Compares multiple objects based on specified properties and displays differences.

---

### Description

The Compare-MultipleObjects function compares multiple objects based on specified properties and displays differences in a structured format. It provides options to customize the comparison output and handle various scenarios.

---

### Examples
> EXAMPLE 1

```PowerShell
Compare-MultipleObjects -Objects $objects -Property 'Name', 'Age' -FormatOutput
Description:
Compares the objects in the $objects array based on the 'Name' and 'Age' properties and formats the output for better readability.
```
> EXAMPLE 2

```PowerShell
Compare-MultipleObjects -Objects $objects -Property 'Status' -FormatDifferences
Description:
Compares the objects in the $objects array based on the 'Status' property and highlights the differences in the output.
```

---

### Parameters
#### **Objects**
Specifies the list of objects to compare.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[IList]`|false   |1       |false        |

#### **ObjectsName**
Specifies an array of names for the objects being compared.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |2       |false        |

#### **CompareSorted**
Indicates whether to compare objects in a sorted manner.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FormatOutput**
Indicates whether to format the output for better readability.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FormatDifferences**
Indicates whether to format and highlight the differences in the output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Summary**
Indicates whether to display a summary of the comparison results.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Splitter**
Specifies the delimiter to use when joining property values.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Property**
Specifies the properties to compare across objects.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **ExcludeProperty**
Specifies properties to exclude from the comparison.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **AllProperties**
Indicates whether to compare all properties of the objects.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipProperties**
Indicates whether to skip comparing properties.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **First**
Specifies the number of first objects to consider for comparison.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |

#### **Last**
Specifies the number of last objects to consider for comparison.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |7       |false        |

#### **Replace**
Specifies replacement values for specific properties.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |8       |false        |

#### **FlattenObject**
Indicates whether to flatten the object structure for comparison.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Compare-MultipleObjects [[-Objects] <IList>] [[-ObjectsName] <Array>] [-CompareSorted] [-FormatOutput] [-FormatDifferences] [-Summary] [[-Splitter] <String>] [[-Property] <String[]>] [[-ExcludeProperty] <String[]>] [-AllProperties] [-SkipProperties] [[-First] <Int32>] [[-Last] <Int32>] [[-Replace] <Array>] [-FlattenObject] [<CommonParameters>]
```
