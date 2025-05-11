Get-GithubRepositoryFile
------------------------

### Synopsis
Search an organization's repositories for files.

---

### Description

Search an organization's repositories for files.
Includes file-content.

---

### Examples
> EXAMPLE 1

Get-GithubRepositoryFile -Organization FriedrichWeinmann -Name *.ps1,*psm1
Search all github projects maintained directly by Friedrich Weinmann and download all ps1 and psm1 files from all branches of them all.
Hint: This may take a while and will return loooots of data ;)

---

### Parameters
#### **Organization**
The Organization or private account to search.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Repository**
Filter by repository name.
Defaults to '*'

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Branch**
Filter by branch name.
Defaults to '*'

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **Name**
Filter by filename.
Defaults to '*'

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

---

### Syntax
```PowerShell
Get-GithubRepositoryFile [-Organization] <String> [[-Repository] <String[]>] [[-Branch] <String[]>] [[-Name] <String[]>] [<CommonParameters>]
```
