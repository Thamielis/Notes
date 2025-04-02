Get-GithubTree
--------------

### Synopsis
Returns a list of all files and folders in the selected branch.

---

### Description

Returns a list of all files and folders in the selected branch.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GithubTree -Owner FriedrichWeinmann -Repository PowerShellForGithub.Content -BranchName master
Returns all files and folders in the master branch of the PowerShellForGithub.Content repository of FriedrichWeinmann
```

---

### Parameters
#### **Owner**
The owner of the repository.
Can be an organization or a personal account name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Repository**
The name of the repository to scan.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **RepositoryUrl**
The full link to the repository to scan

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **BranchName**
The name of the branch to scan.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

---

### Syntax
```PowerShell
Get-GithubTree -Owner <String> -Repository <String> -BranchName <String> [<CommonParameters>]
```
```PowerShell
Get-GithubTree -RepositoryUrl <String> -BranchName <String> [<CommonParameters>]
```
