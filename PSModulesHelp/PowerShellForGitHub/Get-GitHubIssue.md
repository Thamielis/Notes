Get-GitHubIssue
---------------

### Synopsis
Retrieve Issues from GitHub.

---

### Description

Retrieve Issues from GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubIssue -OwnerName microsoft -RepositoryName PowerShellForGitHub -State Open
Gets all the currently open issues in the microsoft\PowerShellForGitHub repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubIssue -OwnerName microsoft -RepositoryName PowerShellForGitHub -State All -Assignee Octocat
Gets every issue in the microsoft\PowerShellForGitHub repository that is assigned to Octocat.
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

#### **OrganizationName**
The organization whose issues should be retrieved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **RepositoryType**
all: Retrieve issues across owned, member and org repositories
ownedAndMember: Retrieve issues across owned and member repositories
Valid Values:

* All
* OwnedAndMember

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Issue**
The number of specific Issue to retrieve.  If not supplied, will return back all
Issues for this Repository that match the specified criteria.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Int64]`|false   |named   |true (ByPropertyName)|IssueNumber|

#### **IgnorePullRequests**
GitHub treats Pull Requests as Issues.  Specify this switch to skip over any
Issue that is actually a Pull Request.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Filter**
Indicates the type of Issues to return:
assigned: Issues assigned to the authenticated user.
created: Issues created by the authenticated user.
mentioned: Issues mentioning the authenticated user.
subscribed: Issues the authenticated user has been subscribed to updates for.
all: All issues the authenticated user can see, regardless of participation or creation.
Valid Values:

* Assigned
* Created
* Mentioned
* Subscribed
* All

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **State**
Indicates the state of the issues to return.
Valid Values:

* Open
* Closed
* All

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Label**
The label (or labels) that returned Issues should have.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Sort**
The property to sort the returned Issues by.
Valid Values:

* Created
* Updated
* Comments

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Direction**
The direction of the sort.
Valid Values:

* Ascending
* Descending

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Since**
If specified, returns only issues updated at or after this time.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **MilestoneType**
If specified, indicates what milestone Issues must be a part of to be returned:
  specific: Only issues with the milestone specified via the Milestone parameter will be returned.
  all: All milestones will be returned.
  none: Only issues without milestones will be returned.
Valid Values:

* Specific
* All
* None

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MilestoneNumber**
Only issues with this milestone will be returned.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **AssigneeType**
If specified, indicates who Issues must be assigned to in order to be returned:
  specific: Only issues assigned to the user specified by the Assignee parameter will be returned.
  all: Issues assigned to any user will be returned.
  none: Only issues without an assigned user will be returned.
Valid Values:

* Specific
* All
* None

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Assignee**
Only issues assigned to this user will be returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Creator**
Only issues created by this specified user will be returned.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |named   |true (ByPropertyName)|UserName|

#### **Mentioned**
Only issues that mention this specified user will be returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MediaType**
The format in which the API will return the body of the issue.
Raw  - Return the raw markdown body.
       Response will include body.
       This is the default if you do not pass any specific media type.
Text - Return a text only representation of the markdown body.
       Response will include body_text.
Html - Return HTML rendered from the body's markdown.
       Response will include body_html.
Full - Return raw, text and HTML representations.
       Response will include body, body_text, and body_html.
Valid Values:

* Raw
* Text
* Html
* Full

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
GitHub.User

---

### Outputs
* GitHub.Issue

---

### Syntax
```PowerShell
Get-GitHubIssue [-OwnerName <String>] [-RepositoryName <String>] [-OrganizationName <String>] [-RepositoryType <String>] [-Issue <Int64>] [-IgnorePullRequests] [-Filter <String>] [-State <String>] [-Label <String[]>] [-Sort <String>] [-Direction <String>] [-Since <DateTime>] [-MilestoneType <String>] [-MilestoneNumber <Int64>] [-AssigneeType <String>] [-Assignee <String>] [-Creator <String>] [-Mentioned <String>] [-MediaType <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubIssue -Uri <String> [-OrganizationName <String>] [-RepositoryType <String>] [-Issue <Int64>] [-IgnorePullRequests] [-Filter <String>] [-State <String>] [-Label <String[]>] [-Sort <String>] [-Direction <String>] [-Since <DateTime>] [-MilestoneType <String>] [-MilestoneNumber <Int64>] [-AssigneeType <String>] [-Assignee <String>] [-Creator <String>] [-Mentioned <String>] [-MediaType <String>] [-AccessToken <String>] [<CommonParameters>]
```
