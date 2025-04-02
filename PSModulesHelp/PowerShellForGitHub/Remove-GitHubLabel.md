Remove-GitHubLabel
------------------

### Synopsis
Deletes a label from a given GitHub repository.

---

### Description

Deletes a label from a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubLabel -OwnerName microsoft -RepositoryName PowerShellForGitHub -Label TestLabel
Removes the label called "TestLabel" from the PowerShellForGitHub project.
```
> EXAMPLE 2

```PowerShell
$label = $repo | Get-GitHubLabel -Label 'Test Label' -Color '#AAAAAA'
$label | Remove-GitHubLabel
Removes the label we just created using the pipeline, but will prompt for confirmation
because neither -Confirm:$false nor -Force was specified.
```
> EXAMPLE 3

```PowerShell
Remove-GitHubLabel -OwnerName microsoft -RepositoryName PowerShellForGitHub -Label TestLabel -Confirm:$false
Removes the label called "TestLabel" from the PowerShellForGitHub project.
Will not prompt for confirmation, as -Confirm:$false was specified.
```
> EXAMPLE 4

```PowerShell
Remove-GitHubLabel -OwnerName microsoft -RepositoryName PowerShellForGitHub -Label TestLabel -Force
Removes the label called "TestLabel" from the PowerShellForGitHub project.
Will not prompt for confirmation, as -Force was specified.
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

#### **Label**
Name of the label to be deleted.
Emoji and codes are supported.  For more information, see here: https://www.webpagefx.com/tools/emoji-cheat-sheet/

|Type      |Required|Position|PipelineInput                 |Aliases  |
|----------|--------|--------|------------------------------|---------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|LabelName|

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

### Syntax
```PowerShell
Remove-GitHubLabel [-OwnerName <String>] [-RepositoryName <String>] -Label <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GitHubLabel -Uri <String> -Label <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
