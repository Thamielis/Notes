Get-GitHubLicense
-----------------

### Synopsis
Get a license template, list of all popular license templates or a license for a repository

---

### Description

If no parameters are specified, the function will return a list of all license templates.
If the Name parameter is specified, the function will return the license template for the specified name.
If the Owner and Repo parameters are specified, the function will return the license for the specified repository.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubLicense
Get all license templates
```
> EXAMPLE 2

```PowerShell
Get-GitHubLicense -Name mit
Get the mit license template
```
> EXAMPLE 3

```PowerShell
Get-GitHubLicense -Owner 'octocat' -Repository 'Hello-World'
Get the license for the Hello-World repository from the octocat account.
```

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Repository**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Name**
The license keyword, license name, or license SPDX ID. For example, mit or mpl-2.0.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Notes
[Get a license](https://docs.github.com/rest/licenses/licenses#get-a-license)
[Get all commonly used licenses](https://docs.github.com/rest/licenses/licenses#get-all-commonly-used-licenses)
[Get the license for a repository](https://docs.github.com/rest/licenses/licenses#get-the-license-for-a-repository)

---

### Syntax
```PowerShell
Get-GitHubLicense [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubLicense [-Owner <String>] [-Repository <String>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubLicense [-Name <String>] [-Context <Object>] [<CommonParameters>]
```
