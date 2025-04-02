Get-GitHubUserContextualInformation
-----------------------------------

### Synopsis
Retrieves contextual information about the specified user on GitHub.

---

### Description

Retrieves contextual information about the specified user on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubUserContextualInformation -User octocat
```
> EXAMPLE 2

```PowerShell
Get-GitHubUserContextualInformation -User octocat -RepositoryId 1300192
```
> EXAMPLE 3

```PowerShell
$repo = Get-GitHubRepository -OwnerName microsoft -RepositoryName 'PowerShellForGitHub'
$repo | Get-GitHubUserContextualInformation -User octocat
```
> EXAMPLE 4

```PowerShell
Get-GitHubIssue -OwnerName microsoft -RepositoryName PowerShellForGitHub -Issue 70 |
    Get-GitHubUserContextualInformation -User octocat
```

---

### Parameters
#### **UserName**

|Type      |Required|Position|PipelineInput                 |Aliases      |
|----------|--------|--------|------------------------------|-------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|User<br/>Name|

#### **OrganizationId**
The ID of an Organization.  When provided, this returns back the context for the user
in relation to this Organization.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |named   |true (ByPropertyName)|

#### **RepositoryId**
The ID for a Repository.  When provided, this returns back the context for the user
in relation to this Repository.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |named   |true (ByPropertyName)|

#### **IssueId**
The ID for a Issue.  When provided, this returns back the context for the user
in relation to this Issue.
NOTE: This is the *id* of the issue and not the issue *number*.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |named   |true (ByPropertyName)|

#### **PullRequestId**
The ID for a PullRequest.  When provided, this returns back the context for the user
in relation to this Pull Request.
NOTE: This is the *id* of the pull request and not the pull request *number*.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |named   |true (ByPropertyName)|

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
GitHub.Issue
GitHub.Organization
GitHub.PullRequest
GitHub.Repository
GitHub.User

---

### Outputs
* GitHub.UserContextualInformation

---

### Syntax
```PowerShell
Get-GitHubUserContextualInformation -UserName <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUserContextualInformation -UserName <String> -OrganizationId <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUserContextualInformation -UserName <String> -RepositoryId <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUserContextualInformation -UserName <String> -IssueId <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUserContextualInformation -UserName <String> -PullRequestId <Int64> [-AccessToken <String>] [<CommonParameters>]
```
