New-GitHubCodespace
-------------------

### Synopsis
Creates a codespace.

---

### Description

Creates a codespace.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Related Links
* [https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#create-a-codespace-for-the-authenticated-user](https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#create-a-codespace-for-the-authenticated-user)

* [https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#create-a-codespace-in-a-repository](https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#create-a-codespace-in-a-repository)

* [https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#create-a-codespace-from-a-pull-request](https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#create-a-codespace-from-a-pull-request)

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubCodespace -RepositoryId 582779513
Creates a new codespace for the current authenticated user in the specified repository.
```
> EXAMPLE 2

```PowerShell
New-GitHubCodespace -RepositoryId 582779513 -PullRequest 508
Creates a new codespace for the current authenticated user in the specified repository from a pull request.
```
> EXAMPLE 3

```PowerShell
New-GitHubCodespace -OwnerName marykay -RepositoryName one
Creates a codespace owned by the authenticated user in the specified repository.
```

---

### Parameters
#### **OwnerName**
Owner of the Codespace.
If not supplied here, the DefaultOwnerName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **RepositoryName**
Name of the repository.
If not supplied here, the DefaultRepositoryName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Uri**
Uri for the Codespace.
The OwnerName and CodespaceName will be extracted from here instead of needing to provide
them individually.

|Type      |Required|Position|PipelineInput        |Aliases                         |
|----------|--------|--------|---------------------|--------------------------------|
|`[String]`|true    |named   |true (ByPropertyName)|PullRequestUrl<br/>RepositoryUrl|

#### **PullRequest**
The pull request number for this codespace.

|Type     |Required|Position|PipelineInput|Aliases          |
|---------|--------|--------|-------------|-----------------|
|`[Int64]`|false   |named   |false        |PullRequestNumber|

#### **RepositoryId**
The ID for a Repository.  Only applicable when creating a codespace for the current authenticated user.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|true    |named   |false        |

#### **Ref**
Git ref (typically a branch name) for this codespace

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ClientIp**
IP for geo auto-detection when proxying a request.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DevContainerPath**
Path to devcontainer.json config to use for this codespace.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DisplayName**
Display name for this codespace

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Geo**
The geographic area for this codespace.
Assigned by IP if not provided.
Valid Values:

* EuropeWest
* SoutheastAsia
* UsEast
* UsWest

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Machine**
Machine type to use for this codespace.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NoMultipleRepoPermissions**
Whether to authorize requested permissions to other repos from devcontainer.json.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IdleRetentionPeriodMinutes**
Duration in minutes (up to 30 days) after codespace has gone idle in which it will be deleted.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **TimeoutMinutes**
Time in minutes before codespace stops from inactivity.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **WorkingDirectory**
Working directory for this codespace.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Wait**
If present will wait for the codespace to be available.

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
GitHub.Codespace
GitHub.Project
GitHub.PullRequest
GitHub.Repository

---

### Outputs
* GitHub.Codespace

---

### Syntax
```PowerShell
New-GitHubCodespace [-PullRequest <Int64>] -RepositoryId <Int64> [-Ref <String>] [-ClientIp <String>] [-DevContainerPath <String>] [-DisplayName <String>] [-Geo <String>] [-Machine <String>] [-NoMultipleRepoPermissions] [-IdleRetentionPeriodMinutes <Int32>] [-TimeoutMinutes <Int32>] [-WorkingDirectory <String>] [-Wait] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubCodespace -OwnerName <String> -RepositoryName <String> -PullRequest <Int64> [-ClientIp <String>] [-DevContainerPath <String>] [-DisplayName <String>] [-Geo <String>] [-Machine <String>] [-NoMultipleRepoPermissions] [-IdleRetentionPeriodMinutes <Int32>] [-TimeoutMinutes <Int32>] [-WorkingDirectory <String>] [-Wait] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubCodespace -OwnerName <String> -RepositoryName <String> [-Ref <String>] [-ClientIp <String>] [-DevContainerPath <String>] [-DisplayName <String>] [-Geo <String>] [-Machine <String>] [-NoMultipleRepoPermissions] [-IdleRetentionPeriodMinutes <Int32>] [-TimeoutMinutes <Int32>] [-WorkingDirectory <String>] [-Wait] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubCodespace -Uri <String> [-ClientIp <String>] [-DevContainerPath <String>] [-DisplayName <String>] [-Geo <String>] [-Machine <String>] [-NoMultipleRepoPermissions] [-IdleRetentionPeriodMinutes <Int32>] [-TimeoutMinutes <Int32>] [-WorkingDirectory <String>] [-Wait] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
