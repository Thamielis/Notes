Set-GitHubRepositoryTeamPermission
----------------------------------

### Synopsis
Sets team permission for a repository on GitHub.

---

### Description

Sets team permission for a repository on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubRepositoryTeamPermission -Uri https://github.com/microsoft/PowerShellForGitHub -TeamName Devs -Permission Push
Sets the Push permission for the Devs team on the microsoft/PowerShellForGitHub repository.
```
> EXAMPLE 2

```PowerShell
Set-GitHubRepositoryTeamPermission -OwnerName microsoft -RepositoryName PowerShellForGitHub -TeamName Admins -Permission Admin
Sets the Admin permission for the Admin team on the microsoft/PowerShellForGitHub repository.
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

#### **TeamName**
The name of the specific team to retrieve.
Note: This will be slower than querying by TeamSlug since it requires retrieving
all teams first.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **TeamSlug**
The slug (a unique key based on the team name) of the specific team to retrieve.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Permission**
The permission to grant the team on this repository.
Can be one of:
* Pull - team members can pull, but not push to or administer this repository.
* Push - team members can pull and push, but not administer this repository.
* Admin - team members can pull, push and administer this repository.
* Maintain - team members can manage the repository without access to sensitive or
  destructive actions. Recommended for project managers. Only applies to repositories owned
  by organizations.
* Triage - team members can proactively manage issues and pull requests without write access.
  Recommended for contributors who triage a repository. Only applies to repositories owned
  by organizations.
If no permission is specified, the team's permission attribute will be used to determine
what permission to grant the team on this repository.
Valid Values:

* Pull
* Push
* Admin
* Maintain
* Triage

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
GitHub.Event
GitHub.Issue
GitHub.IssueComment
GitHub.Label
GitHub.Milestone
GitHub.Organization
GitHub.PullRequest
GitHub.Project
GitHub.ProjectCard
GitHub.ProjectColumn
GitHub.Reaction
GitHub.Release
GitHub.ReleaseAsset
GitHub.Repository
GitHub.Team

---

### Syntax
```PowerShell
Set-GitHubRepositoryTeamPermission [-OwnerName <String>] [-RepositoryName <String>] -TeamName <String> [-Permission <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubRepositoryTeamPermission [-OwnerName <String>] [-RepositoryName <String>] -TeamSlug <String> [-Permission <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubRepositoryTeamPermission -Uri <String> -TeamSlug <String> [-Permission <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubRepositoryTeamPermission -Uri <String> -TeamName <String> [-Permission <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
