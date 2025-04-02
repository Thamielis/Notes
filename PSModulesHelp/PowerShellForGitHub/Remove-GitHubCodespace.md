Remove-GitHubCodespace
----------------------

### Synopsis
Remove a Codespace.

---

### Description

Remove a Codespace.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Related Links
* [https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#delete-a-codespace-for-the-authenticated-user](https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#delete-a-codespace-for-the-authenticated-user)

* [https://docs.github.com/en/rest/codespaces/organizations?apiVersion=2022-11-28#delete-a-codespace-from-the-organization](https://docs.github.com/en/rest/codespaces/organizations?apiVersion=2022-11-28#delete-a-codespace-from-the-organization)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubCodespace -Name vercellone-effective-goggles-qrv997q6j9929jx8 | Remove-GitHubCodespace
```
> EXAMPLE 2

```PowerShell
Remove-GitHubCodespace -Name vercellone-effective-goggles-qrv997q6j9929jx8
```
> EXAMPLE 3

```PowerShell
Remove-GitHubCodespace -OrganizationName myorg -UserName jetsong -Name jetsong-button-masher-zzz788y6j8288xp1
```

---

### Parameters
#### **OrganizationName**
Name of the Organization.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **UserName**
The handle for the GitHub user account.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **CodespaceName**
Name of the Codespace.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Force**
If this switch is specified, you will not be prompted for confirmation of command execution.

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

---

### Outputs
* None

---

### Syntax
```PowerShell
Remove-GitHubCodespace -CodespaceName <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GitHubCodespace -OrganizationName <String> -UserName <String> -CodespaceName <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
