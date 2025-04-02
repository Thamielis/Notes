New-GitHubDeploymentEnvironment
-------------------------------

### Synopsis
Creates or updates a deployment environment on a GitHub repository.

---

### Description

Creates or updates a deployment environment on a GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubDeploymentEnvironment -OwnerName microsoft -RepositoryName PowerShellForGitHub -EnvironmentName 'Test'
Creates or updates a deployment environment called 'Test' for the specified repo.
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
The name of the environment.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **WaitTimer**
The amount of time to delay a job after the job is initially triggered.
The time (in minutes) must be an integer between 0 and 43,200 (30 days).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **DeploymentBranchPolicy**
Whether only branches with branch protection rules or that match the specified name patterns
can deploy to this environment.
Valid Values:

* ProtectedBranches
* CustomBranchPolicies
* None

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ReviewerTeamId**
The teams that may review jobs that reference the environment.
You can list up to six users and/or teams as reviewers.
The reviewers must have at least read access to the repository.
Only one of the required reviewers needs to approve the job for it to proceed.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int64[]]`|false   |named   |false        |

#### **ReviewerUserId**
The users that may review jobs that reference the environment.
You can list up to six users and/or teams as reviewers.
The reviewers must have at least read access to the repository.
Only one of the required reviewers needs to approve the job for it to proceed.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int64[]]`|false   |named   |false        |

#### **PassThru**
Returns the updated environment.  By default, the Set-GitHubDeploymentEnvironment cmdlet
does not generate any output.
You can use "Set-GitHubConfiguration -DefaultPassThru" to control the default behavior
of this switch.

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

### Outputs
* GitHub.DeploymentEnvironment

---

### Syntax
```PowerShell
New-GitHubDeploymentEnvironment [-OwnerName <String>] [-RepositoryName <String>] -EnvironmentName <String> [-WaitTimer <Int32>] [-DeploymentBranchPolicy <String>] [-ReviewerTeamId <Int64[]>] [-ReviewerUserId <Int64[]>] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubDeploymentEnvironment -Uri <String> -EnvironmentName <String> [-WaitTimer <Int32>] [-DeploymentBranchPolicy <String>] [-ReviewerTeamId <Int64[]>] [-ReviewerUserId <Int64[]>] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
