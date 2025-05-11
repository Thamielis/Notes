Move-GitHubRepository
---------------------

### Synopsis
Transfer a repository

---

### Description

A transfer request will need to be accepted by the new owner when transferring a personal repository to another user.
The response will contain the original `owner`, and the transfer will continue asynchronously. For more details on
the requirements to transfer personal and organization-owned repositories, see
[about repository transfers](https://docs.github.com/articles/about-repository-transfers/).
You must use a personal access token (classic) or an OAuth token for this endpoint. An installation access token or
a fine-grained personal access token cannot be used because they are only granted access to a single account.

---

### Examples
> EXAMPLE 1

```PowerShell
Move-GitHubRepository -Owner 'PSModule' -Repository 'GitHub' -NewOwner 'GitHub' -NewName 'PowerShell'
Moves the GitHub repository to the PSModule organization and renames it to GitHub.
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

#### **NewOwner**
The username or organization name the repository will be transferred to.

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|true    |3       |false        |new_owner|

#### **NewName**
The new name to be given to the repository.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|false   |4       |false        |new_name|

#### **TeamIds**
ID of the team or teams to add to the repository. Teams can only be added to organization-owned repositories.

|Type       |Required|Position|PipelineInput|Aliases |
|-----------|--------|--------|-------------|--------|
|`[Int32[]]`|false   |5       |false        |team_ids|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

---

### Notes
[Transfer a repository](https://docs.github.com/rest/repos/repos#transfer-a-repository)

---

### Syntax
```PowerShell
Move-GitHubRepository [-Owner] <String> [-Repository] <String> [-NewOwner] <String> [[-NewName] <String>] [[-TeamIds] <Int32[]>] [[-Context] <Object>] [<CommonParameters>]
```
