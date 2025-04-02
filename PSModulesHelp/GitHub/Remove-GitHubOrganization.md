Remove-GitHubOrganization
-------------------------

### Synopsis
Delete an organization

---

### Description

Deletes an organization and all its repositories.
The organization login will be unavailable for 90 days after deletion.
Please review the [GitHub Terms of Service](https://docs.github.com/site-policy/github-terms/github-terms-of-service)
regarding account deletion before using this endpoint.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubOrganization -Organization 'GitHub'
Deletes the organization 'GitHub' and all its repositories.
```

---

### Parameters
#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[Delete an organization](https://docs.github.com/rest/orgs/orgs#delete-an-organization)

---

### Syntax
```PowerShell
Remove-GitHubOrganization [-Organization] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
