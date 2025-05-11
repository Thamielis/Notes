Remove-GitHubGist
-----------------

### Synopsis
Removes/deletes a gist from GitHub.

---

### Description

Removes/deletes a gist from GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Remove-GitHubGist -Gist 6cad326836d38bd3a7ae
Removes octocat's "hello_world.rb" gist (assuming you have permission).
> EXAMPLE 2

Remove-GitHubGist -Gist 6cad326836d38bd3a7ae -Confirm:$false
Removes octocat's "hello_world.rb" gist (assuming you have permission).
Will not prompt for confirmation, as -Confirm:$false was specified.
> EXAMPLE 3

Remove-GitHubGist -Gist 6cad326836d38bd3a7ae -Force
Removes octocat's "hello_world.rb" gist (assuming you have permission).
Will not prompt for confirmation, as -Force was specified.

---

### Parameters
#### **Gist**
The ID of the specific gist that you wish to retrieve.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

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
GitHub.Gist
GitHub.GistComment
GitHub.GistCommit
GitHub.GistFork
GitHub.GistSummary

---

### Syntax
```PowerShell
Remove-GitHubGist [-Gist] <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
