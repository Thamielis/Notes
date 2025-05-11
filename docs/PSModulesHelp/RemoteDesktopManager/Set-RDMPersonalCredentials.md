Set-RDMPersonalCredentials
--------------------------

### Synopsis
Set RDM personal credentials.

---

### Description

Set RDM personal credentials. Set Username/Password type directly or modify the result of Get-RDMPersonalCredentials.To modify member starting with Safe, set the property without the Safe. On Windows, the policy DisableMyPersonalCredentials prevent using this cmdlet.

---

### Related Links
* [Get-RDMPersonalCredentials](Get-RDMPersonalCredentials)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $pwd = Read-Host -AsSecureString; Set-RDMPersonalCredentials username domain $pwd
Set RDM personal credentials of the type Username/Password.
```
> EXAMPLE 2

PS C:\> $perso = Get-RDMPersonalCredentials; $perso.Credentials.SecretServerPassword = (ConvertTo-SecureString -AsPlainText 'aPassword'); $perso.Credentials.SecretServerUsername = 'aPassword'; $perso.Credentials.SecretServerDomain = 'aDomain'; Set-RDMPersonalCredentials -Session $perso
Fetch the personal credentials. Modify the Secret Server's domain, password and username value. Save the modificatons. The password modification can be seen in the value change of the field SafeSecretServerPassword.

---

### Parameters
#### **AlwaysAskPassword**
Set Always ask password option in personal credentials

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |4       |false        |

#### **Domain**
Set domain in personal credentials

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Password**
Set password in personal credentials

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |3       |false        |

#### **Session**
The credentials obtained from Get-RDMPersonalCredentials.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|false   |1       |false        |

#### **Username**
Set username in personal credentials

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPersonalCredentials -detailed". For technical information, type "Get-Help Set-RDMPersonalCredentials -full".

---

### Syntax
```PowerShell
Set-RDMPersonalCredentials [[-Username] <String>] [[-Password] <SecureString>] [[-Domain] <String>] [[-AlwaysAskPassword] <Boolean>] [<CommonParameters>]
```
```PowerShell
Set-RDMPersonalCredentials [[-Session] <PSConnection>] [<CommonParameters>]
```
