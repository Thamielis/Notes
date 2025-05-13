Format-OAIFunctionCall
----------------------

### Synopsis
Formats the function call specification for the OAI (OpenAPI Initiative) generator.

---

### Description

The Format-OAIFunctionCall function takes a function call specification and formats it for use with the OAI generator. It supports different input types such as string, hashtable, FunctionInfo, and array.

---

### Examples
> EXAMPLE 1

```PowerShell
Format-OAIFunctionCall -FunctionSpec '{"name": "Get-User", "parameters": {"id": 123}}'
Formats the specified function call specification as a hashtable.
```
> EXAMPLE 2

```PowerShell
Format-OAIFunctionCall -FunctionSpec (Get-Command Get-User)
Formats the specified FunctionInfo object as a hashtable.
```
> EXAMPLE 3

```PowerShell
Format-OAIFunctionCall -FunctionSpec @('{"name": "Get-User", "parameters": {"id": 123}}', '{"name": "Set-User", "parameters": {"id": 456}}')
Formats each function call specification in the array as a hashtable.
```

---

### Parameters
#### **FunctionSpec**
Specifies the function call specification to be formatted. It can be a string, hashtable, FunctionInfo object, or an array of function call specifications.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Syntax
```PowerShell
Format-OAIFunctionCall [-FunctionSpec] <Object> [<CommonParameters>]
```
