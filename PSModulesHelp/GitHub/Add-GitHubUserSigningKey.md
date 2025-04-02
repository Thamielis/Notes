Add-GitHubUserSigningKey
------------------------

### Synopsis
Create a SSH signing key for the authenticated user

---

### Description

Creates an SSH signing key for the authenticated user's GitHub account.
You must authenticate with Basic Authentication, or you must authenticate with OAuth with at least `write:ssh_signing_key` scope.
For more information, see
"[Understanding scopes for OAuth apps](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/)."

---

### Examples
> EXAMPLE 1

Add-GitHubUserSigningKey -Title 'ssh-rsa AAAAB3NzaC1yc2EAAA' -Key '2Sg8iYjAxxmI2LvUXpJjkYrMxURPc8r+dB7TJyvv1234'
Creates a new SSH signing key for the authenticated user's GitHub account.

---

### Parameters
#### **Title**
A descriptive name for the new key.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|false   |1       |true (ByValue, ByPropertyName)|name   |

#### **Key**
The public SSH key to add to your GitHub account. For more information, see
[Checking for existing SSH keys](https://docs.github.com/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys)."

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
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[Create a SSH signing key for the authenticated user](https://docs.github.com/rest/users/ssh-signing-keys#create-a-ssh-signing-key-for-the-authenticated-user)

---

### Syntax
```PowerShell
Add-GitHubUserSigningKey [[-Title] <String>] [-Key] <String> [[-Context] <Object>] [<CommonParameters>]
```
