Get-GitHubUserGpgKey
--------------------

### Synopsis
List GPG keys for a given user or the authenticated user

---

### Description

Lists a given user's or the current user's GPG keys.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubUserGpgKey
Gets all GPG keys for the authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubUserGpgKey -ID '1234567'
Gets the GPG key with ID '1234567' for the authenticated user.
```
> EXAMPLE 3

```PowerShell
Get-GitHubUserGpgKey -Username 'octocat'
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
Get-GitHubUserGpgKey [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUserGpgKey -Username <String> [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUserGpgKey [-ID <String>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
