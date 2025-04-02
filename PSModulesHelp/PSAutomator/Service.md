Service
-------

### Synopsis

Service [-Name] <string> [[-ServiceData] <scriptblock>] [-Status <string>] [-Tag <string[]>] [-ConfigurationPath <string>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ConfigurationPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Name**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |0       |false        |

#### **ServiceData**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |1       |false        |

#### **Status**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Tag**

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[string[]]`|false   |Named   |false        |Tags   |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=Service; CommonParameters=True; parameter=System.Object[]}}
```
