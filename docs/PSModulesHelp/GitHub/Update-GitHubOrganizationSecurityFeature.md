Update-GitHubOrganizationSecurityFeature
----------------------------------------

### Synopsis
Enable or disable a security feature for an organization

---

### Description

Enables or disables the specified security feature for all eligible repositories in an organization.

To use this endpoint, you must be an organization owner or be member of a team with the security manager role.
A token with the 'write:org' scope is also required.

GitHub Apps must have the `organization_administration:write` permission to use this endpoint.

For more information, see "[Managing security managers in your organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."

---

### Examples
> EXAMPLE 1

```PowerShell
Update-GitHubOrganizationSecurityFeature -Organization 'github' -SecurityProduct 'dependency_graph' -Enablement 'enable_all'
Enable the dependency graph for all repositories in the organization `github`.
```

---

### Parameters
#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SecurityProduct**
The security feature to enable or disable.
Valid Values:

* dependency_graph
* dependabot_alerts
* dependabot_security_updates
* advanced_security
* code_scanning_default_setup
* secret_scanning
* secret_scanning_push_protection

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|true    |2       |false        |security_product|

#### **Enablement**
The action to take.
enable_all means to enable the specified security feature for all repositories in the organization. disable_all
means to disable the specified security feature for all repositories in the organization.
Valid Values:

* enable_all
* disable_all

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **QuerySuite**
CodeQL query suite to be used. If you specify the query_suite parameter, the default setup will be configured with
this query suite only on all repositories that didn't have default setup already configured. It will not change the
query suite on repositories that already have default setup configured. If you don't specify any query_suite in your
request, the preferred query suite of the organization will be applied.
Valid Values:

* default
* extended

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |4       |false        |query_suite|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

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
[Enable or disable a security feature for an organization](https://docs.github.com/rest/orgs/orgs#enable-or-disable-a-security-feature-for-an-organization)

---

### Syntax
```PowerShell
Update-GitHubOrganizationSecurityFeature [-Organization] <String> [-SecurityProduct] <String> [-Enablement] <String> [[-QuerySuite] <String>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
