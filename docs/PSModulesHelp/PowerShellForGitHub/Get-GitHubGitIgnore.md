Get-GitHubGitIgnore
-------------------

### Synopsis
Gets the list of available .gitignore templates, or their content, from GitHub.

---

### Description

Gets the list of available .gitignore templates, or their content, from GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubGitIgnore
Returns the list of all available .gitignore templates.
```
> EXAMPLE 2

```PowerShell
Get-GitHubGitIgnore -Name VisualStudio
Returns the content of the VisualStudio.gitignore template.
```

---

### Parameters
#### **Name**
The name of the .gitignore template whose content should be fetched.
Not providing this will cause a list of all available templates to be returned.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|false   |named   |true (ByValue)|

#### **RawContent**
If specified, the raw content of the specified .gitignore file will be returned.

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
[String]

---

### Outputs
* GitHub.Gitignore

---

### Syntax
```PowerShell
Get-GitHubGitIgnore [-Name <String>] [-RawContent] [-AccessToken <String>] [<CommonParameters>]
```
