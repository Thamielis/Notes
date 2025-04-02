ConvertFrom-OperationType
-------------------------

### Synopsis
Converts operation type codes to human-readable descriptions.

---

### Description

This function takes an operation type code and returns the corresponding human-readable description.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertFrom-OperationType -OperationType '%%14674'
Output: 'Value Added'
```
> EXAMPLE 2

```PowerShell
ConvertFrom-OperationType -OperationType '%%14675'
Output: 'Value Deleted'
```
> EXAMPLE 3

```PowerShell
ConvertFrom-OperationType -OperationType '%%14676'
Output: 'Unknown'
```

---

### Parameters
#### **OperationType**
The operation type code to be converted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
ConvertFrom-OperationType [[-OperationType] <String>] [<CommonParameters>]
```
