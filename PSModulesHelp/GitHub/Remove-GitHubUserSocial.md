Remove-GitHubUserSocial
-----------------------

### Synopsis
Delete social accounts for the authenticated user

---

### Description

Deletes one or more social accounts from the authenticated user's profile. This endpoint is accessible with the `user` scope.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubUserSocial -AccountUrls 'https://twitter.com/MyTwitterAccount'
```

---

### Parameters
#### **URL**
Full URLs for the social media profiles to add.

|Type        |Required|Position|PipelineInput|Aliases                                         |
|------------|--------|--------|-------------|------------------------------------------------|
|`[String[]]`|true    |1       |false        |account_urls<br/>social_accounts<br/>AccountUrls|

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
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Delete social accounts for the authenticated user](https://docs.github.com/rest/users/social-accounts#delete-social-accounts-for-the-authenticated-user)

---

### Syntax
```PowerShell
Remove-GitHubUserSocial [-URL] <String[]> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
