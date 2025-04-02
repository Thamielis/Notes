Remove-GitHubReleaseAsset
-------------------------

### Synopsis
Delete a release asset

---

### Description

Delete a release asset

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubReleaseAsset -Owner 'octocat' -Repository 'hello-world' -ID '1234567'
Deletes the release asset with the ID '1234567' for the repository 'octocat/hello-world'.
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

#### **ID**
The unique identifier of the asset.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |3       |false        |asset_id|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Notes
[Delete a release asset](https://docs.github.com/rest/releases/assets#delete-a-release-asset)

---

### Syntax
```PowerShell
Remove-GitHubReleaseAsset [-Owner] <String> [-Repository] <String> [-ID] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
