Set-GitHubEnvironment
---------------------

### Synopsis
Create or update an environment.

---

### Description

Create or update an environment with protection rules, such as required reviewers. For more information about
environment protection rules, see "[Environments](https://docs.github.com/en/actions/reference/environments#environment-protection-rules)."

To create or update name patterns that branches must match in order to deploy to this environment, see
"[Deployment branch policies](https://docs.github.com/en/rest/deployments/branch-policies)."

To create or update secrets for an environment, see "[GitHub Actions secrets](https://docs.github.com/en/rest/actions/secrets)."

OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint.

---

### Related Links
* [https://psmodule.io/GitHub/Functions/Environments/Set-GitHubEnvironment/](https://psmodule.io/GitHub/Functions/Environments/Set-GitHubEnvironment/)

---

### Examples
> EXAMPLE 1

$params = @{
    Owner                  = "my-org"
    Repository             = "my-repo"
    Name                   = "staging"
    WaitTimer              = 30
    Reviewers              = @{ type = $user.Type; id = $user.id }, @{ type = 'team'; id = $team.DatabaseID }
    DeploymentBranchPolicy = 'CustomBranchPolicies'
Set-GitHubEnvironment @params
Output:
```powershell
id                       : 5944178128
node_id                  : EN_kwDOOJqfM88AAAABYkz10A
name                     : test
url                      : https://api.github.com/repos/PSModule/EnvironmentTest/environments/test
html_url                 : https://github.com/PSModule/EnvironmentTest/deployments/activity_log?environments_filter=test
created_at               : 3/16/2025 11:17:52 PM
updated_at               : 3/16/2025 11:17:52 PM
can_admins_bypass        : True
protection_rules         : {@{id=30352888; node_id=GA_kwDOOJqfM84BzyX4; type=required_reviewers; prevent_self_review=False;
                           reviewers=System.Object[]},@{id=30352889; node_id=GA_kwDOOJqfM84BzyX5; type=wait_timer; wait_timer=100},
                           @{id=30352890; node_id=GA_kwDOOJqfM84BzyX6; type=branch_policy}}
deployment_branch_policy : @{protected_branches=False; custom_branch_policies=True}
```

Creates or updates the "staging" environment with a 30-minute wait timer.

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

#### **WaitTimer**
The amount of time to delay a job after the job is initially triggered.
The time (in minutes) must be an integer between 0 and 43,200 (30 days).

|Type     |Required|Position|PipelineInput        |Aliases   |
|---------|--------|--------|---------------------|----------|
|`[Int32]`|false   |named   |true (ByPropertyName)|wait_timer|

#### **Reviewers**
The people or teams that may review jobs that reference the environment.
Must be an object with the following properties:
* ID: The ID of the user or team.
* Type: The type of reviewer. Can be either 'User' or 'Team'.
Example:
$Reviewers = @(
    @{ ID = 123456789; Type = 'User' },
    @{ ID = 987654321; Type = 'Team' }
)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Array]`|true    |named   |true (ByPropertyName)|

#### **PreventSelfReview**
Whether or not a user who created the job is prevented from approving their own job.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|prevent_self_review|

#### **DeploymentBranchPolicy**
The type of deployment branch policy for this environment.
Valid Values:

* ProtectedBranches
* CustomBranchPolicies

|Type      |Required|Position|PipelineInput        |Aliases                 |
|----------|--------|--------|---------------------|------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|deployment_branch_policy|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

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
Returns the response object from the GitHub API call.

---

### Syntax
```PowerShell
Set-GitHubEnvironment -Owner <String> -Repository <String> -Name <String> [-WaitTimer <Int32>] [-DeploymentBranchPolicy <String>] [-Context <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubEnvironment -Owner <String> -Repository <String> -Name <String> [-WaitTimer <Int32>] -Reviewers <Array> [-PreventSelfReview] [-DeploymentBranchPolicy <String>] [-Context <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
