ConvertTo-OpenAIFunctionSpec
----------------------------

### Synopsis
Converts a PowerShell function to an OpenAI function specification.

---

### Description

The ConvertTo-OpenAIFunctionSpec function takes a PowerShell function as input and returns an OpenAI function specification. The function specification includes the function name, description, and parameter information.

---

### Examples
> EXAMPLE 1

```PowerShell
$functionCode = Get-Content -Path "C:\MyFunction.ps1" -Raw
PS C:\> ConvertTo-OpenAIFunctionSpec -targetCode $functionCode -Compress
This example reads the contents of a PowerShell function file, converts the function to an OpenAI function specification, and returns the specification as compressed JSON.
```

---

### Parameters
#### **targetCode**
The PowerShell function to convert to an OpenAI function specification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Strict**
When Structured Outputs are enabled, model outputs will match the supplied tool definition.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Compress**
Indicates whether to compress the output JSON.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Raw**
Indicates whether to return the raw function specification object instead of JSON.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
ConvertTo-OpenAIFunctionSpec [[-targetCode] <Object>] [-Strict] [-Compress] [-Raw] [<CommonParameters>]
```
