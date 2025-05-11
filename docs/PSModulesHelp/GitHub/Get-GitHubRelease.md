Get-GitHubRelease
-----------------

### Synopsis
List releases

---

### Description

This returns a list of releases, which does not include regular Git tags that have not been associated with a release.
To get a list of Git tags, use the [Repository Tags API](https://docs.github.com/rest/repos/repos#list-repository-tags).
Information about published releases are available to everyone. Only users with push access will receive listings for draft releases.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRelease -Owner 'octocat' -Repository 'hello-world'
Gets the releases for the repository 'hello-world' owned by 'octocat'.
```
> EXAMPLE 2

```PowerShell
Get-GitHubRelease -Owner 'octocat' -Repository 'hello-world' -Latest
Gets the latest releases for the repository 'hello-world' owned by 'octocat'.
```
> EXAMPLE 3

```PowerShell
Get-GitHubRelease -Owner 'octocat' -Repository 'hello-world' -Tag 'v1.0.0'
Gets the release with the tag 'v1.0.0' for the repository 'hello-world' owned by 'octocat'.
```
> EXAMPLE 4

```PowerShell
Get-GitHubRelease -Owner 'octocat' -Repository 'hello-world' -ID '1234567'
Gets the release with the ID '1234567' for the repository 'hello-world' owned by 'octocat'.
```

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|true    |named   |false        |User<br/>Organization|

#### **Repository**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Latest**
Get the latest release only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Tag**
The name of the tag to get a release from.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |named   |false        |tag_name|

#### **ID**
The unique identifier of the release.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |named   |false        |release_id|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Notes
[List releases](https://docs.github.com/rest/releases/releases#list-releases)
[Get the latest release](https://docs.github.com/rest/releases/releases#get-the-latest-release)

---

### Syntax
```PowerShell
Get-GitHubRelease -Owner <String> -Repository <String> [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRelease -Owner <String> -Repository <String> -Latest [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRelease -Owner <String> -Repository <String> -Tag <String> [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRelease -Owner <String> -Repository <String> -ID <String> [-Context <Object>] [<CommonParameters>]
```
