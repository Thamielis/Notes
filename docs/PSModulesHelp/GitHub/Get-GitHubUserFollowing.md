Get-GitHubUserFollowing
-----------------------

### Synopsis
List the people a given user or the authenticated user follows

---

### Description

Lists the people who a given user or the authenticated user follows.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubUserFollowing
Gets all people the authenticated user follows.
```
> EXAMPLE 2

```PowerShell
Get-GitHubUserFollowing -Username 'octocat'
Gets all people that 'octocat' follows.
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
[List the people the authenticated user follows](https://docs.github.com/rest/users/followers#list-the-people-the-authenticated-user-follows)
[List the people a user follows](https://docs.github.com/rest/users/followers#list-the-people-a-user-follows)

---

### Syntax
```PowerShell
Get-GitHubUserFollowing [[-Username] <String>] [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
