Set-ADDBPrimaryGroup
--------------------

### Synopsis
Modifies the primaryGroupId attribute of an object in a ntds.dit file.

---

### Description

Modifies the primaryGroupId attribute of an account in a ntds.dit file. The most relevant group relative identifiers (RIDs) include 512 for Domain Admins , 513 for Domain Users , and 519 for Schema Admins .

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Set-ADDBPrimaryGroup.md)

* [Add-ADDBSidHistory](Add-ADDBSidHistory)

* [Get-ADDBAccount](Get-ADDBAccount)

---

### Examples
> Example 1

```PowerShell
PS C:\> Set-ADDBPrimaryGroup -SamAccountName John `
                             -PrimaryGroupId 512 `
                             -DatabasePath 'D:\Windows\NTDS\ntds.dit'
Moves the account John from the default Domain Users group to Domain Admins .
```

---

### Parameters
#### **DatabasePath**
Specifies the path to a domain database, for instance, C:\Windows\NTDS\ntds.dit.

|Type      |Required|Position|PipelineInput|Aliases                                                |
|----------|--------|--------|-------------|-------------------------------------------------------|
|`[String]`|true    |named   |False        |Database<br/>DBPath<br/>DatabaseFilePath<br/>DBFilePath|

#### **DistinguishedName**
Specifies the identifier of an object on which to perform this operation.

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
Specifies the identifier of an object on which to perform this operation.

|Type    |Required|Position|PipelineInput        |Aliases|
|--------|--------|--------|---------------------|-------|
|`[Guid]`|true    |named   |True (ByPropertyName)|Guid   |

#### **ObjectSid**
Specifies the identifier of an object on which to perform this operation.

|Type                  |Required|Position|PipelineInput        |Aliases|
|----------------------|--------|--------|---------------------|-------|
|`[SecurityIdentifier]`|true    |named   |True (ByPropertyName)|Sid    |

#### **PrimaryGroupId**
Specifies the new primary group relative identifier (RID) that will be written to the database.

|Type     |Required|Position|PipelineInput        |Aliases                                   |
|---------|--------|--------|---------------------|------------------------------------------|
|`[Int32]`|true    |named   |True (ByPropertyName)|gid<br/>Group<br/>PrimaryGroup<br/>GroupId|

#### **SamAccountName**
Specifies the identifier of an object on which to perform this operation.

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
System.Int32

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
Set-ADDBPrimaryGroup -DatabasePath <String> -DistinguishedName <String> [-Force] [-LogPath <String>] -PrimaryGroupId <Int32> [-SkipMetaUpdate] [<CommonParameters>]
```
```PowerShell
Set-ADDBPrimaryGroup -DatabasePath <String> [-Force] [-LogPath <String>] -ObjectGuid <Guid> -PrimaryGroupId <Int32> [-SkipMetaUpdate] [<CommonParameters>]
```
```PowerShell
Set-ADDBPrimaryGroup -DatabasePath <String> [-Force] [-LogPath <String>] -ObjectSid <SecurityIdentifier> -PrimaryGroupId <Int32> [-SkipMetaUpdate] [<CommonParameters>]
```
```PowerShell
Set-ADDBPrimaryGroup [-SamAccountName] <String> -DatabasePath <String> [-Force] [-LogPath <String>] -PrimaryGroupId <Int32> [-SkipMetaUpdate] [<CommonParameters>]
```
