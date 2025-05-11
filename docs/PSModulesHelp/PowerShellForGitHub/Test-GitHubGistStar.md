Test-GitHubGistStar
-------------------

### Synopsis
Checks if a gist from GitHub is starred.

---

### Description

Checks if a gist from GitHub is starred.
Will return $false if it isn't starred, as well as if it couldn't be checked
(due to permissions or non-existence).

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Test-GitHubGistStar -Gist 6cad326836d38bd3a7ae
Returns $true if the gist is starred, or $false if isn't starred or couldn't be checked
(due to permissions or non-existence).

---

### Parameters
#### **Gist**
The ID of the specific gist that you wish to check.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
GitHub.Gist
GitHub.GistComment
GitHub.GistCommit
GitHub.GistFork
GitHub.GistSummary

---

### Outputs
* Boolean indicating if the gist was both found and determined to be starred.

---

### Syntax
```PowerShell
Test-GitHubGistStar [-Gist] <String> [-AccessToken <String>] [<CommonParameters>]
```
