Get-GitHubWorkflow
------------------

### Synopsis
Lists the workflows in a repository.

---

### Description

Anyone with read access to the repository can use this endpoint.
If the repository is private you must use an access token with the repo scope.
GitHub Apps must have the actions:read permission to use this endpoint.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubWorkflow -Owner 'octocat' -Repository 'hello-world'
Gets all workflows in the 'octocat/hello-world' repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubWorkflow -Owner 'octocat' -Repository 'hello-world' -Name 'hello-world.yml'
Gets the 'hello-world.yml' workflow in the 'octocat/hello-world' repository.
```

---

### Parameters
#### **Owner**

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|User<br/>Organization|

#### **Repository**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
[List repository workflows](https://docs.github.com/rest/actions/workflows?apiVersion=2022-11-28#list-repository-workflows)

---

### Syntax
```PowerShell
Get-GitHubWorkflow [-Owner] <String> [-Repository] <String> [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
