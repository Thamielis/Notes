Get-GitHubUserEmail
-------------------

### Synopsis
List email addresses for the authenticated user

---

### Description

Lists all of your email addresses, and specifies which one is visible to the public. This endpoint is accessible with the `user:email` scope.
Specifying '-Public' will return only the publicly visible email address, which you can set with the [Set primary email visibility for the
authenticated user](https://docs.github.com/rest/users/emails#set-primary-email-visibility-for-the-authenticated-user) endpoint.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubUserEmail
Gets all email addresses for the authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubUserEmail -Public
Gets the publicly visible email address for the authenticated user.
```

---

### Parameters
#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **Public**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[List email addresses for the authenticated user](https://docs.github.com/rest/users/emails#list-email-addresses-for-the-authenticated-user)
[List public email addresses for the authenticated user](https://docs.github.com/en/rest/users/emails#list-public-email-addresses-for-the-authenticated-user)

---

### Syntax
```PowerShell
Get-GitHubUserEmail [[-PerPage] <Int32>] [-Public] [[-Context] <Object>] [<CommonParameters>]
```
