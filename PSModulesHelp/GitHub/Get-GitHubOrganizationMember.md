Get-GitHubOrganizationMember
----------------------------

### Synopsis
List organization members

---

### Description

List all users who are members of an organization.
If the authenticated user is also a member of this organization then both concealed and public members will be returned.

---

### Parameters
#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Filter**
Filter members returned in the list.
`2fa_disabled` means that only members without two-factor authentication enabled will be returned.
This options is only available for organization owners.
Valid Values:

* 2fa_disabled
* all

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Role**
Filter members returned by their role.
Valid Values:

* all
* admin
* member

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

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

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[List organization members](https://docs.github.com/en/rest/orgs/members?apiVersion=2022-11-28#list-organization-members)

---

### Syntax
```PowerShell
Get-GitHubOrganizationMember [-Organization] <String> [[-Filter] <String>] [[-Role] <String>] [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
