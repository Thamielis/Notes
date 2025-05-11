Get-GitHubGistComment
---------------------

### Synopsis
Retrieves comments for a specific gist from GitHub.

---

### Description

Retrieves comments for a specific gist from GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Get-GitHubGistComment -Gist 6cad326836d38bd3a7ae
Gets all comments on octocat's "hello_world.rb" gist.
> EXAMPLE 2

Get-GitHubGistComment -Gist 6cad326836d38bd3a7ae -Comment 1507813
Gets comment 1507813 from octocat's "hello_world.rb" gist.

---

### Parameters
#### **Gist**
The ID of the specific gist that you wish to retrieve the comments for.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

#### **Comment**
The ID of the specific comment on the gist that you wish to retrieve.

|Type     |Required|Position|PipelineInput        |Aliases      |
|---------|--------|--------|---------------------|-------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|GistCommentId|

#### **MediaType**
The format in which the API will return the body of the comment.
Raw - Return the raw markdown body. Response will include body. This is the default if you do not pass any specific media type.
Text - Return a text only representation of the markdown body. Response will include body_text.
Html - Return HTML rendered from the body's markdown. Response will include body_html.
Full - Return raw, text and HTML representations. Response will include body, body_text, and body_html.
Valid Values:

* Raw
* Text
* Html
* Full

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* GitHub.GistComment

---

### Syntax
```PowerShell
Get-GitHubGistComment [-Gist] <String> [-Comment <Int64>] [-MediaType <String>] [-AccessToken <String>] [<CommonParameters>]
```
