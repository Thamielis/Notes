Connect-GitHubApp
-----------------

### Synopsis
Connects to GitHub as a installation using a GitHub App.

---

### Description

Connects to GitHub using a GitHub App to generate installation access tokens and create contexts for targets.

Available target types:
- User
- Organization
- Enterprise

---

### Examples
> EXAMPLE 1

```PowerShell
Connect-GitHubApp
Connects to GitHub as all available targets using the logged in GitHub App.
```
> EXAMPLE 2

```PowerShell
Connect-GitHubApp -User 'octocat'
Connects to GitHub as the user 'octocat' using the logged in GitHub App.
```
> EXAMPLE 3

```PowerShell
Connect-GitHubApp -Organization 'psmodule' -Default
Connects to GitHub as the organization 'psmodule' using the logged in GitHub App and sets it as the default context.
```
> EXAMPLE 4

```PowerShell
Connect-GitHubApp -Enterprise 'msx'
Connects to GitHub as the enterprise 'msx' using the logged in GitHub App.
```

---

### Parameters
#### **User**
The user account to connect to.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Organization**
The organization to connect to.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Enterprise**
The enterprise to connect to.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **PassThru**
Passes the context object to the pipeline.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Silent**
Suppresses the output of the function.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Quiet  |

#### **Default**
Set as the default context.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Authenticating to the REST API](https://docs.github.com/rest/overview/other-authentication-methods#authenticating-for-saml-sso)

---

### Syntax
```PowerShell
Connect-GitHubApp [-PassThru] [-Silent] [-Default] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Connect-GitHubApp [-User <String[]>] [-Organization <String[]>] [-Enterprise <String[]>] [-PassThru] [-Silent] [-Default] [-Context <Object>] [<CommonParameters>]
```
