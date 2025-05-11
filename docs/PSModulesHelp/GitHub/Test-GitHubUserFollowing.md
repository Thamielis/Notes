Test-GitHubUserFollowing
------------------------

### Synopsis
Check if a given user or the authenticated user follows a person

---

### Description

Returns a 204 if the given user or the authenticated user follows another user.
Returns a 404 if the user is not followed by a given user or the authenticated user.

---

### Examples
> EXAMPLE 1

```PowerShell
Test-GitHubUserFollowing -Follows 'octocat'
Test-GitHubUserFollowing 'octocat'
Checks if the authenticated user follows the user 'octocat'.
```
> EXAMPLE 2

```PowerShell
Test-GitHubUserFollowing -Username 'octocat' -Follows 'ratstallion'
Checks if the user 'octocat' follows the user 'ratstallion'.
```

---

### Parameters
#### **Follows**
The handle for the GitHub user account we want to check if is being followed.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Username**
The handle for the GitHub user account.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
[Check if a person is followed by the authenticated user](https://docs.github.com/rest/users/followers#check-if-a-person-is-followed-by-the-authenticated-user)
[Check if a user follows another user](https://docs.github.com/rest/users/followers#check-if-a-user-follows-another-user)

---

### Syntax
```PowerShell
Test-GitHubUserFollowing [-Follows] <String> [-Username] <String> [[-Context] <Object>] [<CommonParameters>]
```
