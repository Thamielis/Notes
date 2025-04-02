Test-GitHubBlockedUser
----------------------

### Synopsis
Check if a user is blocked by the authenticated user or an organization.

---

### Description

Returns a 204 if the given user is blocked by the authenticated user or organization.
Returns a 404 if the given user is not blocked, or if the given user account has been identified as spam by GitHub.

---

### Examples
> EXAMPLE 1

```PowerShell
Test-GitHubBlockedUser -Username 'octocat'
Checks if the user `octocat` is blocked by the authenticated user.
Returns true if the user is blocked, false if not.
```
> EXAMPLE 2

```PowerShell
Test-GitHubBlockedUser -Organization 'github' -Username 'octocat'
Checks if the user `octocat` is blocked by the organization `github`.
Returns true if the user is blocked, false if not.
```

---

### Parameters
#### **Username**
The handle for the GitHub user account.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|login  |

#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|false   |2       |true (ByValue, ByPropertyName)|

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

---

### Outputs
* [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)

---

### Notes
[Check if a user is blocked by the authenticated user](https://docs.github.com/rest/users/blocking#check-if-a-user-is-blocked-by-the-authenticated-user)
[Check if a user is blocked by an organization](https://docs.github.com/rest/orgs/blocking#check-if-a-user-is-blocked-by-an-organization)

---

### Syntax
```PowerShell
Test-GitHubBlockedUser [-Username] <String> [[-Organization] <String>] [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
