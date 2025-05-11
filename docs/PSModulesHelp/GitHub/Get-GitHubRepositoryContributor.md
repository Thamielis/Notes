Get-GitHubRepositoryContributor
-------------------------------

### Synopsis
List repository contributors

---

### Description

Lists contributors to the specified repository and sorts them by the number of commits per contributor in descending order.
This endpoint may return information that is a few hours old because the GitHub REST API caches contributor data to improve performance.

GitHub identifies contributors by author email address. This endpoint groups contribution counts by GitHub user,
which includes all associated email addresses. To improve performance, only the first 500 author email addresses
in the repository link to GitHub users. The rest will appear as anonymous contributors without associated GitHub user information.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryContributor -Owner 'PSModule' -Repository 'GitHub'
Gets all contributors to the GitHub repository.
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

#### **Anon**
Wether to include anonymous contributors in results.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
[List repository contributors](https://docs.github.com/rest/repos/repos#list-repository-contributors)

---

### Syntax
```PowerShell
Get-GitHubRepositoryContributor [-Owner] <String> [-Repository] <String> [-Anon] [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
