Get-GitHubRepositoryLanguage
----------------------------

### Synopsis
List repository languages

---

### Description

Lists languages for the specified repository. The value shown for each language is the number of
bytes of code written in that language.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryLanguage -Owner 'octocat' -Repository 'hello-world'
Gets the languages for the 'hello-world' repository owned by 'octocat'.
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
[List repository languages](https://docs.github.com/rest/repos/repos#list-repository-languages)

---

### Syntax
```PowerShell
Get-GitHubRepositoryLanguage [-Owner] <String> [-Repository] <String> [[-Context] <Object>] [<CommonParameters>]
```
