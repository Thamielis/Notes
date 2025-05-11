Get-GitHubUserSigningKey
------------------------

### Synopsis
List SSH signing keys for a given user or the authenticated user.

---

### Description

Lists a given user's or the current user's SSH signing keys.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubUserSigningKey
Gets all SSH signing keys for the authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubUserSigningKey -ID '1234567'
Gets the SSH signing key with the ID '1234567' for the authenticated user.
```
> EXAMPLE 3

```PowerShell
Get-GitHubUserSigningKey -Username 'octocat'
Gets all SSH signing keys for the 'octocat' user.
```

---

### Parameters
#### **Username**
The handle for the GitHub user account.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **ID**
The unique identifier of the SSH signing key.

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
[List SSH signing keys for the authenticated user](https://docs.github.com/rest/users/ssh-signing-keys#list-ssh-signing-keys-for-the-authenticated-user)
[Get an SSH signing key for the authenticated user](https://docs.github.com/rest/users/ssh-signing-keys#get-an-ssh-signing-key-for-the-authenticated-user)
[List SSH signing keys for a user](https://docs.github.com/rest/users/ssh-signing-keys#list-ssh-signing-keys-for-a-user)

---

### Syntax
```PowerShell
Get-GitHubUserSigningKey [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUserSigningKey -Username <String> [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUserSigningKey [-ID <String>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
