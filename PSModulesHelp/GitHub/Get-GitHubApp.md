Get-GitHubApp
-------------

### Synopsis
Get the authenticated app or a specific app by its slug.

---

### Description

Returns a GitHub App associated with the authentication credentials used or the provided app-slug.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubApp
Get the authenticated app.
```
> EXAMPLE 2

```PowerShell
Get-GitHubApp -Name 'github-actions'
Get the GitHub App with the slug 'github-actions'.
```

---

### Parameters
#### **Name**
The AppSlug is just the URL-friendly name of a GitHub App.
You can find this on the settings page for your GitHub App (e.g., <https://github.com/settings/apps/{app_slug}>).
Example: 'github-actions'

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |AppSlug|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[Get an app](https://docs.github.com/en/rest/apps/apps?apiVersion=2022-11-28#get-an-app)
[Get the authenticated app | GitHub Docs](https://docs.github.com/rest/apps/apps#get-the-authenticated-app)

---

### Syntax
```PowerShell
Get-GitHubApp [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubApp -Name <String> [-Context <Object>] [<CommonParameters>]
```
