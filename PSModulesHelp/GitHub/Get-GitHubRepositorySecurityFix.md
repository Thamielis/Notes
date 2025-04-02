Get-GitHubRepositorySecurityFix
-------------------------------

### Synopsis
Check if automated security fixes are enabled for a repository

---

### Description

Shows whether automated security fixes are enabled, disabled or paused for a repository.
The authenticated user must have admin read access to the repository. For more information, see
"[Configuring automated security fixes](https://docs.github.com/articles/configuring-automated-security-fixes)".

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositorySecurityFix -Owner 'PSModule' -Repository 'GitHub'
Gets the automated security fixes status for the GitHub repository.
```

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|true    |1       |false        |User<br/>Organization|

#### **Repository**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Notes
[Check if automated security fixes are enabled for a repository](https://docs.github.com/rest/repos/repos#check-if-automated-security-fixes-are-enabled-for-a-repository)

---

### Syntax
```PowerShell
Get-GitHubRepositorySecurityFix [-Owner] <String> [-Repository] <String> [[-Context] <Object>] [<CommonParameters>]
```
