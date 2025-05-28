Assert-GitHubTeamMembers
------------------------

### Synopsis

Assert-GitHubTeamMembers -Org <string> -TeamName <string> -Members <string[]> [-RemoveExtraMembers] [<CommonParameters>]

Assert-GitHubTeamMembers -Team <Object> -Members <string[]> [-RemoveExtraMembers] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Members**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|true    |Named   |false        |

#### **Org**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **RemoveExtraMembers**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Team**

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |Named   |true (ByValue)|

#### **TeamName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

---

### Inputs
System.Object

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
{@{name=Assert-GitHubTeamMembers; CommonParameters=True; parameter=System.Object[]}, @{name=Assert-GitHubTeamMembers; CommonParameters=True; parameter=System.Object[]}}
```
