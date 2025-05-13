ConvertTo-OpenAIFunctionSpecDataType
------------------------------------

### Synopsis
Converts a .NET data type to an OpenAI Function Spec data type.

---

### Description

This function takes a .NET data type as input and returns the corresponding OpenAI Function Spec data type.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertTo-OpenAIFunctionSpecDataType -targetType 'int32'
Returns 'number'.
```
> EXAMPLE 2

```PowerShell
ConvertTo-OpenAIFunctionSpecDataType -targetType 'switchparameter'
Returns 'boolean'.
```

---

### Parameters
#### **targetType**
The .NET data type to convert.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
ConvertTo-OpenAIFunctionSpecDataType [[-targetType] <Object>] [<CommonParameters>]
```
