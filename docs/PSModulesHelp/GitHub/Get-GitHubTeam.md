Get-GitHubTeam
--------------

### Synopsis
List teams from an org or get a team by name

---

### Description

Lists all teams in an organization that are visible to the authenticated user or gets a team using the team's slug.
To create the slug, GitHub replaces special characters in the name string, changes all words to lowercase,
and replaces spaces with a - separator. For example, "My TEam Näme" would become my-team-name.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubTeam -Organization 'GitHub'
Gets all teams in the `github` organization.
```
> EXAMPLE 2

```PowerShell
Get-GitHubTeam -Organization 'github' -Slug 'my-team-name'
Gets the team with the slug 'my-team-name' in the `github` organization.
```

---

### Parameters
#### **Slug**
The slug of the team name.

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|true    |named   |false        |team_slug|

#### **Organization**
The organization name. The name is not case sensitive.
If not provided, the owner from the context will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Outputs
* GitHubTeam

---

### Syntax
```PowerShell
Get-GitHubTeam [-Organization <String>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubTeam -Slug <String> [-Organization <String>] [-Context <Object>] [<CommonParameters>]
```
