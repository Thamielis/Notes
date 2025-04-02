Remove-GitHubUserEmail
----------------------

### Synopsis
Delete an email address for the authenticated user

---

### Description

This endpoint is accessible with the `user` scope.

---

### Examples
> EXAMPLE 1

Remove-GitHubUserEmail -Emails 'octocat@github.com','firstname.lastname@work.com'
Removes the email addresses `octocat@github.com` and `firstname.lastname@work.com` from the authenticated user's account.

---

### Parameters
#### **Email**
Email addresses associated with the GitHub user account.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|

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
[Delete an email address for the authenticated user](https://docs.github.com/rest/users/emails#delete-an-email-address-for-the-authenticated-user)

---

### Syntax
```PowerShell
Remove-GitHubUserEmail [-Email] <String[]> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
