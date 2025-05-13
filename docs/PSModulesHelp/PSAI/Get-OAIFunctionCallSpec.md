Get-OAIFunctionCallSpec
-----------------------

### Synopsis
Generates a specification for a given PowerShell cmdlet.

---

### Description

The Get-OAIFunctionCallSpec function generates a specification for a specified PowerShell cmdlet. 
It retrieves the cmdlet's parameters and their details, and optionally returns the specification in hash or JSON format.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIFunctionCallSpec -CmdletName Get-Process -ReturnJson
This command generates a JSON specification for the Get-Process cmdlet.
```

---

### Parameters
#### **CmdletName**
The name of the cmdlet for which to generate the specification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Strict**
If specified, the generated specification will not allow additional properties.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ParameterSet**
The ParameterSet to use. Defaults to 0. Iterate according to documentation.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **ReturnJson**
If specified, the function returns the specification in JSON format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ClearRequired**
If specified, the function will not mark mandatory parameters as required in the specification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-OAIFunctionCallSpec [-CmdletName] <String> [-Strict] [[-ParameterSet] <Int32>] [-ReturnJson] [-ClearRequired] [<CommonParameters>]
```
