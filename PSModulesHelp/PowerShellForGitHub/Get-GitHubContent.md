Get-GitHubContent
-----------------

### Synopsis
Retrieve the contents of a file or directory in a repository on GitHub.

---

### Description

Retrieve content from files on GitHub.
The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubContent -OwnerName microsoft -RepositoryName PowerShellForGitHub -Path README.md -MediaType Html
Get the Html output for the README.md file
```
> EXAMPLE 2

```PowerShell
Get-GitHubContent -OwnerName microsoft -RepositoryName PowerShellForGitHub -Path LICENSE
Get the Binary file output for the LICENSE file
```
> EXAMPLE 3

```PowerShell
Get-GitHubContent -OwnerName microsoft -RepositoryName PowerShellForGitHub -Path Tests
List the files within the "Tests" path of the repository
```
> EXAMPLE 4

```PowerShell
$repo = Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub
$repo | Get-GitHubContent -Path Tests
List the files within the "Tests" path of the repository
```

---

### Parameters
#### **OwnerName**
Owner of the repository.
If not supplied here, the DefaultOwnerName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **RepositoryName**
Name of the repository.
If not supplied here, the DefaultRepositoryName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Uri**
Uri for the repository.
The OwnerName and RepositoryName will be extracted from here instead of needing to provide
them individually.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |named   |true (ByPropertyName)|RepositoryUrl|

#### **Path**
The file path for which to retrieve contents

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BranchName**
The branch, or defaults to the default branch of not specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MediaType**
The format in which the API will return the body of the issue.
Object - Return a json object representation a file or folder.
         This is the default if you do not pass any specific media type.
Raw    - Return the raw contents of a file.
Html   - For markup files such as Markdown or AsciiDoc,
         you can retrieve the rendered HTML using the Html media type.
Valid Values:

* Raw
* Html
* Object

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ResultAsString**
If this switch is specified and the MediaType is either Raw or Html then the
resulting bytes will be decoded the result will be  returned as a string instead of bytes.
If the MediaType is Object, then an additional property on the object named
'contentAsString' will be included and its value will be the decoded base64 result
as a string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
GitHub.Branch
GitHub.Content
GitHub.Event
GitHub.Issue
GitHub.IssueComment
GitHub.Label
GitHub.Milestone
GitHub.PullRequest
GitHub.Project
GitHub.ProjectCard
GitHub.ProjectColumn
GitHub.Reaction
GitHub.Release
GitHub.ReleaseAsset
GitHub.Repository

---

### Outputs
* [String]
GitHub.Content

---

### Notes
Unable to specify Path as ValueFromPipeline because a Repository object may be incorrectly
coerced into a string used for Path, thus confusing things.

---

### Syntax
```PowerShell
Get-GitHubContent -OwnerName <String> -RepositoryName <String> [-Path <String>] [-BranchName <String>] [-MediaType <String>] [-ResultAsString] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubContent -Uri <String> [-Path <String>] [-BranchName <String>] [-MediaType <String>] [-ResultAsString] [-AccessToken <String>] [<CommonParameters>]
```
