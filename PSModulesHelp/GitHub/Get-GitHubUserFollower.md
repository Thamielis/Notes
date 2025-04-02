Get-GitHubUserFollower
----------------------

### Synopsis
List followers of a given user or the authenticated user

---

### Description

Lists the people following a given user or the authenticated user.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubUserFollower
Gets all followers of the authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubUserFollower -Username 'octocat'
Gets all followers of the user 'octocat'.
```

---

### Parameters
#### **Username**
The handle for the GitHub user account.

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
[List followers of the authenticated user](https://docs.github.com/rest/users/followers#list-followers-of-the-authenticated-user)

---

### Syntax
```PowerShell
Get-GitHubUserFollower [[-Username] <String>] [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
