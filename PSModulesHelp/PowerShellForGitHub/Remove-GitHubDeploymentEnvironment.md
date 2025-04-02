Remove-GitHubDeploymentEnvironment
----------------------------------

### Synopsis
Removes a deployment environment from a GitHub repository.

---

### Description

Removes a deployment environment from a GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubDeploymentEnvironment -OwnerName You -RepositoryName RepoName -EnvironmentName EnvToDelete
```
> EXAMPLE 2

```PowerShell
Remove-GitHubDeploymentEnvironment -Uri https://github.com/You/YourRepo -EnvironmentName EnvToDelete
```
> EXAMPLE 3

```PowerShell
Remove-GitHubDeploymentEnvironment -Uri https://github.com/You/YourRepo -EnvironmentName EnvToDelete -Confirm:$false
Remove the deployment environment from the repository without prompting for confirmation.
```
> EXAMPLE 4

```PowerShell
Remove-GitHubDeploymentEnvironment -Uri https://github.com/You/YourRepo -EnvironmentName EnvToDelete -Force
Remove the deployment environment from the repository without prompting for confirmation.
```
> EXAMPLE 5

```PowerShell
$repo = Get-GitHubRepository -Uri https://github.com/You/YourRepo
$repo | Remove-GitHubDeploymentEnvironment -EnvironmentName EnvToDelete -Force
You can also pipe in a repo that was returned from a previous command.
```

---

### Parameters
#### **OwnerName**
Owner of the repository.
If not supplied here, the DefaultOwnerName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
The name of the deployment environment to remove.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Force**
If this switch is specified, you will not be prompted for confirmation of command execution.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

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

### Syntax
```PowerShell
Remove-GitHubDeploymentEnvironment [-OwnerName <String>] [-RepositoryName <String>] -EnvironmentName <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GitHubDeploymentEnvironment -Uri <String> -EnvironmentName <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
