Get-GitHubAppAccessibleRepository
---------------------------------

### Synopsis
Get repositories belonging to an enterprise owned organization that can be made accessible to a GitHub App

---

### Description

List the repositories belonging to an enterprise owned organization that can be made accessible to a GitHub App installed on that
organization.

The authenticated GitHub App must be installed on the enterprise and be granted the Enterprise/enterprise_organization_installations (read)
permission.

---

### Examples
> EXAMPLE 1

```PowerShell
$params = @{
    Enterprise   = 'msx'
    Organization = 'PSModule'
}
Get-GitHubAppAccessibleRepository @params
Get the repositories that can be made accessible to a GitHub App installed on the organization 'PSModule' in the enterprise 'msx'.
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

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

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

### Syntax
```PowerShell
Get-GitHubAppAccessibleRepository [-Enterprise] <String> [-Organization] <String> [[-PerPage] <Int32>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
