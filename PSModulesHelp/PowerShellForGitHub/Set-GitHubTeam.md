Set-GitHubTeam
--------------

### Synopsis
Updates a team within an organization on GitHub.

---

### Description

Updates a team within an organization on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubTeam -OrganizationName PowerShell -TeamName Developers -Description 'New Description'
Updates the description for the 'Developers' GitHub team in the 'PowerShell' organization.
```
> EXAMPLE 2

```PowerShell
$team = Get-GitHubTeam -OrganizationName PowerShell -TeamName Developers
$team | Set-GitHubTeam -Description 'New Description'
You can also pipe in a GitHub team that was returned from a previous command.
```

---

### Parameters
#### **OrganizationName**
The name of the team's organization.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **TeamName**
The name of the team.
When TeamSlug is specified, specifying a name here that is different from the existing
name will cause the team to be renamed. TeamSlug and TeamName are specified for you
automatically when piping in a GitHub.Team object, so a rename would only occur if
intentionally specify this parameter and provide a different name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **TeamSlug**
The slug (a unique key based on the team name) of the team to update.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Description**
The description for the team.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Privacy**
The level of privacy this team should have.
Valid Values:

* Secret
* Closed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ParentTeamName**
The name of a team to set as the parent team.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ParentTeamId**
The ID of the team to set as the parent team.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

#### **PassThru**
Returns the updated GitHub Team.  By default, this cmdlet does not generate any output.
You can use "Set-GitHubConfiguration -DefaultPassThru" to control the default behavior
of this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Inputs
GitHub.Organization
GitHub.Team

---

### Outputs
* GitHub.Team

---

### Syntax
```PowerShell
Set-GitHubTeam [-OrganizationName] <String> [-TeamName] <String> [-TeamSlug <String>] [-Description <String>] [-Privacy <String>] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubTeam [-OrganizationName] <String> [-TeamName] <String> [-TeamSlug <String>] [-Description <String>] [-Privacy <String>] [-ParentTeamName <String>] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubTeam [-OrganizationName] <String> [-TeamName] <String> [-TeamSlug <String>] [-Description <String>] [-Privacy <String>] [-ParentTeamId <Int64>] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
