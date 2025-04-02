Remove-GitHubTeam
-----------------

### Synopsis
Delete a team

---

### Description

To delete a team, the authenticated user must be an organization owner or team maintainer.
If you are an organization owner, deleting a parent team will delete all of its child teams as well.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubTeam -Organization 'github' -Name 'team-name'
```

---

### Parameters
#### **Name**
The slug of the team name.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|true    |1       |true (ByPropertyName)|team_slug<br/>Slug|

#### **Organization**
The organization name. The name is not case sensitive.
If not provided, the organization from the context is used.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Delete a team](https://docs.github.com/en/rest/teams/teams?apiVersion=2022-11-28#delete-a-team)

---

### Syntax
```PowerShell
Remove-GitHubTeam [-Name] <String> [-Organization] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
