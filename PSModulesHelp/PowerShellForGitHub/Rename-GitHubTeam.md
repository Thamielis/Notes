Rename-GitHubTeam
-----------------

### Synopsis
Renames a team within an organization on GitHub.

---

### Description

Renames a team within an organization on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Rename-GitHubTeam -OrganizationName PowerShell -TeamName Developers -NewTeamName DeveloperTeam
Renames the 'Developers' GitHub team in the 'PowerShell' organization to be 'DeveloperTeam'.
```
> EXAMPLE 2

```PowerShell
$team = Get-GitHubTeam -OrganizationName PowerShell -TeamName Developers
$team | Rename-GitHubTeam -NewTeamName 'DeveloperTeam'
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
The existing name of the team.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **TeamSlug**
The slug (a unique key based on the team name) of the team to update.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **NewTeamName**
The new name for the team.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

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

---

### Inputs
GitHub.Organization
GitHub.Team

---

### Outputs
* GitHub.Team

---

### Notes
This is a helper/wrapper for Set-GitHubTeam which can also rename a GitHub Team.

---

### Syntax
```PowerShell
Rename-GitHubTeam [-OrganizationName] <String> -TeamSlug <String> [-NewTeamName] <String> [-PassThru] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Rename-GitHubTeam [-OrganizationName] <String> [-TeamName] <String> [-NewTeamName] <String> [-PassThru] [-AccessToken <String>] [<CommonParameters>]
```
