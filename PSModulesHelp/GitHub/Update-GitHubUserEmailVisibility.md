Update-GitHubUserEmailVisibility
--------------------------------

### Synopsis
Set primary email visibility for the authenticated user

---

### Description

Sets the visibility for your primary email addresses.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubUserEmailVisibility -Visibility public
Sets the visibility for your primary email addresses to public.
```
> EXAMPLE 2

```PowerShell
Set-GitHubUserEmailVisibility -Visibility private
Sets the visibility for your primary email addresses to private.
```

---

### Parameters
#### **Visibility**
Denotes whether an email is publicly visible.
Valid Values:

* public
* private

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

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
[Set primary email visibility for the authenticated user](https://docs.github.com/rest/users/emails#set-primary-email-visibility-for-the-authenticated-user)

---

### Syntax
```PowerShell
Update-GitHubUserEmailVisibility [-Visibility] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
