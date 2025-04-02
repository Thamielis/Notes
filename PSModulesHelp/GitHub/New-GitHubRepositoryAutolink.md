New-GitHubRepositoryAutolink
----------------------------

### Synopsis
Create an autolink reference for a repository

---

### Description

Users with admin access to the repository can create an autolink.

---

### Examples
> EXAMPLE 1

'
Creates an autolink for the repository 'Hello-World' owned by 'octocat' that links to <https://www.example.com/issue/123>
when the prefix 'GH-' is found in an issue, pull request, or commit.

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

#### **KeyPrefix**
This prefix appended by certain characters will generate a link any time it is found in an issue, pull request, or commit.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |3       |false        |key_prefix|

#### **UrlTemplate**
The URL must contain <num> for the reference number. <num> matches different characters depending on the value of is_alphanumeric.

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[String]`|true    |4       |false        |url_template|

#### **IsAlphanumeric**
Whether this autolink reference matches alphanumeric characters. If true, the <num> parameter of the url_template matches alphanumeric
characters A-Z (case insensitive), 0-9, and -. If false, this autolink reference only matches numeric characters.

|Type       |Required|Position|PipelineInput|Aliases        |
|-----------|--------|--------|-------------|---------------|
|`[Boolean]`|false   |5       |false        |is_alphanumeric|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

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
[Create an autolink reference for a repository](https://docs.github.com/rest/repos/autolinks#create-an-autolink-reference-for-a-repository)

---

### Syntax
```PowerShell
New-GitHubRepositoryAutolink [-Owner] <String> [-Repository] <String> [-KeyPrefix] <String> [-UrlTemplate] <String> [[-IsAlphanumeric] <Boolean>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
