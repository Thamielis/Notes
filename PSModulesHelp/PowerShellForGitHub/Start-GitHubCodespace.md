Start-GitHubCodespace
---------------------

### Synopsis
Start a Codespace for the currently authenticated user.

---

### Description

Start a Codespace for the currently authenticated user.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Related Links
* [https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#start-a-codespace-for-the-authenticated-user](https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#start-a-codespace-for-the-authenticated-user)

---

### Examples
> EXAMPLE 1

```PowerShell
Start-GitHubCodespace -Name vercellone-effective-goggles-qrv997q6j9929jx8
```

---

### Parameters
#### **CodespaceName**
Name of the Codespace.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Wait**
If present will wait for the codespace to start.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Returns the start action result.  By default, this cmdlet does not generate any output.
You can use "Set-GitHubConfiguration -DefaultPassThru" to control the default behavior
of this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

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
* GitHub.Codespace

---

### Notes
You must authenticate using an access token with the codespace scope to use this endpoint.
GitHub Apps must have write access to the codespaces_lifecycle_admin repository permission to use this endpoint.

---

### Syntax
```PowerShell
Start-GitHubCodespace [-CodespaceName] <String> [-Wait] [-PassThru] [[-AccessToken] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
