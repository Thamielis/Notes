Add-GitHubUserSocial
--------------------

### Synopsis
Add social accounts for the authenticated user

---

### Description

Add one or more social accounts to the authenticated user's profile. This endpoint is accessible with the `user` scope.

---

### Examples
> EXAMPLE 1

Add-GitHubUserSocial -AccountUrls 'https://twitter.com/MyTwitterAccount', 'https://www.linkedin.com/company/MyCompany'
Adds the Twitter and LinkedIn accounts to the authenticated user's profile.

---

### Parameters
#### **URL**
Full URLs for the social media profiles to add.

|Type        |Required|Position|PipelineInput|Aliases                                         |
|------------|--------|--------|-------------|------------------------------------------------|
|`[String[]]`|true    |1       |false        |account_urls<br/>social_accounts<br/>AccountUrls|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Add social accounts for the authenticated user](https://docs.github.com/rest/users/social-accounts#add-social-accounts-for-the-authenticated-user)

---

### Syntax
```PowerShell
Add-GitHubUserSocial [-URL] <String[]> [[-Context] <Object>] [<CommonParameters>]
```
