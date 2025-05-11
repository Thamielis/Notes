Get-GitHubRepositoryAutolink
----------------------------

### Synopsis
List all autolinks of a repository

---

### Description

This returns a list of autolinks configured for the given repository.

Information about autolinks are only available to repository administrators.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryAutolink -Owner 'octocat' -Repository 'Hello-World'
Gets all autolinks for the repository 'Hello-World' owned by 'octocat'.
```
> EXAMPLE 2

```PowerShell
Get-GitHubRepositoryAutolink -Owner 'octocat' -Repository 'Hello-World' -ID 1
Gets the autolink with the ID 1 for the repository 'Hello-World' owned by 'octocat'.
```

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|true    |named   |false        |User<br/>Organization|

#### **Repository**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ID**
The unique identifier of the autolink.

|Type     |Required|Position|PipelineInput|Aliases                   |
|---------|--------|--------|-------------|--------------------------|
|`[Int32]`|true    |named   |false        |autolink_id<br/>AutolinkID|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Notes
[Get all autolinks of a repository](https://docs.github.com/rest/repos/autolinks#list-all-autolinks-of-a-repository)

---

### Syntax
```PowerShell
Get-GitHubRepositoryAutolink -Owner <String> -Repository <String> [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryAutolink -Owner <String> -Repository <String> -ID <Int32> [-Context <Object>] [<CommonParameters>]
```
