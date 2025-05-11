Get-GitHubEnterpriseOrganization
--------------------------------

### Synopsis
Get the list of organizations in a GitHub Enterprise instance.

---

### Description

Use this function to retrieve the list of organizations in a GitHub Enterprise instance.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubEnterpriseOrganization -Enterprise 'msx'
```

---

### Parameters
#### **Enterprise**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Get-GitHubEnterpriseOrganization [[-Enterprise] <String>] [[-Context] <Object>] [<CommonParameters>]
```
