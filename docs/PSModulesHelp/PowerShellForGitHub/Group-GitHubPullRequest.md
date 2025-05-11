Group-GitHubPullRequest
-----------------------

### Synopsis
Groups the provided pull requests based on the specified grouping criteria.

---

### Description

Groups the provided pull requests based on the specified grouping criteria.

Currently able to group Pull Requests by week.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
$pullRequests = @()
$pullRequests += Get-GitHubPullRequest -Uri 'https://github.com/powershell/xpsdesiredstateconfiguration'
$pullRequests += Get-GitHubPullRequest -Uri 'https://github.com/powershell/xactivedirectory'
$pullRequests | Group-GitHubPullRequest -Weeks 12 -DateType Closed
```

---

### Parameters
#### **PullRequest**
The Pull Requests(s) to be grouped.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|true    |named   |true (ByValue)|

#### **Weeks**
The number of weeks to group the Pull Requests by.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

#### **DateType**
The date property that should be inspected when determining which week grouping the
pull request if part of.
Valid Values:

* Created
* Merged

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
GitHub.PullRequest

---

### Outputs
* [PSCustomObject[]] Collection of pull requests and counts, by week, along with the
total count of pull requests.

---

### Syntax
```PowerShell
Group-GitHubPullRequest -PullRequest <PSObject[]> -Weeks <Int32> [-DateType <String>] [<CommonParameters>]
```
