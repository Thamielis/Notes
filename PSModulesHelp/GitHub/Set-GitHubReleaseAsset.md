Set-GitHubReleaseAsset
----------------------

### Synopsis
Update a release asset

---

### Description

Users with push access to the repository can edit a release asset.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubReleaseAsset -Owner 'octocat' -Repository 'hello-world' -ID '1234567' -Name 'new_asset_name' -Label 'new_asset_label'
Updates the release asset with the ID '1234567' for the repository 'octocat/hello-world' with the new name 'new_asset_name' and
label 'new_asset_label'.
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
|`[String]`|false   |2       |false        |

#### **ID**
The unique identifier of the asset.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |3       |false        |asset_id|

#### **Name**
The name of the file asset.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Label**
An alternate short description of the asset. Used in place of the filename.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **State**
State of the release asset.
Valid Values:

* uploaded
* open

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

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
[Update a release asset](https://docs.github.com/rest/releases/assets#update-a-release-asset)

---

### Syntax
```PowerShell
Set-GitHubReleaseAsset [-Owner] <String> [[-Repository] <String>] [-ID] <String> [[-Name] <String>] [[-Label] <String>] [[-State] <String>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
