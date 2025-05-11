Get-GitHubRepository
--------------------

### Synopsis
Retrieves information about a repository or list of repositories on GitHub.

---

### Description

Retrieves information about a repository or list of repositories on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepository
Gets all repositories for the current authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubRepository -GetAllPublicRepositories
Gets all public repositories on GitHub.
```
> EXAMPLE 3

```PowerShell
Get-GitHubRepository -OwnerName octocat
Gets all of the repositories for the user octocat
```
> EXAMPLE 4

```PowerShell
Get-GitHubUser -UserName octocat | Get-GitHubRepository
Gets all of the repositories for the user octocat
```
> EXAMPLE 5

```PowerShell
Get-GitHubRepository -Uri https://github.com/microsoft/PowerShellForGitHub
Gets information about the microsoft/PowerShellForGitHub repository.
```
> EXAMPLE 6

```PowerShell
$repo | Get-GitHubRepository
You can pipe in a previous repository to get its refreshed information.
```
> EXAMPLE 7

```PowerShell
Get-GitHubRepository -OrganizationName PowerShell
Gets all of the repositories in the PowerShell organization.
```

---

### Parameters
#### **OwnerName**
Owner of the repository.
If not supplied here, the DefaultOwnerName configuration property value will be used.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |named   |true (ByPropertyName)|UserName|

#### **RepositoryName**
Name of the repository.
If not supplied here, the DefaultRepositoryName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Uri**
Uri for the repository.
The OwnerName and RepositoryName will be extracted from here instead of needing to provide
them individually.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |named   |true (ByPropertyName)|RepositoryUrl|

#### **OrganizationName**
The name of the organization to retrieve the repositories for.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Visibility**
The type of visibility/accessibility for the repositories to return.
Valid Values:

* All
* Public
* Private

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Affiliation**
Can be one or more of:
owner - Repositories that are owned by the authenticated user
collaborator - Repositories that the user has been added to as a collaborator
organization_member - Repositories that the user has access to through being
a member of an organization.  This includes every repository on every team that the user
is on.
Valid Values:

* Owner
* Collaborator
* OrganizationMember

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Type**
The type of repository to return.
Valid Values:

* All
* Owner
* Public
* Private
* Member
* Forks
* Sources

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Sort**
Property that the results should be sorted by
Valid Values:

* Created
* Updated
* Pushed
* FullName

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Direction**
Direction of the sort that is to be applied to the results.
Valid Values:

* Ascending
* Descending

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GetAllPublicRepositories**
If this is specified with no other parameter, then instead of returning back all
repositories for the current authenticated user, it will instead return back all
public repositories on GitHub in the order in which they were created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Since**
The ID of the last public repository that you have seen.  If specified with
-GetAllPublicRepositories, will only return back public repositories created _after_ this
one.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
GitHub.Branch
GitHub.Content
GitHub.Event
GitHub.Issue
GitHub.IssueComment
GitHub.Label
GitHub.Milestone
GitHub.PullRequest
GitHub.Project
GitHub.ProjectCard
GitHub.ProjectColumn
GitHub.Reaction
GitHub.Release
GitHub.ReleaseAsset
GitHub.Repository

---

### Outputs
* GitHub.Repository

---

### Syntax
```PowerShell
Get-GitHubRepository [-Visibility <String>] [-Affiliation <String[]>] [-Type <String>] [-Sort <String>] [-Direction <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepository [-OwnerName <String>] [-RepositoryName <String>] [-Type <String>] [-Sort <String>] [-Direction <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepository -Uri <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepository [-OrganizationName <String>] [-Type <String>] [-Sort <String>] [-Direction <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepository [-GetAllPublicRepositories] [-Since <Int64>] [-AccessToken <String>] [<CommonParameters>]
```
