Block-GitHubUser
----------------

### Synopsis
Block a user from user or an organization.

---

### Description

Blocks the given user and returns true.
If the user cannot be blocked false is returned.

---

### Examples
> EXAMPLE 1

```PowerShell
Block-GitHubUser -Username 'octocat'
Blocks the user 'octocat' for the authenticated user.
Returns $true if successful, $false if not.
```
> EXAMPLE 2

```PowerShell
Block-GitHubUser -Organization 'GitHub' -Username 'octocat'
Blocks the user 'octocat' from the organization 'GitHub'.
Returns $true if successful, $false if not.
```

---

### Parameters
#### **Username**
The handle for the GitHub user account.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |login  |

#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Outputs
* [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)

---

### Notes
[Block a user](https://docs.github.com/rest/users/blocking#block-a-user)
[Block a user from an organization](https://docs.github.com/rest/orgs/blocking#block-a-user-from-an-organization)

---

### Syntax
```PowerShell
Block-GitHubUser -Username <String> [-Organization <String>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Block-GitHubUser -Username <String> -Organization <String> [-Context <Object>] [<CommonParameters>]
```
