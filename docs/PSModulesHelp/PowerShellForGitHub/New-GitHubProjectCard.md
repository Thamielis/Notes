New-GitHubProjectCard
---------------------

### Synopsis
Creates a new card for a GitHub project.

---

### Description

Creates a new card for a GitHub project.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubProjectCard -Column 999999 -Note 'Note on card'
Creates a card on column 999999 with the note 'Note on card'.
```
> EXAMPLE 2

```PowerShell
New-GitHubProjectCard -Column 999999 -IssueId 888888
Creates a card on column 999999 for the issue with ID 888888.
```
> EXAMPLE 3

```PowerShell
New-GitHubProjectCard -Column 999999 -PullRequestId 888888
Creates a card on column 999999 for the pull request with ID 888888.
```

---

### Parameters
#### **Column**
ID of the column to create a card for.

|Type     |Required|Position|PipelineInput        |Aliases |
|---------|--------|--------|---------------------|--------|
|`[Int64]`|true    |named   |true (ByPropertyName)|ColumnId|

#### **Note**
The name of the column to create.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |Content|

#### **IssueId**
The ID of the issue you want to associate with this card (not to be confused with
the Issue _number_ which you see in the URL and can refer to with a hashtag).

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |named   |true (ByPropertyName)|

#### **PullRequestId**
The ID of the pull request you want to associate with this card (not to be confused with
the Pull Request _number_ which you see in the URL and can refer to with a hashtag).

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |named   |true (ByPropertyName)|

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
GitHub.IssueComment
GitHub.Issue
GitHub.PullRequest
GitHub.ProjectCard
GitHub.ProjectColumn

---

### Outputs
* GitHub.ProjectCard

---

### Syntax
```PowerShell
New-GitHubProjectCard -Column <Int64> -Note <String> [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubProjectCard -Column <Int64> -IssueId <Int64> [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubProjectCard -Column <Int64> -PullRequestId <Int64> [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
