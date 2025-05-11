Get-GitHubOrganizationMember
----------------------------

### Synopsis
Retrieve list of members within an organization.

---

### Description

Retrieve list of members within an organization.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubOrganizationMember -OrganizationName PowerShell
```

---

### Parameters
#### **OrganizationName**
The name of the organization

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Inputs
[String]

---

### Outputs
* GitHub.User
List of members within the organization.

---

### Syntax
```PowerShell
Get-GitHubOrganizationMember [-OrganizationName] <String> [[-AccessToken] <String>] [<CommonParameters>]
```
