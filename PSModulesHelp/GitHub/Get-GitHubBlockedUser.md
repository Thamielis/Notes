Get-GitHubBlockedUser
---------------------

### Synopsis
List blocked users.

---

### Description

List the users that are blocked on your personal account or a given organization.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubBlockedUser
Returns a list of users blocked by the authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubBlockedUser -Organization 'github'
Lists all users blocked by the organization `github`.
```

---

### Parameters
#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|false   |1       |true (ByValue, ByPropertyName)|login  |

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[List users blocked by the authenticated user](https://docs.github.com/rest/users/blocking#list-users-blocked-by-the-authenticated-user)
[List users blocked by an organization](https://docs.github.com/rest/orgs/blocking#list-users-blocked-by-an-organization)

---

### Syntax
```PowerShell
Get-GitHubBlockedUser [[-Organization] <String>] [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
