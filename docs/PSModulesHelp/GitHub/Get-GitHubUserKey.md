Get-GitHubUserKey
-----------------

### Synopsis
List public SSH keys for a given user or the authenticated user.

---

### Description

Lists a given user's or the current user's public SSH keys.
For the authenticated users keys, it requires that you are authenticated via Basic Auth or via OAuth with
at least `read:public_key` [scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
Keys from a given user are accessible by anyone.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubUserKey
Gets all GPG keys for the authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubUserKey -ID '1234567'
Gets the public SSH key with the ID '1234567' for the authenticated user.
```
> EXAMPLE 3

```PowerShell
Get-GitHubUserKey -Username 'octocat'
Gets all GPG keys for the 'octocat' user.
```

---

### Parameters
#### **Username**
The handle for the GitHub user account.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **ID**
The ID of the GPG key.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |gpg_key_id|

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
[List GPG keys for the authenticated user](https://docs.github.com/rest/users/gpg-keys#list-gpg-keys-for-the-authenticated-user)

---

### Syntax
```PowerShell
Get-GitHubUserKey [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUserKey -Username <String> [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUserKey [-ID <String>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
