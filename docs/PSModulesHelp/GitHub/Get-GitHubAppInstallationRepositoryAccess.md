Get-GitHubAppInstallationRepositoryAccess
-----------------------------------------

### Synopsis
Get the repositories accessible to a given GitHub App installation.

---

### Description

Lists the repositories accessible to a given GitHub App installation on an enterprise-owned organization.

The authenticated GitHub App must be installed on the enterprise and be granted the Enterprise/organization_installations (read) permission.

---

### Examples
> EXAMPLE 1

```PowerShell
$params = @{
    Enterprise          = 'msx'
    Organization        = 'PSModule'
    InstallationID      = 12345678
}
Get-GitHubAppInstallationRepositoryAccess @params
Get the repositories accessible to the GitHub App installation
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

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

---

### Syntax
```PowerShell
Get-GitHubAppInstallationRepositoryAccess [-Enterprise] <String> [-Organization] <String> [-ID] <Int32> [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
