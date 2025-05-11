Get-GitHubEnvironment
---------------------

### Synopsis
Retrieves details of a specified GitHub environment or lists all environments for a repository.

---

### Description

This function retrieves details of a specific environment in a GitHub repository when the `-Name` parameter
is provided. Otherwise, it lists all available environments for the specified repository.

Anyone with read access to the repository can use this function.
OAuth app tokens and personal access tokens (classic) need the `repo` scope
to use this function with a private repository.

---

### Related Links
* [https://psmodule.io/GitHub/Functions/Environments/Get-GitHubEnvironment/](https://psmodule.io/GitHub/Functions/Environments/Get-GitHubEnvironment/)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubEnvironment -Owner 'PSModule' -Repository 'EnvironmentTest' -Name 'test'
Output:
```pwsh
id                       : 5944178128
node_id                  : EN_kwDOOJqfM88AAAABYkz10A
name                     : test
url                      : https://api.github.com/repos/PSModule/EnvironmentTest/environments/test
html_url                 : https://github.com/PSModule/EnvironmentTest/deployments/activity_log?environments_filter=test
created_at               : 3/16/2025 11:17:52 PM
updated_at               : 3/16/2025 11:17:52 PM
can_admins_bypass        : True
protection_rules         : {@{id=30352888; node_id=GA_kwDOOJqfM84BzyX4; type=required_reviewers; prevent_self_review=False;
                           reviewers=System.Object[]}, @{id=30352889; node_id=GA_kwDOOJqfM84BzyX5; type=wait_timer; wait_timer=100},
                           @{id=30352890; node_id=GA_kwDOOJqfM84BzyX6; type=branch_policy}}
deployment_branch_policy : @{protected_branches=False; custom_branch_policies=True}
```

Retrieves details of the "test" environment in the specified repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubEnvironment -Owner 'PSModule' -Repository 'EnvironmentTest'
Output:
```pwsh
id                       : 5944178128
node_id                  : EN_kwDOOJqfM88AAAABYkz10A
name                     : test
url                      : https://api.github.com/repos/PSModule/EnvironmentTest/environments/test
html_url                 : https://github.com/PSModule/EnvironmentTest/deployments/activity_log?environments_filter=test
created_at               : 3/16/2025 11:17:52 PM
updated_at               : 3/16/2025 11:17:52 PM
can_admins_bypass        : True
protection_rules         : {@{id=30352888; node_id=GA_kwDOOJqfM84BzyX4; type=required_reviewers; prevent_self_review=False;
                           reviewers=System.Object[]}, @{id=30352889; node_id=GA_kwDOOJqfM84BzyX5; type=wait_timer; wait_timer=100},
                           @{id=30352890; node_id=GA_kwDOOJqfM84BzyX6; type=branch_policy}}
deployment_branch_policy : @{protected_branches=False; custom_branch_policies=True}
```

Lists all environments available in the "EnvironmentTest" repository owned by "PSModule".
```

---

### Parameters
#### **Owner**
The name of the organization.

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|Organization<br/>User|

#### **Repository**
The name of the Repository.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Name**
The name of the environment.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **PerPage**
The maximum number of environments to return per request.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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
Returns details of a GitHub environment or a list of environments for a repository.

---

### Syntax
```PowerShell
Get-GitHubEnvironment -Owner <String> -Repository <String> [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubEnvironment -Owner <String> -Repository <String> -Name <String> [-Context <Object>] [<CommonParameters>]
```
