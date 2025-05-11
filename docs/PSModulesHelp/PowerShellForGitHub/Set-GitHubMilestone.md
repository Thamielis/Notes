Set-GitHubMilestone
-------------------

### Synopsis
Update an existing milestone for the given repository.

---

### Description

Update an existing milestone for the given repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubMilestone -OwnerName microsoft -RepositoryName PowerShellForGitHub -Milestone 1 -Title "Testing this API"
Update an existing milestone for the microsoft\PowerShellForGitHub project.
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

#### **Milestone**
The number of a specific milestone to get.

|Type     |Required|Position|PipelineInput        |Aliases        |
|---------|--------|--------|---------------------|---------------|
|`[Int64]`|true    |named   |true (ByPropertyName)|MilestoneNumber|

#### **Title**
The title of the milestone.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **State**
The state of the milestone.
Valid Values:

* Open
* Closed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Description**
A description of the milestone.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DueOn**
The milestone due date.
GitHub will drop any time provided with this value, therefore please ensure that the
UTC version of this value has your desired date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **PassThru**
Returns the updated Milestone.  By default, this cmdlet does not generate any output.
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
* GitHub.Milestone

---

### Notes
For more information on how GitHub handles the dates specified in DueOn, please refer to
this support forum post:
https://github.community/t5/How-to-use-Git-and-GitHub/Milestone-quot-Due-On-quot-field-defaults-to-7-00-when-set-by-v3/m-p/6901

Please note that due to artifacts of how GitHub was originally designed, all timestamps
in the GitHub database are normalized to Pacific Time.  This means that any dates specified
that occur before 7am UTC will be considered timestamps for the _previous_ day.

Given that GitHub drops the _time_ aspect of this DateTime, this function will ensure that
the requested DueOn date specified is honored by manipulating the time as needed.

---

### Syntax
```PowerShell
Set-GitHubMilestone -OwnerName <String> -RepositoryName <String> -Milestone <Int64> -Title <String> [-State <String>] [-Description <String>] [-DueOn <DateTime>] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubMilestone -Uri <String> -Milestone <Int64> -Title <String> [-State <String>] [-Description <String>] [-DueOn <DateTime>] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
