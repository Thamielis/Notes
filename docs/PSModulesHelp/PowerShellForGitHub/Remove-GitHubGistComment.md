Remove-GitHubGistComment
------------------------

### Synopsis
Removes/deletes a comment from a gist on GitHub.

---

### Description

Removes/deletes a comment from a gist on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Remove-GitHubGist -Gist 6cad326836d38bd3a7ae -Comment 12324567
Removes the specified comment from octocat's "hello_world.rb" gist
(assuming you have permission).
> EXAMPLE 2

Remove-GitHubGist -Gist 6cad326836d38bd3a7ae -Comment 12324567 -Confirm:$false
Removes the specified comment from octocat's "hello_world.rb" gist
(assuming you have permission).
Will not prompt for confirmation, as -Confirm:$false was specified.
> EXAMPLE 3

Remove-GitHubGist -Gist 6cad326836d38bd3a7ae -Comment 12324567 -Force
Removes the specified comment from octocat's "hello_world.rb" gist
(assuming you have permission).
Will not prompt for confirmation, as -Force was specified.

---

### Parameters
#### **Gist**
The ID of the specific gist that you wish to remove the comment from.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

#### **Comment**
The ID of the comment to remove from the gist.

|Type     |Required|Position|PipelineInput        |Aliases      |
|---------|--------|--------|---------------------|-------------|
|`[Int64]`|true    |3       |true (ByPropertyName)|GistCommentId|

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
Remove-GitHubGistComment [-Gist] <String> [-Comment] <Int64> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
