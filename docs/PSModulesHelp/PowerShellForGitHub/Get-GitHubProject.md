Get-GitHubProject
-----------------

### Synopsis
Get the projects for a given GitHub user, repository or organization.

---

### Description

Get the projects for a given GitHub user, repository or organization.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubProject -OwnerName microsoft -RepositoryName PowerShellForGitHub
Get the projects for the microsoft\PowerShellForGitHub repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubProject -OrganizationName Microsoft
Get the projects for the Microsoft organization.
```
> EXAMPLE 3

```PowerShell
Get-GitHubProject -Uri https://github.com/Microsoft/PowerShellForGitHub
Get the projects for the microsoft\PowerShellForGitHub repository using the Uri.
```
> EXAMPLE 4

```PowerShell
Get-GitHubProject -UserName GitHubUser
Get the projects for the user GitHubUser.
```
> EXAMPLE 5

```PowerShell
Get-GitHubProject -OwnerName microsoft -RepositoryName PowerShellForGitHub -State Closed
Get closed projects from the microsoft\PowerShellForGitHub repo.
```
> EXAMPLE 6

Get-GitHubProject -Project 4378613
Get a project by id, with this parameter you don't need any other information.

---

### Parameters
#### **OwnerName**
Owner of the repository.
If not supplied here, the DefaultOwnerName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **RepositoryName**
Name of the repository.
If not supplied here, the DefaultRepositoryName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Uri**
Uri for the repository.
The OwnerName and RepositoryName will be extracted from here instead of needing to provide
them individually.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |named   |true (ByPropertyName)|RepositoryUrl|

#### **OrganizationName**
The name of the organization to get projects for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **UserName**
The name of the user to get projects for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Project**
ID of the project to retrieve.

|Type     |Required|Position|PipelineInput        |Aliases  |
|---------|--------|--------|---------------------|---------|
|`[Int64]`|true    |named   |true (ByPropertyName)|ProjectId|

#### **State**
Only projects with this state are returned.
Valid Values:

* Open
* Closed
* All

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* GitHub.Project

---

### Syntax
```PowerShell
Get-GitHubProject -OwnerName <String> -RepositoryName <String> [-State <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubProject -Uri <String> -Project <Int64> [-State <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubProject -Uri <String> [-State <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubProject -OrganizationName <String> [-State <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubProject -UserName <String> [-State <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubProject -Project <Int64> [-State <String>] [-AccessToken <String>] [<CommonParameters>]
```
