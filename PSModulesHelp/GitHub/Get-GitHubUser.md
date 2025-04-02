Get-GitHubUser
--------------

### Synopsis
List user(s)

---

### Description

Get the authenticated user - if no parameters are provided.
Get a given user - if a username is provided.
Lists all users, in the order that they signed up on GitHub - if '-All' is provided.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubUser
Get the authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubUser -Username 'octocat'
Get the 'octocat' user.
```
> EXAMPLE 3

```PowerShell
Get-GitHubUser -All -Since 17722253
Get a list of users, starting with the user 'MariusStorhaug'.
```

---

### Parameters
#### **Username**
The handle for the GitHub user account.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **All**
List all users. Use '-Since' to start at a specific user ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Since**
A user ID. Only return users with an ID greater than this ID.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[Get the authenticated user](https://docs.github.com/rest/users/users)

---

### Syntax
```PowerShell
Get-GitHubUser [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUser -Username <String> [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUser -All [-Since <Int32>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
