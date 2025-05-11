Split-GitHubUri
---------------

### Synopsis
Extracts the relevant elements of a GitHub repository Uri and returns the requested element.

---

### Description

Extracts the relevant elements of a GitHub repository Uri and returns the requested element.

Currently supports retrieving the OwnerName and the RepositoryName, when available.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Split-GitHubUri -Uri 'https://github.com/microsoft/PowerShellForGitHub'
PowerShellForGitHub
```
> EXAMPLE 2

```PowerShell
Split-GitHubUri -Uri 'https://github.com/microsoft/PowerShellForGitHub' -RepositoryName
PowerShellForGitHub
```
> EXAMPLE 3

```PowerShell
Split-GitHubUri -Uri 'https://github.com/microsoft/PowerShellForGitHub' -OwnerName
microsoft
```
> EXAMPLE 4

```PowerShell
Split-GitHubUri -Uri 'https://github.com/microsoft/PowerShellForGitHub'
@{'ownerName' = 'microsoft'; 'repositoryName' = 'PowerShellForGitHub'}
```

---

### Parameters
#### **Uri**
The GitHub repository Uri whose components should be returned.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |named   |true (ByValue)|

#### **OwnerName**
Returns the Owner Name from the Uri if it can be identified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RepositoryName**
Returns the Repository Name from the Uri if it can be identified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
[String]

---

### Outputs
* [PSCustomObject] - The OwnerName and RepositoryName elements from the provided URL

---

### Syntax
```PowerShell
Split-GitHubUri -Uri <String> [-RepositoryName] [<CommonParameters>]
```
```PowerShell
Split-GitHubUri -Uri <String> [-OwnerName] [<CommonParameters>]
```
