New-GitHubRepositoryBranch
--------------------------

### Synopsis
Creates a new branch for a given GitHub repository.

---

### Description

Creates a new branch for a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubRepositoryBranch -OwnerName microsoft -RepositoryName PowerShellForGitHub -TargetBranchName new-branch
Creates a new branch in the specified repository from the master branch.
```
> EXAMPLE 2

```PowerShell
New-GitHubRepositoryBranch -Uri 'https://github.com/microsoft/PowerShellForGitHub' -BranchName develop -TargetBranchName new-branch
Creates a new branch in the specified repository from the 'develop' origin branch.
```
> EXAMPLE 3

```PowerShell
$repo = Get-GithubRepository -Uri https://github.com/You/YourRepo
$repo | New-GitHubRepositoryBranch -TargetBranchName new-branch
You can also pipe in a repo that was returned from a previous command.
```
> EXAMPLE 4

```PowerShell
$branch = Get-GitHubRepositoryBranch -OwnerName microsoft -RepositoryName PowerShellForGitHub -BranchName main
$branch | New-GitHubRepositoryBranch -TargetBranchName beta
You can also pipe in a branch that was returned from a previous command.
```
> EXAMPLE 5

```PowerShell
New-GitHubRepositoryBranch -Uri 'https://github.com/microsoft/PowerShellForGitHub' -Sha 1c3b80b754a983f4da20e77cfb9bd7f0e4cb5da6 -TargetBranchName new-branch
You can also create a new branch based off of a specific SHA1 commit value.
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
|`[String]`|true    |2       |true (ByPropertyName)|RepositoryUrl|

#### **BranchName**
The name of the origin branch to create the new branch from.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TargetBranchName**
Name of the branch to be created.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |3       |true (ByValue)|

#### **Sha**
The SHA1 value of the commit that this branch should be based on.
If not specified, will use the head of BranchName.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
GitHub.PullRequest
GitHub.Project
GitHub.ProjectCard
GitHub.ProjectColumn
GitHub.Release
GitHub.Repository

---

### Outputs
* GitHub.Branch

---

### Syntax
```PowerShell
New-GitHubRepositoryBranch [-OwnerName <String>] [-RepositoryName <String>] [-BranchName <String>] [-TargetBranchName] <String> [-Sha <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubRepositoryBranch [-Uri] <String> [-BranchName <String>] [-TargetBranchName] <String> [-Sha <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
