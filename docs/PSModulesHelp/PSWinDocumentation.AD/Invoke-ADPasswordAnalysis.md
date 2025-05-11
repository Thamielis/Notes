Invoke-ADPasswordAnalysis
-------------------------

### Synopsis

Invoke-ADPasswordAnalysis [[-Forest] <string>] [[-ExcludeDomains] <string[]>] [[-IncludeDomains] <string[]>] [[-ExtendedForestInformation] <IDictionary>] [[-PathToPasswords] <string>] [-UseNTLMHashes] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ExcludeDomains**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |1       |false        |

#### **ExtendedForestInformation**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |3       |false        |

#### **Forest**

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[string]`|false   |0       |false        |ForestName|

#### **IncludeDomains**

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[string[]]`|false   |2       |false        |Domain<br/>Domains|

#### **PathToPasswords**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |4       |false        |

#### **UseNTLMHashes**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

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
{@{name=Invoke-ADPasswordAnalysis; CommonParameters=True; parameter=System.Object[]}}
```
