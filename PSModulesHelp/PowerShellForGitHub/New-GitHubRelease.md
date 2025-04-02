New-GitHubRelease
-----------------

### Synopsis
Create a new release for a repository on GitHub.

---

### Description

Create a new release for a repository on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubRelease -OwnerName microsoft -RepositoryName PowerShellForGitHub -Tag 0.12.0
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
|`[String]`|true    |2       |true (ByPropertyName)|RepositoryUrl|

#### **Tag**
The name of the tag.  The tag will be created around the committish if it doesn't exist
in the remote, and will need to be synced back to the local repository afterwards.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Committish**
The committish value that determines where the Git tag is created from.
Can be any branch or commit SHA.  Unused if the Git tag already exists.
Will default to the repository's default branch (usually 'master').

|Type      |Required|Position|PipelineInput|Aliases                         |
|----------|--------|--------|-------------|--------------------------------|
|`[String]`|false   |named   |false        |Commitish<br/>BranchName<br/>Sha|

#### **Name**
The name of the release.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Body**
Text describing the contents of the tag.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |named   |false        |Description|

#### **Draft**
Specifies if this should be a draft (unpublished) release or a published one.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PreRelease**
Indicates if this should be identified as a pre-release or as a full release.

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
GitHub.ReleaseAsset
GitHub.Repository

---

### Outputs
* GitHub.Release

---

### Notes
Requires push access to the repository.

This endpoind triggers notifications.  Creating content too quickly using this endpoint
may result in abuse rate limiting.

---

### Syntax
```PowerShell
New-GitHubRelease [-OwnerName <String>] [-RepositoryName <String>] [-Tag] <String> [-Committish <String>] [-Name <String>] [-Body <String>] [-Draft] [-PreRelease] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubRelease [-Uri] <String> [-Tag] <String> [-Committish <String>] [-Name <String>] [-Body <String>] [-Draft] [-PreRelease] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
