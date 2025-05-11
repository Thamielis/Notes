Set-ADDBAccountPasswordHash
---------------------------

### Synopsis
Sets the password hash for a user, computer, or service account stored in a ntds.dit file.

---

### Description

Writes the specified NT hash and optionally an entire supplementalCredentials data structure into an offline database. Also enables cross-database / cross-forest password migration without the requirement of a domain trust being in place.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Set-ADDBAccountPasswordHash.md)

* [Set-ADDBAccountPassword](Set-ADDBAccountPassword)

* [Set-SamAccountPasswordHash](Set-SamAccountPasswordHash)

* [Unlock-ADDBAccount](Unlock-ADDBAccount)

* [Get-BootKey](Get-BootKey)

* [Get-ADDBAccount](Get-ADDBAccount)

---

### Examples
> Example 1

```PowerShell
PS C:\> $pass = Read-Host -AsSecureString -Prompt 'Provide new password for user hacker'
PS C:\> $hash = ConvertTo-NTHash $pass
PS C:\> Set-ADDBAccountPasswordHash -SamAccountName john `
                                    -NTHash $hash `
                                    -DatabasePath '.\ADBackup\Active Directory\ntds.dit' `
                                    -BootKey 0be7a2afe1713642182e9b96f73a75da
Performs an offline password reset for user john by injecting a raw NT hash value.
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

#### **NTHash**
Specifies the NT hash of a password that will be written to the target AD database.

|Type      |Required|Position|PipelineInput        |Aliases                                             |
|----------|--------|--------|---------------------|----------------------------------------------------|
|`[Byte[]]`|true    |named   |True (ByPropertyName)|Hash<br/>PasswordHash<br/>NTLMHash<br/>MD4Hash<br/>h|

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

#### **SupplementalCredentials**
Specifies the kerberos keys and WDigest hashes that will be written to the target AD database.

|Type                       |Required|Position|PipelineInput        |Aliases                  |
|---------------------------|--------|--------|---------------------|-------------------------|
|`[SupplementalCredentials]`|false   |named   |True (ByPropertyName)|KerberosKeys<br/>sc<br/>c|

---

### Inputs
System.Byte[]

DSInternals.Common.Data.SupplementalCredentials

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
Set-ADDBAccountPasswordHash -BootKey <Byte[]> -DatabasePath <String> -DistinguishedName <String> [-Force] [-LogPath <String>] -NTHash <Byte[]> [-SkipMetaUpdate] [-SupplementalCredentials <SupplementalCredentials>] [<CommonParameters>]
```
```PowerShell
Set-ADDBAccountPasswordHash -BootKey <Byte[]> -DatabasePath <String> [-Force] [-LogPath <String>] -NTHash <Byte[]> -ObjectGuid <Guid> [-SkipMetaUpdate] [-SupplementalCredentials <SupplementalCredentials>] [<CommonParameters>]
```
```PowerShell
Set-ADDBAccountPasswordHash -BootKey <Byte[]> -DatabasePath <String> [-Force] [-LogPath <String>] -NTHash <Byte[]> -ObjectSid <SecurityIdentifier> [-SkipMetaUpdate] [-SupplementalCredentials <SupplementalCredentials>] [<CommonParameters>]
```
```PowerShell
Set-ADDBAccountPasswordHash [-SamAccountName] <String> -BootKey <Byte[]> -DatabasePath <String> [-Force] [-LogPath <String>] -NTHash <Byte[]> [-SkipMetaUpdate] [-SupplementalCredentials <SupplementalCredentials>] [<CommonParameters>]
```
