New-GitHubTeam
--------------

### Synopsis
Create a team

---

### Description

To create a team, the authenticated user must be a member or owner of `{org}`. By default, organization members can create teams.
Organization owners can limit team creation to organization owners. For more information, see
"[Setting team creation permissions](https://docs.github.com/articles/setting-team-creation-permissions-in-your-organization)."

When you create a new team, you automatically become a team maintainer without explicitly adding yourself to the optional array of
`maintainers`. For more information, see
"[About teams](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/about-teams)".

---

### Examples
> EXAMPLE 1

```PowerShell
$params = @{
    Organization = 'github'
    Name         = 'team-name'
    Description  = 'A new team'
    Maintainers  = 'octocat'
    RepoNames    = 'github/octocat'
    Privacy      = 'closed'
    Permission   = 'pull'
}
New-GitHubTeam @params
```

---

### Parameters
#### **Name**
The name of the team.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Organization**
The organization name. The name is not case sensitive.
If not provided, the organization from the context is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Description**
The description of the team.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Maintainers**
List GitHub IDs for organization members who will become team maintainers.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **RepoNames**
The full name (e.g., "organization-name/repository-name") of repositories to add the team to.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

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
|`[Boolean]`|false   |6       |false        |

#### **Notifications**
The notification setting the team has chosen. The options are:
notifications_enabled - team members receive notifications when the team is @mentioned.
notifications_disabled - no one receives notifications.
Default: notifications_enabled

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |7       |false        |

#### **Permission**
Closing down notice. The permission that new repositories will be added to the team with when none is specified.
Valid Values:

* pull
* push

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **ParentTeamID**
The ID of a team to set as the parent team.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |9       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |10      |false        |

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
[Create a team](https://docs.github.com/rest/teams/teams#create-a-team)

---

### Syntax
```PowerShell
New-GitHubTeam [-Name] <String> [-Organization] <String> [[-Description] <String>] [[-Maintainers] <String[]>] [[-RepoNames] <String[]>] [[-Visible] <Boolean>] [[-Notifications] <Boolean>] [[-Permission] <String>] [[-ParentTeamID] <Int32>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
