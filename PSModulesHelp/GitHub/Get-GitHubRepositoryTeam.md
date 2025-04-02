Get-GitHubRepositoryTeam
------------------------

### Synopsis
List repository teams

---

### Description

Lists the teams that have access to the specified repository and that are also visible to the authenticated user.

For a public repository, a team is listed only if that team added the public repository explicitly.

Personal access tokens require the following scopes:
* `public_repo` to call this endpoint on a public repository
* `repo` to call this endpoint on a private repository (this scope also includes public repositories)

This endpoint is not compatible with fine-grained personal access tokens.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryTeam -Owner 'PSModule' -Repository 'GitHub'
Lists the teams that have access to the specified repository and that are also visible to the authenticated user.
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

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

---

### Notes
[List repository teams](https://docs.github.com/rest/repos/repos#list-repository-teams)

---

### Syntax
```PowerShell
Get-GitHubRepositoryTeam [-Owner] <String> [-Repository] <String> [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
