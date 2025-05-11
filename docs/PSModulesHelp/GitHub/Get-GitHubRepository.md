Get-GitHubRepository
--------------------

### Synopsis
Gets a specific repository or list of repositories.

---

### Description

Gets a specific repository or list of repositories based on parameter sets.
If no parameters are specified, the authenticated user's repositories are returned.
If a Username parameter is specified, the specified user's public repositories are returned.
If the SinceId parameter is specified, the repositories with an ID greater than the specified ID are returned.
If an Owner and Repo parameters are specified, the specified repository is returned.
If the Owner and Repo parameters are specified, the specified repository is returned.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepository
Gets the repositories for the authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubRepository -Type 'owner'
Gets the repositories owned by the authenticated user.
```
> EXAMPLE 3

```PowerShell
Get-GitHubRepository -Username 'octocat'
Gets the repositories for the specified user.
```
> EXAMPLE 4

```PowerShell
Get-GitHubRepository -SinceID 123456789
Gets the repositories with an ID equals and greater than 123456789.
```
> EXAMPLE 5

```PowerShell
Get-GitHubRepository -Owner 'github' -Repository 'octocat'
Gets the specified repository.
```

---

### Parameters
#### **Visibility**
Limit results to repositories with the specified visibility.
Valid Values:

* all
* public
* private

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Affiliation**
Comma-separated list of values. Can include:
* owner: Repositories that are owned by the authenticated user.
* collaborator: Repositories that the user has been added to as a collaborator.
* organization_member: Repositories that the user has access to through being a member of an organization.
  This includes every repository on every team that the user is on.
Default: owner, collaborator, organization_member
Valid Values:

* owner
* collaborator
* organization_member

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **SinceID**
A repository ID. Only return repositories with an ID greater than this ID.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Since**
Only show repositories updated after the given time.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **Before**
Only show repositories updated before the given time.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Name**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Username**
The handle for the GitHub user account.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|login  |

#### **Sort**
The property to sort the results by.
Valid Values:

* created
* updated
* pushed
* full_name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Direction**
The order to sort by.
Default: asc when using full_name, otherwise desc.
Valid Values:

* asc
* desc

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Notes
[List repositories for the authenticated user](https://docs.github.com/rest/repos/repos#list-repositories-for-the-authenticated-user)
[Get a repository](https://docs.github.com/rest/repos/repos#get-a-repository)
[List public repositories](https://docs.github.com/rest/repos/repos#list-public-repositories)
[List organization repositories](https://docs.github.com/rest/repos/repos#list-organization-repositories)
[List repositories for a user](https://docs.github.com/rest/repos/repos#list-repositories-for-a-user)

---

### Syntax
```PowerShell
Get-GitHubRepository [-Since <DateTime>] [-Before <DateTime>] [-Sort <String>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepository [-Visibility <String>] [-Affiliation <String[]>] [-Since <DateTime>] [-Before <DateTime>] [-Sort <String>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepository [-SinceID <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepository [-Owner <String>] [-Sort <String>] [-Direction <String>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepository [-Owner <String>] -Name <String> [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepository -Username <String> [-Sort <String>] [-Direction <String>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepository [-Direction <String>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
