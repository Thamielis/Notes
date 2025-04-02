Update-GitHubTeam
-----------------

### Synopsis
Update a team

---

### Description

To edit a team, the authenticated user must either be an organization owner or a team maintainer.

---

### Examples
> EXAMPLE 1

```PowerShell
$params = @{
    Organization  = 'github'
    Slug          = 'team-name'
    NewName       = 'new team name'
    Description   = 'A new team'
    Visible       = $true
    Notifications = $true
    Permission    = 'pull'
    ParentTeamID  = 123456
}
Update-GitHubTeam @params
Updates the team with the slug 'team-name' in the `github` organization with the new name 'new team name', description 'A new team',
visibility set to 'closed', notifications enabled, permission set to 'pull', and the parent team ID set to 123456.
```

---

### Parameters
#### **Name**
The slug of the team name.

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[String]`|true    |1       |false        |team_slug<br/>Slug|

#### **Organization**
The organization name. The name is not case sensitive.
If you do not provide this parameter, the command will use the organization from the context.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **NewName**
The new team name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Description**
The description of the team.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Visible**
The level of privacy this team should have. The options are:
For a non-nested team:
* secret - only visible to organization owners and members of this team.
* closed - visible to all members of this organization.
Default: secret
For a parent or child team:
* closed - visible to all members of this organization.
Default for child team: closed

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |5       |false        |

#### **Notifications**
The notification setting the team has chosen. The options are:
notifications_enabled - team members receive notifications when the team is @mentioned.
notifications_disabled - no one receives notifications.
Default: notifications_enabled

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |6       |false        |

#### **Permission**
Closing down notice. The permission that new repositories will be added to the team with when none is specified.
Valid Values:

* pull
* push

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **ParentTeamID**
The ID of a team to set as the parent team.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |8       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

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
* GitHubTeam

---

### Notes
[Update a team](https://docs.github.com/en/rest/teams/teams?apiVersion=2022-11-28#update-a-team)

---

### Syntax
```PowerShell
Update-GitHubTeam [-Name] <String> [-Organization] <String> [[-NewName] <String>] [[-Description] <String>] [[-Visible] <Boolean>] [[-Notifications] <Boolean>] [[-Permission] <String>] [[-ParentTeamID] <Int32>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
