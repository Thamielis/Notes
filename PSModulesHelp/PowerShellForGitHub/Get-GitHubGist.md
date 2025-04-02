Get-GitHubGist
--------------

### Synopsis
Retrieves gist information from GitHub.

---

### Description

Retrieves gist information from GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubGist -Starred
Gets all starred gists for the current authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubGist -Public -Since ((Get-Date).AddDays(-2))
Gets all public gists that have been updated within the past two days.
```
> EXAMPLE 3

Get-GitHubGist -Gist 6cad326836d38bd3a7ae
Gets octocat's "hello_world.rb" gist.

---

### Parameters
#### **Gist**
The ID of the specific gist that you wish to retrieve.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

#### **Sha**
The specific revision of the gist that you wish to retrieve.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Forks**
Gets the forks of the specified gist.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Commits**
Gets the commits of the specified gist.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UserName**
Gets public gists for the specified user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Path**
Download the files that are part of the specified gist to this path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Force**
If downloading files, this will overwrite any files with the same name in the provided path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Current**
Gets the authenticated user's gists.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Starred**
Gets the authenticated user's starred gists.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Public**
Gets public gists sorted by most recently updated to least recently updated.
The results will be limited to the first 3000.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Since**
Only gists updated at or after this time are returned.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

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
* GitHub.Gist
GitHub.GistCommit
GitHub.GistFork
GitHub.GistSummary

---

### Syntax
```PowerShell
Get-GitHubGist [-Current] [-Starred] [-Since <DateTime>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubGist [-Gist] <String> [-Sha <String>] [-Path] <String> [-Force] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubGist [-Gist] <String> [-Sha <String>] [-Forks] [-Commits] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubGist -UserName <String> [-Since <DateTime>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubGist [-Public] [-Since <DateTime>] [-AccessToken <String>] [<CommonParameters>]
```
