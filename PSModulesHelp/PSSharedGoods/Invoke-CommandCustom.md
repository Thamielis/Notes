Invoke-CommandCustom
--------------------

### Synopsis
Invokes a script block with optional parameters and arguments.

---

### Description

The Invoke-CommandCustom function executes a script block with the ability to pass parameters and arguments. It provides options to return verbose output, errors, and warnings.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-CommandCustom -ScriptBlock { Get-Process } -ReturnVerbose
Description:
Invokes the Get-Process cmdlet and returns verbose output.
```
> EXAMPLE 2

```PowerShell
Invoke-CommandCustom -ScriptBlock { Get-Service } -Parameter @{Name="Spooler"} -ReturnError
Description:
Invokes the Get-Service cmdlet with the "Spooler" parameter and returns any errors encountered.
```

---

### Parameters
#### **ScriptBlock**
Specifies the script block to execute.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Parameter**
Specifies a dictionary of parameters to pass to the script block.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |2       |false        |

#### **Argument**
Specifies an array of arguments to pass to the script block.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |3       |false        |

#### **ReturnVerbose**
Indicates whether to return verbose output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ReturnError**
Indicates whether to return errors.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ReturnWarning**
Indicates whether to return warnings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AddParameter**
Indicates whether to add parameters to the script block.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Invoke-CommandCustom [[-ScriptBlock] <ScriptBlock>] [[-Parameter] <IDictionary>] [[-Argument] <Array>] [-ReturnVerbose] [-ReturnError] [-ReturnWarning] [-AddParameter] [<CommonParameters>]
```
