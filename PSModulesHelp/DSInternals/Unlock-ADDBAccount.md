Unlock-ADDBAccount
------------------

### Synopsis
Unlocks an Active Directory account in an offline ntds.dit file.

---

### Description

Finds an account in Active Directory database file and sets its lockoutTime attribute to 0.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Unlock-ADDBAccount.md)

* [Enable-ADDBAccount](Enable-ADDBAccount)

* [Disable-ADDBAccount](Disable-ADDBAccount)

* [Get-ADDBAccount](Get-ADDBAccount)

---

### Examples
> Example 1

```PowerShell
PS C:\> Unlock-ADDBAccount -SamAccountName john -DatabasePath .\ntds.dit
Finds an account with name john and unlocks it.
```

---

### Parameters
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
Unlock-ADDBAccount -DatabasePath <String> -DistinguishedName <String> [-Force] [-LogPath <String>] [-SkipMetaUpdate] [<CommonParameters>]
```
```PowerShell
Unlock-ADDBAccount -DatabasePath <String> [-Force] [-LogPath <String>] -ObjectGuid <Guid> [-SkipMetaUpdate] [<CommonParameters>]
```
```PowerShell
Unlock-ADDBAccount -DatabasePath <String> [-Force] [-LogPath <String>] -ObjectSid <SecurityIdentifier> [-SkipMetaUpdate] [<CommonParameters>]
```
```PowerShell
Unlock-ADDBAccount [-SamAccountName] <String> -DatabasePath <String> [-Force] [-LogPath <String>] [-SkipMetaUpdate] [<CommonParameters>]
```
