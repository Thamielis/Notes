New-GitHubRepositoryBranchProtectionRule
----------------------------------------

### Synopsis
Creates a branch protection rule for a branch on a given GitHub repository.

---

### Description

Creates a branch protection rules for a branch on a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubRepositoryBranchProtectionRule -OwnerName microsoft -RepositoryName PowerShellForGitHub -BranchName master -EnforceAdmins
Creates a branch protection rule for the master branch of the PowerShellForGithub repository
enforcing all configuration restrictions for administrators.
```
> EXAMPLE 2

```PowerShell
New-GitHubRepositoryBranchProtectionRule -Uri 'https://github.com/microsoft/PowerShellForGitHub' -BranchName master -RequiredApprovingReviewCount 1
Creates a branch protection rule for the master branch of the PowerShellForGithub repository
requiring one approving review.
```

---

### Parameters
#### **OwnerName**
Owner of the repository.
If not supplied here, the DefaultOwnerName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RepositoryName**
Name of the repository.
If not supplied here, the DefaultRepositoryName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Uri**
Uri for the repository.
The OwnerName and RepositoryName will be extracted from here instead of needing to provide
them individually.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |2       |true (ByPropertyName)|RepositoryUrl|

#### **BranchName**
Name of the specific branch to create the protection rule on.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **StatusChecks**
The list of status checks to require in order to merge into the branch.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **RequireUpToDateBranches**
Require branches to be up to date before merging. This setting will not take effect unless
at least one status check is defined.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnforceAdmins**
Enforce all configured restrictions for administrators.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DismissalUsers**
Specify the user names of users who can dismiss pull request reviews. This can only be
specified for organization-owned repositories.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **DismissalTeams**
Specify which teams can dismiss pull request reviews.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **DismissStaleReviews**
If specified, approving reviews when someone pushes a new commit are automatically
dismissed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RequireCodeOwnerReviews**
Blocks merging pull requests until code owners review them.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RequiredApprovingReviewCount**
Specify the number of reviewers required to approve pull requests. Use a number between 1
and 6.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **RestrictPushUsers**
Specify which users have push access.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **RestrictPushTeams**
Specify which teams have push access.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **RestrictPushApps**
Specify which apps have push access.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **RequireLinearHistory**
Enforces a linear commit Git history, which prevents anyone from pushing merge commits to a
branch. Your repository must allow squash merging or rebase merging before you can enable a
linear commit history.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowForcePushes**
Permits force pushes to the protected branch by anyone with write access to the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowDeletions**
Allows deletion of the protected branch by anyone with write access to the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Inputs
GitHub.Repository
GitHub.Branch

---

### Outputs
* GitHub.BranchRepositoryRule

---

### Notes
Protecting a branch requires admin or owner permissions to the repository.

---

### Syntax
```PowerShell
New-GitHubRepositoryBranchProtectionRule [-OwnerName <String>] [-RepositoryName <String>] [-BranchName] <String> [-StatusChecks <String[]>] [-RequireUpToDateBranches] [-EnforceAdmins] [-DismissalUsers <String[]>] [-DismissalTeams <String[]>] [-DismissStaleReviews] [-RequireCodeOwnerReviews] [-RequiredApprovingReviewCount <Int32>] [-RestrictPushUsers <String[]>] [-RestrictPushTeams <String[]>] [-RestrictPushApps <String[]>] [-RequireLinearHistory] [-AllowForcePushes] [-AllowDeletions] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubRepositoryBranchProtectionRule [-Uri] <String> [-BranchName] <String> [-StatusChecks <String[]>] [-RequireUpToDateBranches] [-EnforceAdmins] [-DismissalUsers <String[]>] [-DismissalTeams <String[]>] [-DismissStaleReviews] [-RequireCodeOwnerReviews] [-RequiredApprovingReviewCount <Int32>] [-RestrictPushUsers <String[]>] [-RestrictPushTeams <String[]>] [-RestrictPushApps <String[]>] [-RequireLinearHistory] [-AllowForcePushes] [-AllowDeletions] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
