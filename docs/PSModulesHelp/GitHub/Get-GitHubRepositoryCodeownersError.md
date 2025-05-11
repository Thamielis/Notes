Get-GitHubRepositoryCodeownersError
-----------------------------------

### Synopsis
List CODEOWNERS errors

---

### Description

List any syntax errors that are detected in the CODEOWNERS file.

For more information about the correct CODEOWNERS syntax,
see "[About code owners](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)."

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryCodeownersError -Owner 'PSModule' -Repository 'GitHub'
Gets the CODEOWNERS errors for the repository.
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

#### **Ref**
A branch, tag or commit name used to determine which version of the CODEOWNERS file to use.
Default: the repository's default branch (e.g. main)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

---

### Notes
[List CODEOWNERS errors](https://docs.github.com/rest/repos/repos#list-codeowners-errors)

---

### Syntax
```PowerShell
Get-GitHubRepositoryCodeownersError [-Owner] <String> [-Repository] <String> [[-Ref] <String>] [[-Context] <Object>] [<CommonParameters>]
```
