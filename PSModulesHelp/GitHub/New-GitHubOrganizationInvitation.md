New-GitHubOrganizationInvitation
--------------------------------

### Synopsis
Create an organization invitation

---

### Description

Invite people to an organization by using their GitHub user ID or their email address. In order to create invitations in an organization,
the authenticated user must be an organization owner.

This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see
"[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubOrganizationInvitation -Organization 'PSModule' -InviteeID 123456789 -Role 'admin'
Invites the user with the ID `12345679` to the organization `PSModule` with the role `admin`.
```
> EXAMPLE 2

New-GitHubOrganizationInvitation -Organization 'PSModule' -Email 'user@psmodule.io'
Invites the user with the email `user@psmodule.io` to the organization `PSModule`.

---

### Parameters
#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **InviteeID**
GitHub user ID for the person you are inviting.

|Type          |Required|Position|PipelineInput|Aliases                      |
|--------------|--------|--------|-------------|-----------------------------|
|`[Nullable`1]`|true    |named   |false        |invitee_id<br/>user_id<br/>ID|

#### **Email**
Email address of the person you are inviting, which can be an existing GitHub user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Role**
The role for the new member.
* `admin` - Organization owners with full administrative rights to the organization and complete access to all repositories and teams.
* `direct_member` - Non-owner organization members with ability to see other members and join teams by invitation.
* `billing_manager` - Non-owner organization members with ability to manage the billing settings of your organization.
* `reinstate` - The previous role assigned to the invitee before they were removed from your organization.
  Can be one of the roles listed above.
Only works if the invitee was previously part of your organization.
Valid Values:

* admin
* direct_member
* billing_manager
* reinstate

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TeamIDs**
Specify IDs for the teams you want to invite new members to.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

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
[Create an organization invitation](https://docs.github.com/rest/orgs/members#list-pending-organization-invitations)

---

### Syntax
```PowerShell
New-GitHubOrganizationInvitation -Organization <String> -InviteeID <Nullable`1> [-Role <String>] [-TeamIDs <Int32[]>] [-Context <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubOrganizationInvitation -Organization <String> -Email <String> [-Role <String>] [-TeamIDs <Int32[]>] [-Context <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
