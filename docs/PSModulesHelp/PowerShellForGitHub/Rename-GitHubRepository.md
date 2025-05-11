Rename-GitHubRepository
-----------------------

### Synopsis
Rename a GitHub repository

---

### Description

Renames a GitHub repository with the new name provided.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepository -Owner octocat -RepositoryName hello-world | Rename-GitHubRepository -NewName hello-again-world
Get the given 'hello-world' repo from the user 'octocat' and then
rename it to be https://github.com/octocat/hello-again-world.
```
> EXAMPLE 2

```PowerShell
Get-GitHubRepository -Uri https://github.com/octocat/hello-world | Rename-GitHubRepository -NewName hello-again-world -Confirm:$false
Get the repository at https://github.com/octocat/hello-world and then
rename it https://github.com/octocat/hello-again-world.
Will not prompt for confirmation, as -Confirm:$false was specified.
```
> EXAMPLE 3

```PowerShell
Rename-GitHubRepository -Uri https://github.com/octocat/hello-world -NewName hello-again-world
Rename the repository at https://github.com/octocat/hello-world to
https://github.com/octocat/hello-again-world.
```
> EXAMPLE 4

```PowerShell
New-GitHubRepositoryFork -Uri https://github.com/octocat/hello-world | Foreach-Object {$_ | Rename-GitHubRepository -NewName "$($_.name)_fork"}
Fork the `hello-world` repository from the user 'octocat', and then
rename the newly forked repository by appending '_fork'.
```
> EXAMPLE 5

```PowerShell
Rename-GitHubRepository -Uri https://github.com/octocat/hello-world -NewName hello-again-world -Confirm:$false
Rename the repository at https://github.com/octocat/hello-world to
https://github.com/octocat/hello-again-world without prompting for confirmation.
```
> EXAMPLE 6

```PowerShell
Rename-GitHubRepository -Uri https://github.com/octocat/hello-world -NewName hello-again-world -Force
Rename the repository at https://github.com/octocat/hello-world to
https://github.com/octocat/hello-again-world without prompting for confirmation.
```

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
Uri for the repository to rename. You can supply this directly, or more easily by
using Get-GitHubRepository to get the repository as you please,
and then piping the result to this cmdlet.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |named   |true (ByPropertyName)|RepositoryUrl|

#### **NewName**
The new name to set for the given GitHub repository

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Force**
If this switch is specified, you will not be prompted for confirmation of command execution.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Returns the renamed Repository.  By default, this cmdlet does not generate any output.
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
Rename-GitHubRepository -Uri <String> -NewName <String> [-Force] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Rename-GitHubRepository -OwnerName <String> -RepositoryName <String> -NewName <String> [-Force] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
