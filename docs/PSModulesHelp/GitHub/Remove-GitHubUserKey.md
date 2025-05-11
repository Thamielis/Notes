Remove-GitHubUserKey
--------------------

### Synopsis
Delete a public SSH key for the authenticated user

---

### Description

Removes a public SSH key from the authenticated user's GitHub account.
Requires that you are authenticated via Basic Auth or via OAuth with at least `admin:public_key`
[scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).

---

### Examples
> EXAMPLE 1

Remove-GitHubUserKey -ID '1234567'
Deletes the public SSH key with ID '1234567' from the authenticated user's GitHub account.

---

### Parameters
#### **ID**
The unique identifier of the key.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |1       |false        |key_id |

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
[Delete a public SSH key for the authenticated user](https://docs.github.com/rest/users/keys#delete-a-public-ssh-key-for-the-authenticated-user)

---

### Syntax
```PowerShell
Remove-GitHubUserKey [-ID] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
