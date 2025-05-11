Uninstall-GitHubApp
-------------------

### Synopsis
Uninstall a GitHub App.

---

### Description

Uninstalls the provided GitHub App on the specified target.

---

### Examples
> EXAMPLE 1

```PowerShell
Uninstall-GitHubApp -Enterprise 'msx' -Organization 'org' -InstallationID '123456'
Uninstall the GitHub App with the installation ID '123456' from the organization 'org' in the enterprise 'msx'.
```

---

### Parameters
#### **Enterprise**
The enterprise slug or ID.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ID**
The client ID of the GitHub App to install.

|Type      |Required|Position|PipelineInput        |Aliases                           |
|----------|--------|--------|---------------------|----------------------------------|
|`[String]`|true    |named   |true (ByPropertyName)|installation_id<br/>InstallationID|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Syntax
```PowerShell
Uninstall-GitHubApp -ID <String> [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Uninstall-GitHubApp -Enterprise <String> -Organization <String> -ID <String> [-Context <Object>] [<CommonParameters>]
```
