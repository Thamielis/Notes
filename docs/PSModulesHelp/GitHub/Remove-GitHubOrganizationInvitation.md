Remove-GitHubOrganizationInvitation
-----------------------------------

### Synopsis
Cancel an organization invitation

---

### Description

Cancel an organization invitation. In order to cancel an organization invitation, the authenticated user must be an organization owner.

This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubOrganizationInvitation -Organization 'github' -InvitationID '12345678'
Cancel the invitation with the ID '12345678' for the organization `github`.
```

---

### Parameters
#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ID**
The unique identifier of the invitation.

|Type      |Required|Position|PipelineInput|Aliases                       |
|----------|--------|--------|-------------|------------------------------|
|`[String]`|true    |2       |false        |invitation_id<br/>InvitationID|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

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
* [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)

---

### Notes
[Cancel an organization invitation](https://docs.github.com/rest/orgs/members#cancel-an-organization-invitation)

---

### Syntax
```PowerShell
Remove-GitHubOrganizationInvitation [-Organization] <String> [-ID] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
