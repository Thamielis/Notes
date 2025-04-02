Remove-EmptyValue
-----------------

### Synopsis
Removes empty values from a hashtable recursively.

---

### Description

This function removes empty values from a given hashtable. It can be used to clean up a hashtable by removing keys with null, empty string, empty array, or empty dictionary values. The function supports recursive removal of empty values.

---

### Examples
> EXAMPLE 1

$hashtable = @{
    'Key1' = '';
    'Key2' = $null;
    'Key3' = @();
    'Key4' = @{}
}
Remove-EmptyValue -Hashtable $hashtable -Recursive
Description
-----------
This example removes empty values from the $hashtable recursively.

---

### Parameters
#### **Hashtable**
The hashtable from which empty values will be removed.

|Type           |Required|Position|PipelineInput|Aliases              |
|---------------|--------|--------|-------------|---------------------|
|`[IDictionary]`|true    |1       |false        |Splat<br/>IDictionary|

#### **ExcludeParameter**
An array of keys to exclude from the removal process.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Recursive**
Indicates whether to recursively remove empty values from nested hashtables.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Rerun**
Specifies the number of times to rerun the removal process recursively.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **DoNotRemoveNull**
If specified, null values will not be removed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DoNotRemoveEmpty**
If specified, empty string values will not be removed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DoNotRemoveEmptyArray**
If specified, empty array values will not be removed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DoNotRemoveEmptyDictionary**
If specified, empty dictionary values will not be removed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Remove-EmptyValue [-Hashtable] <IDictionary> [[-ExcludeParameter] <String[]>] [-Recursive] [[-Rerun] <Int32>] [-DoNotRemoveNull] [-DoNotRemoveEmpty] [-DoNotRemoveEmptyArray] [-DoNotRemoveEmptyDictionary] [<CommonParameters>]
```
