Set-GitHubGistStar
------------------

### Synopsis
Changes the starred state of a gist on GitHub for the current authenticated user.

---

### Description

Changes the starred state of a gist on GitHub for the current authenticated user.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Set-GitHubGistStar -Gist 6cad326836d38bd3a7ae -Star
Stars octocat's "hello_world.rb" gist.
> EXAMPLE 2

Set-GitHubGistStar -Gist 6cad326836d38bd3a7ae
Unstars octocat's "hello_world.rb" gist.
> EXAMPLE 3

Get-GitHubGist -Gist 6cad326836d38bd3a7ae | Set-GitHubGistStar -Star:$false
Unstars octocat's "hello_world.rb" gist.

---

### Parameters
#### **Gist**
The ID of the specific Gist that you wish to change the starred state for.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

#### **Star**
Include this switch to star the gist.  Exclude the switch (or use -Star:$false) to
remove the star.

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
GitHub.Gist
GitHub.GistComment
GitHub.GistCommit
GitHub.GistFork
GitHub.GistSummary

---

### Syntax
```PowerShell
Set-GitHubGistStar [-Gist] <String> [-Star] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
