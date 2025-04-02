Get-GitHubLicense
-----------------

### Synopsis
Gets a license list or license content from GitHub.

---

### Description

Gets a license list or license content from GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubLicense
Returns metadata about popular open source licenses
```
> EXAMPLE 2

```PowerShell
Get-GitHubLicense -Key mit
Gets the content of the mit license file
```
> EXAMPLE 3

```PowerShell
Get-GitHubLicense -OwnerName microsoft -RepositoryName PowerShellForGitHub
Gets the content of the license file for the microsoft\PowerShellForGitHub repository.
It may be necessary to convert the content of the file.  Check the 'encoding' property of
the result to know how 'content' is encoded.  As an example, to convert from Base64, do
the following:

[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($result.content))
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

#### **Key**
The key of the license to retrieve the content for.  If not specified, all licenses
will be returned.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |named   |true (ByPropertyName)|LicenseKey|

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
* GitHub.License

---

### Syntax
```PowerShell
Get-GitHubLicense [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubLicense [-OwnerName <String>] [-RepositoryName <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubLicense -Uri <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubLicense -Key <String> [-AccessToken <String>] [<CommonParameters>]
```
