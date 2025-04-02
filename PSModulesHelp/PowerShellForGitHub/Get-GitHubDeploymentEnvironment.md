Get-GitHubDeploymentEnvironment
-------------------------------

### Synopsis
Retrieves information about a deployment environment or list of deployment environments on GitHub.

---

### Description

Retrieves information about a deployment environment or list of deployment environments on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubDeploymentEnvironment -OwnerName microsoft -RepositoryName PowerShellForGitHub
Gets details of all of the deployment environments for the specified repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubDeploymentEnvironment -OwnerName microsoft -RepositoryName PowerShellForGitHub -EnvironmentName Test
Gets details of the Test deployment environment for the specified repository.
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

#### **EnvironmentName**
The name of the deployment environment.

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
GitHub.DeploymentEnvironment
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
* GitHub.DeploymentEnvironment

---

### Syntax
```PowerShell
Get-GitHubDeploymentEnvironment [-OwnerName <String>] [-RepositoryName <String>] [-EnvironmentName <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubDeploymentEnvironment -Uri <String> [-EnvironmentName <String>] [-AccessToken <String>] [<CommonParameters>]
```
