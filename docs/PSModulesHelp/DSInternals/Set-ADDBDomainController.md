Set-ADDBDomainController
------------------------

### Synopsis
Writes information about the DC to a ntds.dit file, including the highest committed USN and database epoch.

---

### Description

The Set-ADDBDomainController cmdlet can be used to simulate USN rollbacks, USN depletion, and database file restore operations. This cmdlet should only be used in lab environments.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Set-ADDBDomainController.md)

* [Get-ADDBDomainController](Get-ADDBDomainController)

* [Set-ADDBBootKey](Set-ADDBBootKey)

---

### Examples
> Example 1

```PowerShell
PS C:\> $currentEpoch = Get-ItemPropertyValue -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NTDS\Parameters' -Name 'DSA Database Epoch'
PS C:\> Set-ADDBDomainController -DatabasePath .\ntds.dit -Epoch $currentEpoch -Force
Copies the database epoch from registry to the ntds.dit file.
```
> Example 2

```PowerShell
PS C:\> Set-ADDBDomainController -DatabasePath .\ntds.dit -HighestCommittedUsn 9223372036854775800 -Force
Modifies the highest committed USN of the AD database. This might be helpful when trying to simulate USN rollbacks and USN depletion.
```

---

### Parameters
#### **BackupExpiration**
Specifies the database backup expiration time.

|Type        |Required|Position|PipelineInput|Aliases              |
|------------|--------|--------|-------------|---------------------|
|`[DateTime]`|true    |named   |False        |Expiration<br/>Expire|

#### **DatabasePath**
Specifies the path to a domain database, for instance, C:\Windows\NTDS\ntds.dit.

|Type      |Required|Position|PipelineInput|Aliases                                                |
|----------|--------|--------|-------------|-------------------------------------------------------|
|`[String]`|true    |named   |False        |Database<br/>DBPath<br/>DatabaseFilePath<br/>DBFilePath|

#### **Epoch**
Specifies the database epoch which must be consistent with the information in the registry.

|Type     |Required|Position|PipelineInput|Aliases |
|---------|--------|--------|-------------|--------|
|`[Int32]`|true    |named   |False        |DSAEpoch|

#### **Force**
Confirms that you understand the implications of using this cmdlet and still want to use it.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HighestCommittedUsn**
Specifies the highest committed USN for the database.

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Int64]`|true    |named   |False        |USN    |

#### **LogPath**
Specifies the path to a directory where the transaction log files are located. For instance, C:\Windows\NTDS. The default log directory is the one that contains the database file itself.

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[String]`|false   |named   |False        |Log<br/>TransactionLogPath|

---

### Inputs
None

---

### Outputs
* None

---

### Notes

---

### Syntax
```PowerShell
Set-ADDBDomainController -BackupExpiration <DateTime> -DatabasePath <String> [-Force] [-LogPath <String>] [<CommonParameters>]
```
```PowerShell
Set-ADDBDomainController -DatabasePath <String> -Epoch <Int32> [-Force] [-LogPath <String>] [<CommonParameters>]
```
```PowerShell
Set-ADDBDomainController -DatabasePath <String> [-Force] -HighestCommittedUsn <Int64> [-LogPath <String>] [<CommonParameters>]
```
