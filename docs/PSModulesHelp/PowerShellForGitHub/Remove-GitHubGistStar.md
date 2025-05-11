Remove-GitHubGistStar
---------------------

### Synopsis
Unstar a gist from GitHub.

---

### Description

Unstar a gist from GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Remove-GitHubGistStar -Gist 6cad326836d38bd3a7ae
Unstars octocat's "hello_world.rb" gist.
> EXAMPLE 2

Unstar-GitHubGist -Gist 6cad326836d38bd3a7ae
Unstars octocat's "hello_world.rb" gist.  This is using the alias for the command.
The result is the same whether you use Remove-GitHubGistStar or Unstar-GitHubGist.

---

### Parameters
#### **Gist**
The ID of the specific gist that you wish to unstar.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

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
Remove-GitHubGistStar [-Gist] <String> [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
