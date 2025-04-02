New-GitHubGistComment
---------------------

### Synopsis
Creates a new comment on the specified gist from GitHub.

---

### Description

Creates a new comment on the specified gist from GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

New-GitHubGistComment -Gist 6cad326836d38bd3a7ae -Body 'Hello World'
Adds a new comment of "Hello World" to octocat's "hello_world.rb" gist.

---

### Parameters
#### **Gist**
The ID of the specific gist that you wish to add the comment to.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

#### **Body**
The body of the comment that you wish to leave on the gist.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

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

### Outputs
* GitHub.GistComment

---

### Syntax
```PowerShell
New-GitHubGistComment [-Gist] <String> [-Body] <String> [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
