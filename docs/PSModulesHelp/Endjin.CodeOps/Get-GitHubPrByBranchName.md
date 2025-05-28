Get-GitHubPrByBranchName
------------------------

### Synopsis

Get-GitHubPrByBranchName [-OrgName] <string> [-RepoName] <string> [-BranchName] <string> [[-State] <string>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **BranchName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |2       |false        |

#### **OrgName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |0       |false        |

#### **RepoName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |1       |false        |

#### **State**

Valid Values:

* open
* closed
* all

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

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
{@{name=Get-GitHubPrByBranchName; CommonParameters=True; parameter=System.Object[]}}
```
