New-GitHubReleaseAsset
----------------------

### Synopsis
Uploads a new asset for a release on GitHub.

---

### Description

Uploads a new asset for a release on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubReleaseAsset -OwnerName microsoft -RepositoryName PowerShellForGitHub -Release 123456 -Path 'c:\foo.zip'
Uploads the file located at 'c:\foo.zip' to the 123456 release in microsoft/PowerShellForGitHub
```
> EXAMPLE 2

```PowerShell
$release = New-GitHubRelease -OwnerName microsoft -RepositoryName PowerShellForGitHub -Tag 'stable'
$release | New-GitHubReleaseAsset -Path 'c:\bar.txt'
Creates a new release tagged as 'stable' and then uploads 'c:\bar.txt' as an asset for
that release.
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
|`[String]`|false   |named   |true (ByPropertyName)|RepositoryUrl|

#### **Release**
The ID of the release that the asset is for.

|Type     |Required|Position|PipelineInput        |Aliases  |
|---------|--------|--------|---------------------|---------|
|`[Int64]`|true    |2       |true (ByPropertyName)|ReleaseId|

#### **UploadUrl**
The value of 'upload_url' from getting the asset details.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Path**
The path to the file to upload as a new asset.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |named   |true (ByValue)|

#### **Label**
An alternate short description of the asset.  Used in place of the filename.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ContentType**
The MIME Media Type for the file being uploaded.  By default, this will be inferred based
on the file's extension.  If the extension is not known by this module, it will fallback to
using text/plain.  You may specify a ContentType here to override the module's logic.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
GitHub.Release
GitHub.ReleaseAsset
GitHub.Repository

---

### Outputs
* GitHub.ReleaseAsset

---

### Notes
GitHub renames asset filenames that have special characters, non-alphanumeric characters,
and leading or trailing periods. Get-GitHubReleaseAsset lists the renamed filenames.

If you upload an asset with the same filename as another uploaded asset, you'll receive
an error and must delete the old file before you can re-upload the new asset.

---

### Syntax
```PowerShell
New-GitHubReleaseAsset [-OwnerName <String>] [-RepositoryName <String>] [-Release] <Int64> -Path <String> [-Label <String>] [-ContentType <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubReleaseAsset [-Uri <String>] [-Release <Int64>] [-UploadUrl] <String> -Path <String> [-Label <String>] [-ContentType <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubReleaseAsset [-Uri] <String> [-Release] <Int64> -Path <String> [-Label <String>] [-ContentType <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
