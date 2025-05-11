Get-GitHubReleaseAsset
----------------------

### Synopsis
Gets a a list of assets for a release, or downloads a single release asset.

---

### Description

Gets a a list of assets for a release, or downloads a single release asset.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubReleaseAsset -OwnerName microsoft -RepositoryName PowerShellForGitHub -Release 1234567890
Gets a list of all the assets associated with this release
```
> EXAMPLE 2

```PowerShell
Get-GitHubReleaseAsset -OwnerName microsoft -RepositoryName PowerShellForGitHub -Asset 1234567890 -Path 'c:\users\PowerShellForGitHub\downloads\asset.zip' -Force
Downloads the asset 1234567890 to 'c:\users\PowerShellForGitHub\downloads\asset.zip' and
overwrites the file that may already be there.
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
|`[String]`|true    |2       |true (ByPropertyName)|RepositoryUrl|

#### **Release**
The ID of a specific release to see the assets for.

|Type     |Required|Position|PipelineInput        |Aliases  |
|---------|--------|--------|---------------------|---------|
|`[Int64]`|true    |2       |true (ByPropertyName)|ReleaseId|

#### **Asset**
The ID of the specific asset to download.

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int64]`|true    |2       |true (ByPropertyName)|AssetId|

#### **Path**
The path where the downloaded asset should be stored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Force**
If specified, will overwrite any file located at Path when downloading Asset.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

---

### Outputs
* GitHub.ReleaseAsset

---

### Syntax
```PowerShell
Get-GitHubReleaseAsset [-OwnerName <String>] [-RepositoryName <String>] [-Asset] <Int64> [-Path] <String> [-Force] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubReleaseAsset [-OwnerName <String>] [-RepositoryName <String>] [-Asset] <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubReleaseAsset [-OwnerName <String>] [-RepositoryName <String>] [-Release] <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubReleaseAsset [-Uri] <String> [-Release] <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubReleaseAsset [-Uri] <String> [-Asset] <Int64> [-Path] <String> [-Force] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubReleaseAsset [-Uri] <String> [-Asset] <Int64> [-AccessToken <String>] [<CommonParameters>]
```
