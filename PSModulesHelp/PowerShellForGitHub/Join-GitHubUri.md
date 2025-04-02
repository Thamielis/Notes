Join-GitHubUri
--------------

### Synopsis
Combines the provided repository elements into a repository URL.

---

### Description

Combines the provided repository elements into a repository URL.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Parameters
#### **OwnerName**
Owner of the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **RepositoryName**
Name of the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Outputs
* [String] - The repository URL.

---

### Syntax
```PowerShell
Join-GitHubUri [-OwnerName] <String> [-RepositoryName] <String> [<CommonParameters>]
```
