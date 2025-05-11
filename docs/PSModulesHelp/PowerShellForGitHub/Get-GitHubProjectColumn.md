Get-GitHubProjectColumn
-----------------------

### Synopsis
Get the columns for a given GitHub Project.

---

### Description

Get the columns for a given GitHub Project.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubProjectColumn -Project 999999
Get the columns for project 999999.
```
> EXAMPLE 2

```PowerShell
Get-GitHubProjectColumn -Column 999999
Get the column with ID 999999.
```

---

### Parameters
#### **Project**
ID of the project to retrieve a list of columns for.

|Type     |Required|Position|PipelineInput        |Aliases  |
|---------|--------|--------|---------------------|---------|
|`[Int64]`|true    |named   |true (ByPropertyName)|ProjectId|

#### **Column**
ID of the column to retrieve.

|Type     |Required|Position|PipelineInput                 |Aliases |
|---------|--------|--------|------------------------------|--------|
|`[Int64]`|true    |named   |true (ByValue, ByPropertyName)|ColumnId|

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
GitHub.Project
GitHub.ProjectCard
GitHub.ProjectColumn

---

### Outputs
* GitHub.ProjectColumn

---

### Syntax
```PowerShell
Get-GitHubProjectColumn -Column <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubProjectColumn -Project <Int64> [-AccessToken <String>] [<CommonParameters>]
```
