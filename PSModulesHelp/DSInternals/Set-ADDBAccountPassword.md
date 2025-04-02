Set-ADDBAccountPassword
-----------------------

### Synopsis
Sets the password for a user, computer, or service account stored in a ntds.dit file.

---

### Description

Generates new password hashes of the given password, including NT hash, WDigest hashes and Kerberos DES, AES128 and AES256 keys and encrypts them into the database using boot key.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Set-ADDBAccountPassword.md)

* [Set-ADDBAccountPasswordHash](Set-ADDBAccountPasswordHash)

* [Set-SamAccountPasswordHash](Set-SamAccountPasswordHash)

* [Unlock-ADDBAccount](Unlock-ADDBAccount)

* [Get-BootKey](Get-BootKey)

* [Get-ADDBAccount](Get-ADDBAccount)

---

### Examples
> Example 1

```PowerShell
PS C:\> $pass = Read-Host -AsSecureString -Prompt 'Provide new password for user john'
PS C:\> Set-ADDBAccountPassword -SamAccountName john `
                                -NewPassword $pass `
                                -DatabasePath '.\ADBackup\Active Directory\ntds.dit' `
                                -BootKey 0be7a2afe1713642182e9b96f73a75da
Performs an offline password reset for user john .
```

---

### Parameters
#### **BootKey**
Specifies the boot key (AKA system key) that will be used to decrypt/encrypt values of secret attributes.

|Type      |Required|Position|PipelineInput|Aliases                     |
|----------|--------|--------|-------------|----------------------------|
|`[Byte[]]`|true    |named   |False        |Key<br/>SysKey<br/>SystemKey|

#### **DatabasePath**
Specifies the path to a domain database, for instance, C:\Windows\NTDS\ntds.dit.

|Type      |Required|Position|PipelineInput|Aliases                                                |
|----------|--------|--------|-------------|-------------------------------------------------------|
|`[String]`|true    |named   |False        |Database<br/>DBPath<br/>DatabaseFilePath<br/>DBFilePath|

#### **DistinguishedName**
Specifies the identifier of an account on which to perform this operation.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |True (ByPropertyName)|dn     |

#### **Force**
Forces the cmdlet to perform the desired operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LogPath**
Specifies the path to a directory where the transaction log files are located. For instance, C:\Windows\NTDS. The default log directory is the one that contains the database file itself.

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[String]`|false   |named   |False        |Log<br/>TransactionLogPath|

#### **NewPassword**
Specifies a new password value. This value is stored as an encrypted string.

|Type            |Required|Position|PipelineInput        |Aliases                                            |
|----------------|--------|--------|---------------------|---------------------------------------------------|
|`[SecureString]`|true    |named   |True (ByPropertyName)|Password<br/>Pwd<br/>Pass<br/>AccountPassword<br/>p|

#### **ObjectGuid**
Specifies the identifier of an account on which to perform this operation.

|Type    |Required|Position|PipelineInput        |Aliases|
|--------|--------|--------|---------------------|-------|
|`[Guid]`|true    |named   |True (ByPropertyName)|Guid   |

#### **ObjectSid**
Specifies the identifier of an account on which to perform this operation.

|Type                  |Required|Position|PipelineInput        |Aliases|
|----------------------|--------|--------|---------------------|-------|
|`[SecurityIdentifier]`|true    |named   |True (ByPropertyName)|Sid    |

#### **SamAccountName**
Specifies the identifier of an account on which to perform this operation.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |0       |True (ByPropertyName)|Login<br/>sam|

#### **SkipMetaUpdate**
Indicates that the replication metadata of the affected object should not be updated.

|Type      |Required|Position|PipelineInput|Aliases                                                                                                       |
|----------|--------|--------|-------------|--------------------------------------------------------------------------------------------------------------|
|`[Switch]`|false   |named   |False        |SkipMeta<br/>NoMetaUpdate<br/>NoMeta<br/>SkipObjMeta<br/>NoObjMeta<br/>SkipMetaDataUpdate<br/>NoMetaDataUpdate|

---

### Inputs
System.Security.SecureString

System.String

System.Security.Principal.SecurityIdentifier

System.Guid

---

### Outputs
* None

---

### Notes

---

### Syntax
```PowerShell
Set-ADDBAccountPassword -BootKey <Byte[]> -DatabasePath <String> -DistinguishedName <String> [-Force] [-LogPath <String>] -NewPassword <SecureString> [-SkipMetaUpdate] [<CommonParameters>]
```
```PowerShell
Set-ADDBAccountPassword -BootKey <Byte[]> -DatabasePath <String> [-Force] [-LogPath <String>] -NewPassword <SecureString> -ObjectGuid <Guid> [-SkipMetaUpdate] [<CommonParameters>]
```
```PowerShell
Set-ADDBAccountPassword -BootKey <Byte[]> -DatabasePath <String> [-Force] [-LogPath <String>] -NewPassword <SecureString> -ObjectSid <SecurityIdentifier> [-SkipMetaUpdate] [<CommonParameters>]
```
```PowerShell
Set-ADDBAccountPassword [-SamAccountName] <String> -BootKey <Byte[]> -DatabasePath <String> [-Force] [-LogPath <String>] -NewPassword <SecureString> [-SkipMetaUpdate] [<CommonParameters>]
```
