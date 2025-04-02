Remove-GitHubUserGpgKey
-----------------------

### Synopsis
Delete a GPG key for the authenticated user

---

### Description

Removes a GPG key from the authenticated user's GitHub account.
Requires that you are authenticated via Basic Auth or via OAuth with at least `admin:gpg_key`
[scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubUserGpgKey -ID '1234567'
Gets the GPG key with ID '1234567' for the authenticated user.
```

---

### Parameters
#### **ID**
The ID of the GPG key.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |1       |false        |gpg_key_id|

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
[Delete a GPG key for the authenticated user](https://docs.github.com/rest/users/gpg-keys#delete-a-gpg-key-for-the-authenticated-user)

---

### Syntax
```PowerShell
Remove-GitHubUserGpgKey [-ID] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
