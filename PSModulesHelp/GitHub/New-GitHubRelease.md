New-GitHubRelease
-----------------

### Synopsis
Create a release

---

### Description

Users with push access to the repository can create a release.
This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
Creating content too quickly using this endpoint may result in secondary rate limiting.
See "[Secondary rate limits](https://docs.github.com/rest/overview/resources-in-the-rest-api#secondary-rate-limits)"
and "[Dealing with secondary rate limits](https://docs.github.com/rest/guides/best-practices-for-integrators#dealing-with-secondary-rate-limits)" for details.

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubRelease -Owner 'octocat' -Repository 'hello-world' -TagName 'v1.0.0' -TargetCommitish 'main' -Body 'Release notes'
Creates a release for the repository 'octocat/hello-world' with the tag 'v1.0.0' and the target commitish 'main'.
```

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|true    |1       |false        |User<br/>Organization|

#### **Repository**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **TagName**
The name of the tag.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |3       |false        |tag_name|

#### **TargetCommitish**
Specifies the commitish value that determines where the Git tag is created from.
Can be any branch or commit SHA. Unused if the Git tag already exists.
API Default: the repository's default branch.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|false   |4       |false        |target_commitish|

#### **Name**
The name of the release.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Body**
Text describing the contents of the tag.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Draft**
Whether the release is a draft.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Prerelease**
Whether to identify the release as a prerelease.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DiscussionCategoryName**
If specified, a discussion of the specified category is created and linked to the release.
The value must be a category that already exists in the repository.
For more information, see [Managing categories for discussions in your repository](https://docs.github.com/discussions/managing-discussions-for-your-community/managing-categories-for-discussions-in-your-repository).

|Type      |Required|Position|PipelineInput|Aliases                 |
|----------|--------|--------|-------------|------------------------|
|`[String]`|false   |7       |false        |discussion_category_name|

#### **GenerateReleaseNotes**
Whether to automatically generate the name and body for this release. If name is specified, the specified name will be used; otherwise,a name will be automatically generated. If body is specified, the body will be pre-pended to the automatically generated notes.

|Type      |Required|Position|PipelineInput|Aliases               |
|----------|--------|--------|-------------|----------------------|
|`[Switch]`|false   |named   |false        |generate_release_notes|

#### **MakeLatest**
Specifies whether this release should be set as the latest release for the repository. Drafts and prereleases cannot be set as latest. Defaults to true for newly published releases. legacy specifies that the latest release should be determined based on the release creation date and higher semantic version.
Valid Values:

* true
* false
* legacy

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |8       |false        |make_latest|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[Create a release](https://docs.github.com/rest/releases/releases#create-a-release)

---

### Syntax
```PowerShell
New-GitHubRelease [-Owner] <String> [-Repository] <String> [-TagName] <String> [[-TargetCommitish] <String>] [[-Name] <String>] [[-Body] <String>] [-Draft] [-Prerelease] [[-DiscussionCategoryName] <String>] [-GenerateReleaseNotes] [[-MakeLatest] <String>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
