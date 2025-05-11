Get-WebInput
------------

### Synopsis
Get the Web Request parameters for a PowerShell command

---

### Description

Get the Web Request parameters for a PowerShell command.  

Script Blocks parameters will automatically be run, and text values will be converted
to their native types.

---

### Related Links
* [Request-CommandInput](Request-CommandInput)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-WebInput -CommandMetaData (Get-Command Get-Command) -DenyParameter ArgumentList
```

---

### Parameters
#### **CommandMetaData**
The metadata of the command that is being wrapped

|Type               |Required|Position|PipelineInput |
|-------------------|--------|--------|--------------|
|`[CommandMetadata]`|true    |1       |true (ByValue)|

#### **ParameterSet**
The parameter set within the command

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **AllowedParameter**
Explicitly allowed parameters (by default, all are allowed unless they are explictly denied)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **DenyParameter**
Explicitly denied parameters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **ParameterAlias**
Any aliases for parameter names.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |5       |false        |

#### **Control**
A UI element containing that will contain all of the values.  If this option is used, the module ShowUI should also be loaded.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

---

### Outputs
* [Collections.Hashtable](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Hashtable)

---

### Syntax
```PowerShell
Get-WebInput [-CommandMetaData] <CommandMetadata> [[-ParameterSet] <String>] [[-AllowedParameter] <String[]>] [[-DenyParameter] <String[]>] [[-ParameterAlias] <Hashtable>] [[-Control] <Object>] [<CommonParameters>]
```
