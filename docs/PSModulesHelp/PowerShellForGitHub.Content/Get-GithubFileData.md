Get-GithubFileData
------------------

### Synopsis
Retrieves the data of a textfile from github.

---

### Description

Retrieves the data of a textfile from github.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GithubTree -Owner FriedrichWeinmann -Repository PowerShellForGithub.Content -BranchName master | Get-GithubFileData
Download all files from the master branch of the repository PowerShellForGithub.Content
```

---

### Parameters
#### **Owner**
Owner of the Repository the file is from.
Optional, decorative parameter used to enrich the output object.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Repository**
The name of the Repository the file is from.
Optional, decorative parameter used to enrich the output object.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **BranchName**
The Branch the file is a paart of.
Optional, decorative parameter used to enrich the output object.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Path**
The relative Path of the file within its branch.
Optional, decorative parameter used to enrich the output object.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **Name**
The name of the file.
Optional, decorative parameter used to enrich the output object.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **Url**
Url to the file toretrieve

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |6       |true (ByPropertyName)|

---

### Syntax
```PowerShell
Get-GithubFileData [[-Owner] <String>] [[-Repository] <String>] [[-BranchName] <String>] [[-Path] <String>] [[-Name] <String>] [-Url] <String> [<CommonParameters>]
```
