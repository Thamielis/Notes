New-GitHubRepository
--------------------

### Synopsis
Creates a new repository on GitHub.

---

### Description

Creates a new repository on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubRepository -RepositoryName MyNewRepo -AutoInit
```
> EXAMPLE 2

```PowerShell
'MyNewRepo' | New-GitHubRepository -AutoInit
```
> EXAMPLE 3

```PowerShell
New-GitHubRepository -RepositoryName MyNewRepo -Organization MyOrg -DisallowRebaseMerge
```

---

### Parameters
#### **RepositoryName**
Name of the repository to be created.

|Type      |Required|Position|PipelineInput |Aliases|
|----------|--------|--------|--------------|-------|
|`[String]`|true    |1       |true (ByValue)|Name   |

#### **OrganizationName**
Name of the organization that the repository should be created under.
If not specified, will be created under the current user's account.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Description**
A short description of the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Homepage**
A URL with more information about the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **GitIgnoreTemplate**
Desired language or platform .gitignore template to apply.
For supported values, call Get-GitHubGitIgnore.
Values are case-sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **LicenseTemplate**
Choose an open source license template that best suits your needs.
For supported values, call Get-GitHubLicense
Values are case-sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **TeamId**
The id of the team that will be granted access to this repository.
This is only valid when creating a repository in an organization.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |7       |false        |

#### **Private**
By default, this repository will be created Public.  Specify this to create
a private repository.

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

#### **AutoInit**
Specify this to create an initial commit with an empty README.

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
* 'PRTitle' - default to the pull request's title.
* 'CommitOrPRTitle' - default to the commit's title (if only one commit) or the pull
  request's title (when more than one commit).
Valid Values:

* PRTitle
* CommitOrPRTitle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **SquashMergeCommitMessage**
Specifies the default value for a squash merge commit message. This can be one of the
following values:
* 'PRBody' - default to the pull request's body.
* 'CommitMessages' - default to the branch's commit messages.
* Blank - default to a blank commit message.
Valid Values:

* PRBody
* CommitMessages
* Blank

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **MergeCommitTitle**
Specifies the default value for a merge commit title. This can be one of the
following values:
* 'PRTitle' - default to the pull request's title.
* 'MergeMessage' - default to the classic title for a merge message (e.g., Merge pull request
  #123 from branch-name).
Valid Values:

* PRTitle
* MergeMessage

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **MergeCommitMessage**
Specifies the default vaule for a merge commit message. This can be one of the
following values:
* 'PRTitle' - default to the pull request's title.
* 'PRBody' - default to the pull request's body.
* 'Blank' - default to a blank commit message.
Valid Values:

* PRTitle
* PRBody
* Blank

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

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

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

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
GitHub.ReleaseAsset
GitHub.Repository

---

### Outputs
* GitHub.Repository

---

### Syntax
```PowerShell
New-GitHubRepository [-RepositoryName] <String> [[-OrganizationName] <String>] [[-Description] <String>] [[-Homepage] <String>] [[-GitIgnoreTemplate] <String>] [[-LicenseTemplate] <String>] [[-TeamId] <Int64>] [-Private] [-NoIssues] [-NoProjects] [-NoWiki] [-HasDiscussions] [-AutoInit] [-DisallowSquashMerge] [-DisallowMergeCommit] [-DisallowRebaseMerge] [[-SquashMergeCommitTitle] <String>] [[-SquashMergeCommitMessage] <String>] [[-MergeCommitTitle] <String>] [[-MergeCommitMessage] <String>] [-AllowAutoMerge] [-AllowUpdateBranch] [-DeleteBranchOnMerge] [-IsTemplate] [[-AccessToken] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
