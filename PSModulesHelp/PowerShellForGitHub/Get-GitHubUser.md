Get-GitHubUser
--------------

### Synopsis
Retrieves information about the specified user on GitHub.

---

### Description

Retrieves information about the specified user on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubUser -UserName octocat
Gets information on just the user named 'octocat'
```
> EXAMPLE 2

```PowerShell
'octocat', 'PowerShellForGitHubTeam' | Get-GitHubUser
Gets information on the users named 'octocat' and 'PowerShellForGitHubTeam'
```
> EXAMPLE 3

```PowerShell
Get-GitHubUser
Gets information on every GitHub user.
```
> EXAMPLE 4

```PowerShell
Get-GitHubUser -Current
Gets information on the current authenticated user.
```

---

### Parameters
#### **UserName**
The GitHub user to retrieve information for.
If not specified, will retrieve information on all GitHub users
(and may take a while to complete).

|Type      |Required|Position|PipelineInput                 |Aliases      |
|----------|--------|--------|------------------------------|-------------|
|`[String]`|false   |named   |true (ByValue, ByPropertyName)|User<br/>Name|

#### **Current**
If specified, gets information on the current user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
GitHub.User

---

### Outputs
* GitHub.User

---

### Notes
The email key in the following response is the publicly visible email address from the
user's GitHub profile page.  You only see publicly visible email addresses when
authenticated with GitHub.

When setting up your profile, a user can select a primary email address to be public
which provides an email entry for this endpoint.  If the user does not set a public
email address for email, then it will have a value of null.

---

### Syntax
```PowerShell
Get-GitHubUser [-UserName <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubUser [-Current] [-AccessToken <String>] [<CommonParameters>]
```
