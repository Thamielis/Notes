Get-GitHubOrganization
----------------------

### Synopsis
List organization

---

### Description

List organizations for the authenticated user - if no parameters are provided.
List organizations for a user - if a username is provided.
Lists all organizations, in the order that they were created on GitHub - if '-All' is provided.
Get an organization - if a organization name is provided.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubOrganization
List organizations for the authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubOrganization -Username 'octocat'
List public organizations for the user 'octocat'.
```
> EXAMPLE 3

```PowerShell
Get-GitHubOrganization -All -Since 142951047
List organizations, starting with PSModule.
```
> EXAMPLE 4

```PowerShell
Get-GitHubOrganization -Name 'PSModule'
Get the organization 'PSModule'.
```

---

### Parameters
#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Username**
The handle for the GitHub user account.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **All**
List all organizations. Use '-Since' to start at a specific organization ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Since**
A organization ID. Only return organizations with an ID greater than this ID.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[List organizations](https://docs.github.com/rest/orgs/orgs)

---

### Syntax
```PowerShell
Get-GitHubOrganization [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubOrganization -Organization <String> [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubOrganization -Username <String> [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubOrganization -All [-Since <Int32>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubOrganization [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
