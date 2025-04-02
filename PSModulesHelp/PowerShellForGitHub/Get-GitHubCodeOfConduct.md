Get-GitHubCodeOfConduct
-----------------------

### Synopsis
Gets Codes of Conduct or a specific Code of Conduct from GitHub.

---

### Description

Gets Codes of Conduct or a specific Code of Conduct from GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubCodeOfConduct
Returns metadata about popular Codes of Conduct
```
> EXAMPLE 2

```PowerShell
Get-GitHubCodeOfConduct -Key citizen_code_of_conduct
Gets the content of the 'Citizen Code of Conduct'
```
> EXAMPLE 3

Get-GitHubCodeOfConduct -OwnerName microsoft -RepositoryName PowerShellForGitHub
Gets the content of the Code of Conduct file for the microsoft\PowerShellForGitHub repository
if one is detected.

It may be necessary to convert the content of the file.  Check the 'encoding' property of
the result to know how 'content' is encoded.  As an example, to convert from Base64, do
the following:

[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($result.content))

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

#### **Key**
The unique key of the Code of Conduct to retrieve the content for.  If not specified, all
Codes of Conduct will be returned.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|true    |named   |true (ByPropertyName)|CodeOfConductKey|

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
[String]
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
* GitHub.CodeOfConduct

---

### Syntax
```PowerShell
Get-GitHubCodeOfConduct [-OwnerName <String>] [-RepositoryName <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubCodeOfConduct -Uri <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubCodeOfConduct -Key <String> [-AccessToken <String>] [<CommonParameters>]
```
