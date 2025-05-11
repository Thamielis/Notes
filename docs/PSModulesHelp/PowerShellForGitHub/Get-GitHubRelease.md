Get-GitHubRelease
-----------------

### Synopsis
Retrieves information about a release or list of releases on GitHub.

---

### Description

Retrieves information about a release or list of releases on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRelease
Gets all releases for the default configured owner/repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubRelease -Release 12345
Get a specific release for the default configured owner/repository
```
> EXAMPLE 3

```PowerShell
Get-GitHubRelease -OwnerName dotnet -RepositoryName core
Gets all releases from the dotnet\core repository.
```
> EXAMPLE 4

```PowerShell
Get-GitHubRelease -Uri https://github.com/microsoft/PowerShellForGitHub
Gets all releases from the microsoft/PowerShellForGitHub repository.
```
> EXAMPLE 5

```PowerShell
Get-GitHubRelease -OwnerName dotnet -RepositoryName core -Latest
Gets the latest release from the dotnet\core repository.
```
> EXAMPLE 6

```PowerShell
Get-GitHubRelease -Uri https://github.com/microsoft/PowerShellForGitHub -Tag 0.8.0
Gets the release tagged with 0.8.0 from the microsoft/PowerShellForGitHub repository.
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

#### **Release**
The ID of a specific release.
This is an optional parameter which can limit the results to a single release.

|Type     |Required|Position|PipelineInput        |Aliases  |
|---------|--------|--------|---------------------|---------|
|`[Int64]`|true    |named   |true (ByPropertyName)|ReleaseId|

#### **Latest**
Retrieve only the latest release.
This is an optional parameter which can limit the results to a single release.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Tag**
Retrieves a list of releases with the associated tag.
This is an optional parameter which can filter the list of releases.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

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
* GitHub.Release

---

### Notes
Information about published releases are available to everyone. Only users with push
access will receive listings for draft releases.

---

### Syntax
```PowerShell
Get-GitHubRelease [-OwnerName <String>] [-RepositoryName <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRelease [-OwnerName <String>] [-RepositoryName <String>] -Tag <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRelease [-OwnerName <String>] [-RepositoryName <String>] -Latest [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRelease [-OwnerName <String>] [-RepositoryName <String>] -Release <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRelease -Uri <String> -Tag <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRelease -Uri <String> -Latest [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRelease -Uri <String> -Release <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRelease -Uri <String> [-AccessToken <String>] [<CommonParameters>]
```
