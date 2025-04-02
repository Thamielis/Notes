Add-GitHubIssueLabel
--------------------

### Synopsis
Adds a label to an issue in the given GitHub repository.

---

### Description

Adds a label to an issue in the given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Add-GitHubIssueLabel -OwnerName microsoft -RepositoryName PowerShellForGitHub -Issue 1 -Label $labels
Adds labels to an issue in the PowerShellForGitHub project.
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

#### **Issue**
Issue number to add the label to.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Int64]`|true    |named   |true (ByPropertyName)|IssueNumber|

#### **Label**
Array of label names to add to the issue

|Type        |Required|Position|PipelineInput                 |Aliases  |
|------------|--------|--------|------------------------------|---------|
|`[String[]]`|true    |named   |true (ByValue, ByPropertyName)|LabelName|

#### **PassThru**
Returns the added Label.  By default, this cmdlet does not generate any output.
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
* GitHub.Label

---

### Notes
This is implemented as a function rather than a filter because the ValueFromPipeline
parameter (Name) is itself an array which we want to ensure is processed only a single time.
This API endpoint doesn't add labels to a repository, it replaces the existing labels with
the new set provided, so we need to make sure that we have all the requested labels available
to us at the time that the API endpoint is called.

---

### Syntax
```PowerShell
Add-GitHubIssueLabel -OwnerName <String> -RepositoryName <String> -Issue <Int64> -Label <String[]> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Add-GitHubIssueLabel -Uri <String> -Issue <Int64> -Label <String[]> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
