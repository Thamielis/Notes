New-GitHubTeam
--------------

### Synopsis
Creates a team within an organization on GitHub.

---

### Description

Creates a team within an organization on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubTeam -OrganizationName PowerShell -TeamName 'Developers'
Creates a new GitHub team called 'Developers' in the 'PowerShell' organization.
```
> EXAMPLE 2

```PowerShell
$teamName = 'Team1'
$teamName | New-GitHubTeam -OrganizationName PowerShell
You can also pipe in a team name that was returned from a previous command.
```
> EXAMPLE 3

```PowerShell
$users = Get-GitHubUsers -OrganizationName PowerShell
$users | New-GitHubTeam -OrganizationName PowerShell -TeamName 'Team1'
You can also pipe in a list of GitHub users that were returned from a previous command.
```

---

### Parameters
#### **OrganizationName**
The name of the organization to create the team in.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **TeamName**
The name of the team.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |3       |true (ByValue)|

#### **Description**
The description for the team.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MaintainerName**
A list of GitHub user names for organization members who will become team maintainers.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|UserName|

#### **RepositoryName**
The name of repositories to add the team to.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

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

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int64]`|false   |named   |true (ByPropertyName)|TeamId |

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
GitHub.Team
GitHub.User
System.String

---

### Outputs
* GitHub.Team

---

### Syntax
```PowerShell
New-GitHubTeam [-OrganizationName] <String> [-TeamName] <String> [-Description <String>] [-MaintainerName <String[]>] [-RepositoryName <String[]>] [-Privacy <String>] [-ParentTeamId <Int64>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubTeam [-OrganizationName] <String> [-TeamName] <String> [-Description <String>] [-MaintainerName <String[]>] [-RepositoryName <String[]>] [-Privacy <String>] [-ParentTeamName <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
