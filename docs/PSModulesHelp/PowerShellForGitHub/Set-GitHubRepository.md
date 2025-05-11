Set-GitHubRepository
--------------------

### Synopsis
Updates the details of an existing repository on GitHub.

---

### Description

Updates the details of an existing repository on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub -Description 'The best way to automate your GitHub interactions'
Changes the description of the specified repository.
```
> EXAMPLE 2

```PowerShell
Set-GitHubRepository -Uri https://github.com/PowerShell/PowerShellForGitHub -Private:$false
Changes the visibility of the specified repository to be public.
```
> EXAMPLE 3

```PowerShell
Get-GitHubRepository -Uri https://github.com/PowerShell/PowerShellForGitHub |
    Set-GitHubRepository -NewName 'PoShForGitHub' -Force
Renames the repository without any user confirmation prompting.  This is identical to using
Rename-GitHubRepository -Uri https://github.com/PowerShell/PowerShellForGitHub -NewName 'PoShForGitHub' -Confirm:$false
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

#### **NewName**
Rename the repository to this new name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Description**
A short description of the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Homepage**
A URL with more information about the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DefaultBranch**
Update the default branch for this repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SecretScanning**
Specifies whether to enable or disable secret scanning for the repository.
Valid Values:

* Enabled
* Disabled

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Private**
Specify this to make the repository private.
To change a repository to be public, specify -Private:$false

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoIssues**
By default, this repository will support Issues.  Specify this to disable Issues.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoProjects**
By default, this repository will support Projects.  Specify this to disable Projects.
If you're creating a repository in an organization that has disabled repository projects,
this will be true by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoWiki**
By default, this repository will have a Wiki.  Specify this to disable the Wiki.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HasDiscussions**
By default, this repository will not have Discussions.  Specify this to enable Discussions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisallowSquashMerge**
By default, squash-merging pull requests will be allowed.
Specify this to disallow.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisallowMergeCommit**
By default, merging pull requests with a merge commit will be allowed.
Specify this to disallow.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisallowRebaseMerge**
By default, rebase-merge pull requests will be allowed.
Specify this to disallow.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SquashMergeCommitTitle**
Specifies the default value for a squash merge commit title. This can be one of the
following values:
* PRTitle - default to the pull request's title.
* CommitOrPRTitle - default to the commit's title (if only one commit) or the pull
  request's title (when more than one commit).
Valid Values:

* PRTitle
* CommitOrPRTitle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SquashMergeCommitMessage**
Specifies the default value for a squash merge commit message. This can be one of the
following values:
* PRBody - default to the pull request's body.
* CommitMessages - default to the branch's commit messages.
* Blank - default to a blank commit message.
Valid Values:

* PRBody
* CommitMessages
* Blank

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MergeCommitTitle**
Specifies the default value for a merge commit title. This can be one of the
following values:
* PRTitle - default to the pull request's title.
* MergeMessage - default to the classic title for a merge message (e.g., Merge pull request
  #123 from branch-name).
Valid Values:

* PRTitle
* MergeMessage

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MergeCommitMessage**
Specifies the default vaule for a merge commit message. This can be one of the
following values:
* PRTitle - default to the pull request's title.
* PRBody - default to the pull request's body.
* Blank - default to a blank commit message.
Valid Values:

* PRTitle
* PRBody
* Blank

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AllowAutoMerge**
Specifies whether to allow auto-merge on pull requests.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowUpdateBranch**
Specifies whether to always allow a pull request head branch that is behind its base branch
to be updated even if it is not required to be up-to-date before merging.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DeleteBranchOnMerge**
Specifies the automatic deleting of head branches when pull requests are merged.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsTemplate**
Specifies whether the repository is made available as a template.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WebCommitSignoffRequired**
Specifies whether to require contributors to sign off on web-based commits.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Archived**
Specify this to archive this repository.
NOTE: You cannot unarchive repositories through the API / this module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
If this switch is specified, you will not be prompted for confirmation of command execution
when renaming the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Returns the updated GitHub Repository.  By default, this cmdlet does not generate any output.
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
Set-GitHubRepository [-OwnerName <String>] [-RepositoryName <String>] [-NewName <String>] [-Description <String>] [-Homepage <String>] [-DefaultBranch <String>] [-SecretScanning <String>] [-Private] [-NoIssues] [-NoProjects] [-NoWiki] [-HasDiscussions] [-DisallowSquashMerge] [-DisallowMergeCommit] [-DisallowRebaseMerge] [-SquashMergeCommitTitle <String>] [-SquashMergeCommitMessage <String>] [-MergeCommitTitle <String>] [-MergeCommitMessage <String>] [-AllowAutoMerge] [-AllowUpdateBranch] [-DeleteBranchOnMerge] [-IsTemplate] [-WebCommitSignoffRequired] [-Archived] [-Force] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubRepository -Uri <String> [-NewName <String>] [-Description <String>] [-Homepage <String>] [-DefaultBranch <String>] [-SecretScanning <String>] [-Private] [-NoIssues] [-NoProjects] [-NoWiki] [-HasDiscussions] [-DisallowSquashMerge] [-DisallowMergeCommit] [-DisallowRebaseMerge] [-SquashMergeCommitTitle <String>] [-SquashMergeCommitMessage <String>] [-MergeCommitTitle <String>] [-MergeCommitMessage <String>] [-AllowAutoMerge] [-AllowUpdateBranch] [-DeleteBranchOnMerge] [-IsTemplate] [-WebCommitSignoffRequired] [-Archived] [-Force] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
