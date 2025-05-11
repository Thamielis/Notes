Unblock-GitHubUser
------------------

### Synopsis
Unblock a user

---

### Description

Unblocks the given user and returns true.

---

### Examples
> EXAMPLE 1

```PowerShell
Unblock-GitHubUser -Username 'octocat'
Unblocks the user 'octocat' for the authenticated user.
Returns $true if successful.
```
> EXAMPLE 2

```PowerShell
Unblock-GitHubUser -Organization 'GitHub' -Username 'octocat'
Unblocks the user 'octocat' from the organization 'GitHub'.
Returns $true if successful.
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

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Outputs
* [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)

---

### Notes
[Unblock a user](https://docs.github.com/rest/users/blocking#unblock-a-user)
[Unblock a user from an organization](https://docs.github.com/rest/orgs/blocking#unblock-a-user-from-an-organization)

---

### Syntax
```PowerShell
Unblock-GitHubUser [-Username] <String> [[-Organization] <String>] [[-Context] <Object>] [<CommonParameters>]
```
