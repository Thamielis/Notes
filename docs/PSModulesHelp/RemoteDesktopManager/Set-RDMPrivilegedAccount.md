Set-RDMPrivilegedAccount
------------------------

### Synopsis
Set RDM privileged account.

---

### Description

Set RDM privileged account. Set Username/Password type directly or modify the result of Get-RDMPrivilegedAccount.To modify member starting with Safe, set the property without the Safe. On Windows, the policy DisableMyPrivilegedAccount prevent using this cmdlet.

---

### Related Links
* [Get-RDMPrivilegedAccount](Get-RDMPrivilegedAccount)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $pwd = Read-Host -AsSecureString; Set-RDMPrivilegedAccount username domain $pwd
Set RDM privileged account of the type Username/Password.
```
> EXAMPLE 2

PS C:\> $privAcc = Get-RDMPrivilegedAccount; $privAcc.Credentials.SecretServerPassword = (ConvertTo-SecureString -AsPlainText 'aPassword'); $privAcc.Credentials.SecretServerUsername = 'aPassword'; $privAcc.Credentials.SecretServerDomain = 'aDomain'; Set-RDMPrivilegedAccount -Session $privAcc
Fetch the privileged account. Modify the Secret Server's domain, password and username value. Save the modificatons. The password modification can be seen in the value change of the field SafeSecretServerPassword.

---

### Parameters
#### **AlwaysAskPassword**
Set Always ask password option in privileged account

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |4       |false        |

#### **Domain**
Set domain in privileged account

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Password**
Set password in privileged account

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |3       |false        |

#### **Session**
The credentials obtained from Get-RDMPrivilegedAccount.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|false   |1       |false        |

#### **Username**
Set username in privileged account

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
For more information, type "Get-Help Set-RDMPrivilegedAccount -detailed". For technical information, type "Get-Help Set-RDMPrivilegedAccount -full".

---

### Syntax
```PowerShell
Set-RDMPrivilegedAccount [[-Username] <String>] [[-Password] <SecureString>] [[-Domain] <String>] [[-AlwaysAskPassword] <Boolean>] [<CommonParameters>]
```
```PowerShell
Set-RDMPrivilegedAccount [[-Session] <PSConnection>] [<CommonParameters>]
```
