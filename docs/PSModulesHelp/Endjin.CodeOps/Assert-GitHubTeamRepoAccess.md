Assert-GitHubTeamRepoAccess
---------------------------

### Synopsis

Assert-GitHubTeamRepoAccess -Org <string> -TeamName <string> -Repositories <string[]> -RepoAccess <string> [<CommonParameters>]

Assert-GitHubTeamRepoAccess -Team <Object> -Repositories <string[]> -RepoAccess <string> [<CommonParameters>]

---

### Description

---

### Parameters
#### **Org**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **RepoAccess**

Valid Values:

* pull
* push
* admin
* triage
* maintain

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **Repositories**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|true    |Named   |false        |

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
{@{name=Assert-GitHubTeamRepoAccess; CommonParameters=True; parameter=System.Object[]}, @{name=Assert-GitHubTeamRepoAccess; CommonParameters=True; parameter=System.Object[]}}
```
