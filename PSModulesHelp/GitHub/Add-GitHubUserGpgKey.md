Add-GitHubUserGpgKey
--------------------

### Synopsis
Create a GPG key for the authenticated user

---

### Description

Adds a GPG key to the authenticated user's GitHub account.
Requires that you are authenticated via Basic Auth, or OAuth with at least `write:gpg_key`
[scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).

---

### Examples
> EXAMPLE 1

Add-GitHubUserGpgKey -Name 'GPG key for GitHub' -ArmoredPublicKey @'
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1
mQINBFnZ2ZIBEADQ2Z7Z7
-----END PGP PUBLIC KEY BLOCK-----
'@

Adds a GPG key to the authenticated user's GitHub account.

---

### Parameters
#### **Name**
A descriptive name for the new key.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **ArmoredPublicKey**
A GPG key in ASCII-armored format.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|true    |2       |true (ByPropertyName)|armored_public_key|

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
[Create a GPG key for the authenticated user](https://docs.github.com/rest/users/gpg-keys#create-a-gpg-key-for-the-authenticated-user)

---

### Syntax
```PowerShell
Add-GitHubUserGpgKey [-Name] <String> [-ArmoredPublicKey] <String> [[-Context] <Object>] [<CommonParameters>]
```
