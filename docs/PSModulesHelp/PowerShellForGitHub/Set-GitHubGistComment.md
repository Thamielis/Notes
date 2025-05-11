Set-GitHubGistComment
---------------------

### Synopsis
Edits a comment on the specified gist from GitHub.

---

### Description

Edits a comment on the specified gist from GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Set-GitHubGistComment -Gist 6cad326836d38bd3a7ae -Comment 1232456 -Body 'Hello World'
Updates the body of the comment with ID 1232456 octocat's "hello_world.rb" gist to be
"Hello World".

---

### Parameters
#### **Gist**
The ID of the gist that the comment is on.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

#### **Comment**
The ID of the comment that you wish to edit.

|Type     |Required|Position|PipelineInput        |Aliases      |
|---------|--------|--------|---------------------|-------------|
|`[Int64]`|true    |3       |true (ByPropertyName)|GistCommentId|

#### **Body**
The new text of the comment that you wish to leave on the gist.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

#### **PassThru**
Returns the updated Comment.  By default, this cmdlet does not generate any output.
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
* GitHub.GistComment

---

### Syntax
```PowerShell
Set-GitHubGistComment [-Gist] <String> [-Comment] <Int64> [-Body] <String> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
