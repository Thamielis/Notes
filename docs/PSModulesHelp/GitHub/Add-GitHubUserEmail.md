Add-GitHubUserEmail
-------------------

### Synopsis
Add an email address for the authenticated user

---

### Description

This endpoint is accessible with the `user` scope.

---

### Examples
> EXAMPLE 1

Add-GitHubUserEmail -Email 'octocat@github.com','firstname.lastname@work.com'
Adds the email addresses `octocat@github.com` and `firstname.lastname@work.com` to the authenticated user's account.

---

### Parameters
#### **Email**
Adds one or more email addresses to your GitHub account.
Must contain at least one email address.
Note: Alternatively, you can pass a single email address or an array of emails addresses directly,
but we recommend that you pass an object using the emails key.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|

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
[Add an email address for the authenticated user](https://docs.github.com/rest/users/emails#add-an-email-address-for-the-authenticated-user)

---

### Syntax
```PowerShell
Add-GitHubUserEmail [-Email] <String[]> [[-Context] <Object>] [<CommonParameters>]
```
