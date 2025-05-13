Register-Tool
-------------

### Synopsis
Registers a tool by name.

---

### Description

The Register-Tool function is used to register a tool by name. It retrieves the command specification for the specified function and registers it as a tool.

---

### Examples
> EXAMPLE 1

```PowerShell
Register-Tool -FunctionName "MyFunction" -Strict
Registers the function named "MyFunction" as a tool and enforces strict mode.
```
> EXAMPLE 2

```PowerShell
Register-Tool -FunctionName Get-ChildIten, Get-Content
Registers the cmdlets Get-ChildItem and Get-Content as tools. rOutput is an array of tool specifications.
```

---

### Parameters
#### **FunctionName**
The name of the function to register as a tool.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **ParameterSet**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Strict**
Specifies strict mode for the server side OpenAPI.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Register-Tool [-FunctionName] <String[]> [[-ParameterSet] <Object>] [-Strict] [<CommonParameters>]
```
