Add-GitHubAppInstallationRepositoryAccess
-----------------------------------------

### Synopsis
Grant repository access to an organization installation.

---

### Description

Grant repository access to an organization installation.

---

### Examples
> EXAMPLE 1

```PowerShell
$params = @{
    Enterprise          = 'msx'
    Organization        = 'PSModule'
    InstallationID      = 12345678
    Repositories        = 'repo1', 'repo2'
}
Add-GitHubAppInstallationRepositoryAccess @params
Grant access to the repositories 'repo1' and 'repo2' for the installation
with the ID '12345678' on the organization 'PSModule' in the enterprise 'msx'.
```

---

### Parameters
#### **Enterprise**
The enterprise slug or ID.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ID**
The unique identifier of the installation.
Example: '12345678'

|Type     |Required|Position|PipelineInput        |Aliases                           |
|---------|--------|--------|---------------------|----------------------------------|
|`[Int32]`|true    |3       |true (ByPropertyName)|installation_id<br/>InstallationID|

#### **Repositories**
The names of the repositories to which the installation will be granted access.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Add-GitHubAppInstallationRepositoryAccess [-Enterprise] <String> [-Organization] <String> [-ID] <Int32> [[-Repositories] <String[]>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
