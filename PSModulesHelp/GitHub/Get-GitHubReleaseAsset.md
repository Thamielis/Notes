Get-GitHubReleaseAsset
----------------------

### Synopsis
List release assets based on a release ID or asset ID

---

### Description

If an asset ID is provided, the asset is returned.
If a release ID is provided, all assets for the release are returned.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubReleaseAsset -Owner 'octocat' -Repository 'hello-world' -ID '1234567'
Gets the release asset with the ID '1234567' for the repository 'octocat/hello-world'.
```
> EXAMPLE 2

```PowerShell
Get-GitHubReleaseAsset -Owner 'octocat' -Repository 'hello-world' -ReleaseID '7654321'
Gets the release assets for the release with the ID '7654321' for the repository 'octocat/hello-world'.
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

#### **ID**
The unique identifier of the asset.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |named   |false        |asset_id|

#### **ReleaseID**
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
[Get a release asset](https://docs.github.com/rest/releases/assets#get-a-release-asset)

---

### Syntax
```PowerShell
Get-GitHubReleaseAsset -Owner <String> -Repository <String> [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubReleaseAsset -Owner <String> -Repository <String> -ID <String> [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubReleaseAsset -Owner <String> -Repository <String> -ReleaseID <String> [-Context <Object>] [<CommonParameters>]
```
