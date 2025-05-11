Get-GitHubTeamMember
--------------------

### Synopsis
Retrieve list of team members within an organization.

---

### Description

Retrieve list of team members within an organization.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
$members = Get-GitHubTeamMember -Organization PowerShell -TeamName Everybody
```

---

### Parameters
#### **OrganizationName**
The name of the organization.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **TeamName**
The name of the team in the organization.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **TeamSlug**
The slug (a unique key based on the team name) of the team in the organization.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

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
GitHub.Release
GitHub.ReleaseAsset
GitHub.Repository
GitHub.Team

---

### Outputs
* GitHub.User

---

### Syntax
```PowerShell
Get-GitHubTeamMember -OrganizationName <String> -TeamSlug <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubTeamMember -OrganizationName <String> -TeamName <String> [-AccessToken <String>] [<CommonParameters>]
```
