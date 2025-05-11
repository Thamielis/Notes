Get-GitHubAppInstallableOrganization
------------------------------------

### Synopsis
Get enterprise-owned organizations that can have GitHub Apps installed

---

### Description

List of organizations owned by the enterprise on which the authenticated GitHub App installation may install other GitHub Apps.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubAppInstallableOrganization -Enterprise 'msx'
```

---

### Parameters
#### **Enterprise**
The enterprise slug or ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Notes
Permissions required:
- enterprise_organization_installations: read

---

### Syntax
```PowerShell
Get-GitHubAppInstallableOrganization [-Enterprise] <String> [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
