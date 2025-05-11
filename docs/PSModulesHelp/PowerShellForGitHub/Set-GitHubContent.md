Set-GitHubContent
-----------------

### Synopsis
Sets the contents of a file or directory in a repository on GitHub.

---

### Description

Sets the contents of a file or directory in a repository on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubContent -OwnerName microsoft -RepositoryName PowerShellForGitHub -Path README.md -CommitMessage 'Adding README.md' -Content '# README' -BranchName master
Sets the contents of the README.md file on the master branch of the PowerShellForGithub repository.
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
Uri for the repository.
The OwnerName and RepositoryName will be extracted from here instead of needing to provide
them individually.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |2       |true (ByPropertyName)|RepositoryUrl|

#### **Path**
The file path for which to set contents.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **CommitMessage**
The Git commit message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

#### **Content**
The new file content.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |5       |false        |

#### **Sha**
The SHA value of the current file if present. If this parameter is not provided, and the
file currently exists in the specified branch of the repo, it will be read to obtain this
value.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **BranchName**
The branch, or defaults to the default branch if not specified.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CommitterName**
The name of the committer of the commit. Defaults to the name of the authenticated user if
not specified. If specified, CommiterEmail must also be specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CommitterEmail**
The email of the committer of the commit. Defaults to the email of the authenticated user
if not specified. If specified, CommitterName must also be specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AuthorName**
The name of the author of the commit. Defaults to the name of the authenticated user if
not specified. If specified, AuthorEmail must also be specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AuthorEmail**
The email of the author of the commit. Defaults to the email of the authenticated user if
not specified. If specified, AuthorName must also be specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PassThru**
Returns the updated GitHub Content.  By default, this cmdlet does not generate any output.
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
GitHub.Release
GitHub.Repository

---

### Outputs
* GitHub.Content

---

### Syntax
```PowerShell
Set-GitHubContent -OwnerName <String> -RepositoryName <String> [-Path] <String> [-CommitMessage] <String> [-Content] <String> [-Sha <String>] [-BranchName <String>] [-CommitterName <String>] [-CommitterEmail <String>] [-AuthorName <String>] [-AuthorEmail <String>] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubContent [-Uri] <String> [-Path] <String> [-CommitMessage] <String> [-Content] <String> [-Sha <String>] [-BranchName <String>] [-CommitterName <String>] [-CommitterEmail <String>] [-AuthorName <String>] [-AuthorEmail <String>] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
