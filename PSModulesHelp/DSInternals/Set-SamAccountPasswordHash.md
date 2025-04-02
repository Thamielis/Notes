Set-SamAccountPasswordHash
--------------------------

### Synopsis
Sets NT and LM hashes of an Active Directory or local account through the MS-SAMR protocol.

---

### Description

Sets NT and LM password hashes of a user account in a local or remote Security Account Manager (SAM) or Active Directory (AD) database through the SAM Remote Protocol (MS-SAMR). Note that kerberos AES and DES ekeys of the target account are cleared by this command.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Set-SamAccountPasswordHash.md)

* [Get-ADDBAccount](Get-ADDBAccount)

* [Get-ADReplAccount](Get-ADReplAccount)

* [Set-ADDBAccountPasswordHash](Set-ADDBAccountPasswordHash)

---

### Examples
> Example 1

```PowerShell
PS C:\> Set-SamAccountPasswordHash -SamAccountName 'john' `
                                   -Domain CONTOSO `
                                   -NTHash ac5d3227c79791b451eb28fcd9efbfb2 `
                                   -Server 'lon-dc1.contoso.com'
Resets the NT password hash of the target Active Directory account through the MS-SAMR protocol.
```

---

### Parameters
#### **Credential**
Specifies the user account credentials to be used to perform this task. The default credentials are the credentials of the currently logged on user.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |False        |

#### **Domain**
Specifies the target NetBIOS domain name the target account belongs to.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **LMHash**
Specifies a new LM password hash value in hexadecimal format.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Byte[]]`|false   |named   |True (ByPropertyName)|

#### **NTHash**
Specifies a new NT password hash value in hexadecimal format.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Byte[]]`|true    |named   |True (ByPropertyName)|

#### **SamAccountName**
Specifies user's login.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **Server**
Specifies the name of a SAM server.

|Type      |Required|Position|PipelineInput|Aliases                  |
|----------|--------|--------|-------------|-------------------------|
|`[String]`|false   |named   |False        |ComputerName<br/>Computer|

#### **Sid**
Specifies user SID.

|Type                  |Required|Position|PipelineInput        |
|----------------------|--------|--------|---------------------|
|`[SecurityIdentifier]`|true    |named   |True (ByPropertyName)|

---

### Inputs
System.String

System.Security.Principal.SecurityIdentifier

System.Byte[]

---

### Outputs
* None

---

### Notes

---

### Syntax
```PowerShell
Set-SamAccountPasswordHash [-Credential <PSCredential>] -Domain <String> [-LMHash <Byte[]>] -NTHash <Byte[]> -SamAccountName <String> [-Server <String>] [<CommonParameters>]
```
```PowerShell
Set-SamAccountPasswordHash [-Credential <PSCredential>] [-LMHash <Byte[]>] -NTHash <Byte[]> [-Server <String>] -Sid <SecurityIdentifier> [<CommonParameters>]
```
