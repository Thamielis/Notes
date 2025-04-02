Get-GitHubProjectCard
---------------------

### Synopsis
Get the cards for a given GitHub Project Column.

---

### Description

Get the cards for a given GitHub Project Column.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubProjectCard -Column 999999
Get the the not_archived cards for column 999999.
```
> EXAMPLE 2

```PowerShell
Get-GitHubProjectCard -Column 999999 -State All
Gets all the cards for column 999999, no matter the State.
```
> EXAMPLE 3

```PowerShell
Get-GitHubProjectCard -Column 999999 -State Archived
Gets the archived cards for column 999999.
```
> EXAMPLE 4

```PowerShell
Get-GitHubProjectCard -Card 999999
Gets the card with ID 999999.
```

---

### Parameters
#### **Column**
ID of the column to retrieve cards for.

|Type     |Required|Position|PipelineInput        |Aliases |
|---------|--------|--------|---------------------|--------|
|`[Int64]`|true    |named   |true (ByPropertyName)|ColumnId|

#### **Card**

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int64]`|true    |named   |true (ByPropertyName)|CardId |

#### **State**
Only cards with this State are returned.
Options are all, archived, or NotArchived (default).
Valid Values:

* All
* Archived
* NotArchived

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |named   |false        |ArchivedState|

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
GitHub.ProjectCard
GitHub.ProjectColumn

---

### Outputs
* GitHub.ProjectCard

---

### Syntax
```PowerShell
Get-GitHubProjectCard -Card <Int64> [-State <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubProjectCard -Column <Int64> [-State <String>] [-AccessToken <String>] [<CommonParameters>]
```
