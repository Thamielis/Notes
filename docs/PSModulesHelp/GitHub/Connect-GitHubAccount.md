Connect-GitHubAccount
---------------------

### Synopsis
Connects to GitHub.

---

### Description

Connects to GitHub using one of the following logon methods:
- a personal access token
- device code login (interactive user login)
- a system access token (for GitHub Actions)
- a GitHub App using JWT or installation access token

For device flow / device code login:
PowerShell requests device and user verification codes and gets the authorization URL where you will enter the user verification code.
In GitHub you will be asked to enter a user verification code at <https://github.com/login/device>.
PowerShell will keep polling GitHub for the user authentication status. Once you have authorized the device,
the app will be able to make API calls with a new access token.

---

### Examples
> EXAMPLE 1

Connect-GitHubAccount
Connects to GitHub using a device flow login.
If the user has already logged in, the access token will be refreshed.
> EXAMPLE 2

```PowerShell
$env:GH_TOKEN = '***'
Connect-GitHubAccount
Connects to GitHub using the access token from environment variable, assuming unattended mode.
```
> EXAMPLE 3

Connect-GitHubAccount -UseAccessToken
! Enter your personal access token: *************
User gets prompted for the access token and stores it in the context.
The token is used when connecting to GitHub.
> EXAMPLE 4

```PowerShell
Connect-GitHubAccount -Mode 'OAuthApp' -Scope 'gist read:org repo workflow'
Connects to GitHub using a device flow login and sets the scope of the access token.
```

---

### Parameters
#### **Mode**
Choose between authentication methods, either OAuthApp or GitHubApp.
For more info about the types of authentication visit:
[Differences between GitHub Apps and OAuth apps](https://docs.github.com/apps/oauth-apps/building-oauth-apps/differences-between-github-apps-and-oauth-apps)
Valid Values:

* OAuthApp
* GitHubApp

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Scope**
The scope of the access token, when using OAuth authentication.
Provide the list of scopes as space-separated values.
For more information on scopes visit:
[Scopes for OAuth apps](https://docs.github.com/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UseAccessToken**
The user will be prompted to enter the token.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Token**
An access token to use for authentication. Can be both a string or a SecureString.
Supports both personal access tokens (PAT) and GitHub App installation access tokens (IAT).
Example: 'ghp_1234567890abcdef'
Example: 'ghs_1234567890abcdef'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |named   |false        |

#### **ClientID**
The client ID for the GitHub App to use for authentication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PrivateKey**
The private key for the GitHub App when authenticating as a GitHub App.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **AutoloadInstallations**
Automatically load installations for the GitHub App.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Enterprise**
The default enterprise to use in commands.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Owner**
Set the default owner to use in commands.

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[String]`|false   |named   |false        |Organization|

#### **Repository**
Set the default repository to use in commands.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HostName**
The host to connect to. Can use $env:GITHUB_SERVER_URL to set the host, as the protocol is removed automatically.
Example: github.com, github.enterprise.com, msx.ghe.com

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|false   |named   |false        |Server<br/>Host|

#### **Silent**
Suppresses the output of the function.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Quiet  |

#### **NotDefault**
Make the connected context NOT the default context.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Passes the context object to the pipeline.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Authenticating to the REST API](https://docs.github.com/rest/overview/other-authentication-methods#authenticating-for-saml-sso)

---

### Syntax
```PowerShell
Connect-GitHubAccount [-Mode <String>] [-Scope <String>] [-ClientID <String>] [-Enterprise <String>] [-Owner <String>] [-Repository <String>] [-HostName <String>] [-Silent] [-NotDefault] [-PassThru] [<CommonParameters>]
```
```PowerShell
Connect-GitHubAccount -UseAccessToken [-Enterprise <String>] [-Owner <String>] [-Repository <String>] [-HostName <String>] [-Silent] [-NotDefault] [-PassThru] [<CommonParameters>]
```
```PowerShell
Connect-GitHubAccount -Token <Object> [-Enterprise <String>] [-Owner <String>] [-Repository <String>] [-HostName <String>] [-Silent] [-NotDefault] [-PassThru] [<CommonParameters>]
```
```PowerShell
Connect-GitHubAccount -ClientID <String> -PrivateKey <String> [-AutoloadInstallations] [-Enterprise <String>] [-Owner <String>] [-Repository <String>] [-HostName <String>] [-Silent] [-NotDefault] [-PassThru] [<CommonParameters>]
```
