Initialize-GitHubLabel
----------------------

### Synopsis
Replaces the entire set of Labels on the given GitHub repository to match the provided list
of Labels.

---

### Description

Replaces the entire set of Labels on the given GitHub repository to match the provided list
of Labels.

Will update the color/description for any Labels already in the repository that match the
name of a Label in the provided list.  All other existing Labels will be removed, and then
new Labels will be created to match the others in the Label list.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Initialize-GitHubLabel -OwnerName microsoft -RepositoryName PowerShellForGitHub -Label @(@{'name' = 'TestLabel'; 'color' = 'EEEEEE'}, @{'name' = 'critical'; 'color' = 'FF000000'; 'description' = 'Needs immediate attention'})
Removes any labels not in this Label array, ensure the current assigned color and descriptions
match what's in the array for the labels that do already exist, and then creates new labels
for any remaining ones in the Label list.

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
The array of Labels (name, color, description) that the repository should be aligning to.
A default list of labels will be used if no Labels are provided.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Object[]]`|false   |named   |true (ByPropertyName)|

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

### Notes
This method does not rename any existing labels, as it doesn't have any context regarding
which Label the new name is for.  Therefore, it is possible that by running this function
on a repository with Issues that have already been assigned Labels, you may experience data
loss as a minor correction to you (maybe fixing a typo) will result in the old Label being
removed (and thus unassigned from existing Issues) and then the new one created.

---

### Syntax
```PowerShell
Initialize-GitHubLabel [-OwnerName <String>] [-RepositoryName <String>] [-Label <Object[]>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Initialize-GitHubLabel -Uri <String> [-Label <Object[]>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
