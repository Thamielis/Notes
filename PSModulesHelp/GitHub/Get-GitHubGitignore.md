Get-GitHubGitignore
-------------------

### Synopsis
Get a gitignore template or list of all gitignore templates names

---

### Description

If no parameters are specified, the function will return a list of all gitignore templates names.
If the Name parameter is specified, the function will return the gitignore template for the specified name.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubGitignoreList
Get all gitignore templates
```
> EXAMPLE 2

```PowerShell
Get-GitHubGitignore -Name 'VisualStudio'
Get a gitignore template for VisualStudio
```

---

### Parameters
#### **Name**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Notes
[Get a gitignore template](https://docs.github.com/rest/gitignore/gitignore#get-a-gitignore-template)
[Get all gitignore templates](https://docs.github.com/rest/gitignore/gitignore#get-all-gitignore-templates)

---

### Syntax
```PowerShell
Get-GitHubGitignore [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubGitignore -Name <String> [-Context <Object>] [<CommonParameters>]
```
