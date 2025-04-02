Get-GitHubOrganizationPendingInvitation
---------------------------------------

### Synopsis
List pending organization invitations

---

### Description

The return hash contains a `role` field which refers to the Organization
Invitation role and will be one of the following values: `direct_member`, `admin`,
`billing_manager`, or `hiring_manager`. If the invitee is not a GitHub
member, the `login` field in the return hash will be `null`.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubOrganizationPendingInvitation -Organization 'github'
List all pending organization invitations for the organization `github`.
```
> EXAMPLE 2

```PowerShell
Get-GitHubOrganizationPendingInvitation -Organization 'github' -Role 'admin'
List all pending organization invitations for the organization `github` with the role `admin`.
```

---

### Parameters
#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Role**
Filter invitations by their member role.
Valid Values:

* all
* admin
* direct_member
* billing_manager
* hiring_manager

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **InvitationSource**
Filter invitations by their invitation source.
Valid Values:

* all
* member
* scim

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

### Notes
[List pending organization invitations](https://docs.github.com/rest/orgs/members#list-pending-organization-invitations)

---

### Syntax
```PowerShell
Get-GitHubOrganizationPendingInvitation [-Organization] <String> [[-Role] <String>] [[-InvitationSource] <String>] [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
