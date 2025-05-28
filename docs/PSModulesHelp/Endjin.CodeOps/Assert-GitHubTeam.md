Assert-GitHubTeam
-----------------

### Synopsis

Assert-GitHubTeam [-Org] <string> [-Name] <string> [-Description] <string> [-Members] <string[]> [-Repositories] <string[]> [-RepoAccess] <string> [-StrictMode] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Description**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |2       |false        |

#### **Members**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|true    |3       |false        |

#### **Name**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |1       |false        |

#### **Org**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |0       |false        |

#### **RepoAccess**

Valid Values:

* pull
* push
* admin
* triage
* maintain

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |5       |false        |

#### **Repositories**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|true    |4       |false        |

#### **StrictMode**

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
{@{name=Assert-GitHubTeam; CommonParameters=True; parameter=System.Object[]}}
```
