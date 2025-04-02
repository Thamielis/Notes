Add-GitHubUserFollowing
-----------------------

### Synopsis
Follow a user

---

### Description

Note that you'll need to set `Content-Length` to zero when calling out to this endpoint.
For more information, see "[HTTP verbs](https://docs.github.com/rest/overview/resources-in-the-rest-api#http-verbs)."
Following a user requires the user to be logged in and authenticated with basic auth or OAuth with the `user:follow` scope.

---

### Examples
> EXAMPLE 1

```PowerShell
Follow-GitHubUser -Username 'octocat'
Follows the user with the username 'octocat'.
```

---

### Parameters
#### **Username**
The handle for the GitHub user account.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

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
[Follow a user](https://docs.github.com/rest/users/followers#follow-a-user)

---

### Syntax
```PowerShell
Add-GitHubUserFollowing [-Username] <String> [[-Context] <Object>] [<CommonParameters>]
```
