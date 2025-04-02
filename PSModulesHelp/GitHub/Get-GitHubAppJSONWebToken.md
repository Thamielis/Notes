Get-GitHubAppJSONWebToken
-------------------------

### Synopsis
Generates a JSON Web Token (JWT) for a GitHub App.

---

### Description

Generates a JSON Web Token (JWT) for a GitHub App.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubAppJWT -ClientId 'Iv987654321' -PrivateKeyFilePath '/path/to/private-key.pem'
Generates a JSON Web Token (JWT) for a GitHub App using the specified client ID and private key file path.
```
> EXAMPLE 2

```PowerShell
Get-GitHubAppJWT -ClientId 'Iv987654321' -PrivateKey '--- BEGIN RSA PRIVATE KEY --- ... --- END RSA PRIVATE KEY ---'
Generates a JSON Web Token (JWT) for a GitHub App using the specified client ID and private key.
```

---

### Parameters
#### **ClientId**
The client ID of the GitHub App.
Can use the GitHub App ID or the client ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **PrivateKeyFilePath**
The path to the private key file of the GitHub App.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **PrivateKey**
The private key of the GitHub App.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
[Generating a JSON Web Token (JWT) for a GitHub App | GitHub Docs](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-a-json-web-token-jwt-for-a-github-app#example-using-powershell-to-generate-a-jwt)

---

### Syntax
```PowerShell
Get-GitHubAppJSONWebToken -ClientId <String> -PrivateKey <Object> [<CommonParameters>]
```
```PowerShell
Get-GitHubAppJSONWebToken -ClientId <String> -PrivateKeyFilePath <String> [<CommonParameters>]
```
