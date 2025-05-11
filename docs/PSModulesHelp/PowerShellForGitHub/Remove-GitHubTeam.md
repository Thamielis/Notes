Remove-GitHubTeam
-----------------

### Synopsis
Removes a team from an organization on GitHub.

---

### Description

Removes a team from an organization on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubTeam -OrganizationName PowerShell -TeamName Developers
Removes the 'Developers' GitHub team from the 'PowerShell' organization.
```
> EXAMPLE 2

```PowerShell
Remove-GitHubTeam -OrganizationName PowerShell -TeamName Developers -Force
Removes the 'Developers' GitHub team from the 'PowerShell' organization without prompting.
```
> EXAMPLE 3

```PowerShell
$team = Get-GitHubTeam -OrganizationName PowerShell -TeamName Developers
$team | Remove-GitHubTeam -Force
You can also pipe in a GitHub team that was returned from a previous command.
```

---

### Parameters
#### **OrganizationName**
The name of the organization the team is in.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |2       |true (ByValue, ByPropertyName)|

#### **TeamName**
The name of the team to remove.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |3       |true (ByValue, ByPropertyName)|

#### **TeamSlug**
The slug (a unique key based on the team name) of the team to remove.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Force**
If this switch is specified, you will not be prompted for confirmation of command execution.

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
* None

---

### Syntax
```PowerShell
Remove-GitHubTeam [-OrganizationName] <String> -TeamSlug <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GitHubTeam [-OrganizationName] <String> [-TeamName] <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
