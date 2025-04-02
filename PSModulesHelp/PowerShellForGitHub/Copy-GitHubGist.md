Copy-GitHubGist
---------------

### Synopsis
Forks a gist from GitHub.

---

### Description

Forks a gist from GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Copy-GitHubGist -Gist 6cad326836d38bd3a7ae
Forks octocat's "hello_world.rb" gist.
> EXAMPLE 2

$result = Fork-GitHubGist -Gist 6cad326836d38bd3a7ae -PassThru
Forks octocat's "hello_world.rb" gist.  This is using the alias for the command.
The result is the same whether you use Copy-GitHubGist or Fork-GitHubGist.
Specifying the -PassThru switch enables you to get a reference to the newly created fork.

---

### Parameters
#### **Gist**
The ID of the specific gist that you wish to fork.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

#### **PassThru**
Returns the newly created gist fork.  By default, this cmdlet does not generate any output.
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
GitHub.Gist
GitHub.GistComment
GitHub.GistCommit
GitHub.GistFork
GitHub.GistSummary

---

### Outputs
* GitHub.GistSummary

---

### Syntax
```PowerShell
Copy-GitHubGist [-Gist] <String> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
