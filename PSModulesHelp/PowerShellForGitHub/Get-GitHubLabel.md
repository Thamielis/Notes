Get-GitHubLabel
---------------

### Synopsis
Retrieve label(s) of a given GitHub repository.

---

### Description

Retrieve label(s) of a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubLabel -OwnerName microsoft -RepositoryName PowerShellForGitHub
Gets the information for every label from the microsoft\PowerShellForGitHub project.
```
> EXAMPLE 2

```PowerShell
Get-GitHubLabel -OwnerName microsoft -RepositoryName PowerShellForGitHub -Label TestLabel
Gets the information for the label named "TestLabel" from the microsoft\PowerShellForGitHub
project.
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
|`[String]`|true    |named   |true (ByPropertyName)|RepositoryUrl|

#### **Label**
Name of the specific label to be retrieved.  If not supplied, all labels will be retrieved.
Emoji and codes are supported.  For more information, see here: https://www.webpagefx.com/tools/emoji-cheat-sheet/

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|false   |named   |true (ByPropertyName)|LabelName|

#### **Issue**
If provided, will return all of the labels for this particular issue.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Int64]`|false   |named   |true (ByPropertyName)|IssueNumber|

#### **MilestoneNumber**
If provided, will return all of the labels assigned to issues for this particular milestone.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* GitHub.Label

---

### Notes
There were a lot of complications with the ParameterSets with this function due to pipeline
input.  For the time being, the ParameterSets have been simplified and the validation of
parameter combinations is happening within the function itself.

---

### Syntax
```PowerShell
Get-GitHubLabel [-Label <String>] [-Issue <Int64>] [-MilestoneNumber <Int64>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubLabel -OwnerName <String> -RepositoryName <String> [-Label <String>] [-Issue <Int64>] [-MilestoneNumber <Int64>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubLabel -Uri <String> [-Label <String>] [-Issue <Int64>] [-MilestoneNumber <Int64>] [-AccessToken <String>] [<CommonParameters>]
```
