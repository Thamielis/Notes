Test-GitHubOrganizationMember
-----------------------------

### Synopsis
Check to see if a user is a member of an organization.

---

### Description

Check to see if a user is a member of an organization.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Test-GitHubOrganizationMember -OrganizationName PowerShell -UserName Octocat
```

---

### Parameters
#### **OrganizationName**
The name of the organization.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **UserName**
The name of the user being inquired about.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Inputs
[String]

---

### Outputs
* [Bool]

---

### Syntax
```PowerShell
Test-GitHubOrganizationMember [-OrganizationName] <String> [-UserName] <String> [[-AccessToken] <String>] [<CommonParameters>]
```
