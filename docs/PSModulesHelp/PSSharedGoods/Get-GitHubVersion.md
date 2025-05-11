Get-GitHubVersion
-----------------

### Synopsis
Get the latest version of a GitHub repository and compare with local version

---

### Description

Get the latest version of a GitHub repository and compare with local version

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubVersion -Cmdlet 'Start-DelegationModel' -RepositoryOwner 'evotecit' -RepositoryName 'DelegationModel'
```

---

### Parameters
#### **Cmdlet**
Cmdlet to find module for

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **RepositoryOwner**
Repository owner

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **RepositoryName**
Repository name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-GitHubVersion [-Cmdlet] <String> [-RepositoryOwner] <String> [-RepositoryName] <String> [<CommonParameters>]
```
