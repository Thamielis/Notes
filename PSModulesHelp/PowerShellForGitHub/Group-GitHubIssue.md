Group-GitHubIssue
-----------------

### Synopsis
Groups the provided issues based on the specified grouping criteria.

---

### Description

Groups the provided issues based on the specified grouping criteria.

Currently able to group Issues by week.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
$issues = @()
$issues += Get-GitHubIssue -Uri 'https://github.com/powershell/xpsdesiredstateconfiguration'
$issues += Get-GitHubIssue -Uri 'https://github.com/powershell/xactivedirectory'
$issues | Group-GitHubIssue -Weeks 12 -DateType Closed
```

---

### Parameters
#### **Issue**
The Issue(s) to be grouped.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|true    |named   |true (ByValue)|

#### **Weeks**
The number of weeks to group the Issues by.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

#### **DateType**
The date property that should be inspected when determining which week grouping the issue
if part of.
Valid Values:

* Created
* Closed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
GitHub.Issue

---

### Outputs
* [PSCustomObject[]]
Collection of issues and counts, by week, along with the total count of issues.

---

### Syntax
```PowerShell
Group-GitHubIssue -Issue <PSObject[]> -Weeks <Int32> [-DateType <String>] [<CommonParameters>]
```
