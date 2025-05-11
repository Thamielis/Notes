New-TableReplace
----------------

### Synopsis
Replaces values in a specified field of a table.

---

### Description

This function replaces values in a specified field of a table with the provided replacements.

---

### Examples
> EXAMPLE 1

```PowerShell
New-TableReplace -FieldName "Status" -Replacements @("Active", "Inactive")
Description:
Replaces values in the "Status" field with "Active" or "Inactive".
```
> EXAMPLE 2

```PowerShell
New-TableReplace -FieldName "Priority" -Replacements @("High", "Medium", "Low")
Description:
Replaces values in the "Priority" field with "High", "Medium", or "Low".
```

---

### Parameters
#### **FieldName**
The name of the field in the table where replacements will be made.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Replacements**
An array of strings containing the values to replace in the specified field.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

---

### Syntax
```PowerShell
New-TableReplace [[-FieldName] <String>] [[-Replacements] <String[]>] [<CommonParameters>]
```
