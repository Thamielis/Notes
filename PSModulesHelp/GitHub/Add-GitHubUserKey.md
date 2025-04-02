Add-GitHubUserKey
-----------------

### Synopsis
Create a public SSH key for the authenticated user

---

### Description

Adds a public SSH key to the authenticated user's GitHub account.
Requires that you are authenticated via Basic Auth, or OAuth with at least `write:public_key`
[scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).

---

### Examples
> EXAMPLE 1

Add-GitHubUserKey -Title 'ssh-rsa AAAAB3NzaC1yc2EAAA' -Key '2Sg8iYjAxxmI2LvUXpJjkYrMxURPc8r+dB7TJyvv1234'
Adds a new public SSH key to the authenticated user's GitHub account.

---

### Parameters
#### **Title**
A descriptive name for the new key.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|false   |1       |true (ByValue, ByPropertyName)|name   |

#### **Key**
The public SSH key to add to your GitHub account.

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
[Create a public SSH key for the authenticated user](https://docs.github.com/rest/users/keys#create-a-public-ssh-key-for-the-authenticated-user)

---

### Syntax
```PowerShell
Add-GitHubUserKey [[-Title] <String>] [-Key] <String> [[-Context] <Object>] [<CommonParameters>]
```
