New-GitHubReleaseNote
---------------------

### Synopsis
List releases

---

### Description

Generate a name and body describing a [release](https://docs.github.com/en/rest/releases/releases#get-a-release).
The body content will be Markdown formatted and contain information like
the changes since last release and users who contributed. The generated release notes are not saved anywhere. They are
intended to be generated and used when creating a new release.

---

### Examples
> EXAMPLE 1

```PowerShell
$params = @{
    Owner                 = 'octocat'
    Repo                  = 'hello-world'
    TagName               = 'v1.0.0'
}
New-GitHubReleaseNote @params
Creates a new release notes draft for the repository 'hello-world' owned by 'octocat' with the tag name 'v1.0.0'.
In this example the tag 'v1.0.0' has to exist in the repository.
The configuration file '.github/release.yml' or '.github/release.yaml' will be used.
```
> EXAMPLE 2

```PowerShell
$params = @{
    Owner                 = 'octocat'
    Repo                  = 'hello-world'
    TagName               = 'v1.0.0'
    TargetCommitish       = 'main'
}
New-GitHubReleaseNote @params
Creates a new release notes draft for the repository 'hello-world' owned by 'octocat' with the tag name 'v1.0.0'.
In this example the tag 'v1.0.0' has to exist in the repository.
```
> EXAMPLE 3

$params = @{
    Owner                 = 'octocat'
    Repo                  = 'hello-world'
    TagName               = 'v1.0.0'
    TargetCommitish       = 'main'
    PreviousTagName       = 'v0.9.2'
    ConfigurationFilePath = '.github/custom_release_config.yml'
}
New-GitHubReleaseNote @params
Creates a new release notes draft for the repository 'hello-world' owned by 'octocat' with the tag name 'v1.0.0'.
The release notes will be based on the changes between the tags 'v0.9.2' and 'v1.0.0' and generated based on the
configuration file located in the repository at '.github/custom_release_config.yml'.

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
The tag name for the release. This can be an existing tag or a new one.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |3       |false        |tag_name|

#### **TargetCommitish**
Specifies the commitish value that will be the target for the release's tag.
Required if the supplied tag_name does not reference an existing tag.
Ignored if the tag_name already exists.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|false   |4       |false        |target_commitish|

#### **PreviousTagName**
The name of the previous tag to use as the starting point for the release notes.
Use to manually specify the range for the set of changes considered as part this release.

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[String]`|false   |5       |false        |previous_tag_name|

#### **ConfigurationFilePath**
Specifies a path to a file in the repository containing configuration settings used for generating the release notes.
If unspecified, the configuration file located in the repository at '.github/release.yml' or '.github/release.yaml' will be used.
If that is not present, the default configuration will be used.

|Type      |Required|Position|PipelineInput|Aliases                |
|----------|--------|--------|-------------|-----------------------|
|`[String]`|false   |6       |false        |configuration_file_path|

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

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[Generate release notes content for a release](https://docs.github.com/rest/releases/releases#list-releases)

---

### Syntax
```PowerShell
New-GitHubReleaseNote [-Owner] <String> [-Repository] <String> [-TagName] <String> [[-TargetCommitish] <String>] [[-PreviousTagName] <String>] [[-ConfigurationFilePath] <String>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
