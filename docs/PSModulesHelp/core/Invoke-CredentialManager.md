Invoke-CredentialManager
------------------------

### Synopsis
Function for managing credentials for storage

---

### Description

Used to both store, and retreive a password from an XML file

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-CredentailManager -FilePath .\MySshPassord.auth
Gets (if exists) or stores credentials in .\MySshPassword.auth. Will prompt for credentials if the 
file does not exist.
```
> EXAMPLE 2

```PowerShell
Invoke-CredentailManager -FilePath .\MySshPassord.auth -Credentail $creds
Stores the credentials from object "$creds" into a file in the local directory
```
> EXAMPLE 3

```PowerShell
$strCreds = Get-Password .\test.xml
PS C:\> $strCreds.Username
Me@myDomain.local

PS C:\> $strCreds.Password
VewySecwetPassw0rd!
```

---

### Parameters
#### **FilePath**

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|true    |1       |false        |CredentialsFile|

#### **Credential**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |2       |false        |

#### **ReturnCredObject**
Only for XML objects

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Invoke-CredentialManager [-FilePath] <String> [[-Credential] <PSCredential>] [-ReturnCredObject] [<CommonParameters>]
```
