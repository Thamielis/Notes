Get-GitHubRepositoryFork
------------------------

### Synopsis
List forks

---

### Description

List forks of a named repository.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryFork -Owner 'octocat' -Repository 'Hello-World'
List forks of the 'Hello-World' repository owned by 'octocat'.
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

#### **Sort**
The direction to sort the results by.
Valid Values:

* newest
* oldest
* stargazers
* watchers

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **PerPage**
The number of results per page.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

---

### Notes
[List forks](https://docs.github.com/rest/repos/forks#list-forks)

---

### Syntax
```PowerShell
Get-GitHubRepositoryFork [-Owner] <String> [-Repository] <String> [[-Sort] <String>] [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
