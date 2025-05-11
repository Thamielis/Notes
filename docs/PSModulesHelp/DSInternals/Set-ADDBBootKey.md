Set-ADDBBootKey
---------------

### Synopsis
Re-encrypts a ntds.dit file with a new BootKey/SysKey.

---

### Description

Decrypts the password encryption key list from the pekList domain attribute using the current/old boot key and re-encrypts it using a new one. This might be useful during some DC restore operations. Note that this procedure is highly unsupported by Microsoft.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Set-ADDBBootKey.md)

* [Get-BootKey](Get-BootKey)

* [New-ADDBRestoreFromMediaScript](New-ADDBRestoreFromMediaScript)

---

### Examples
> Example 1

```PowerShell
PS C:\> Set-ADDBBootKey -DatabasePath 'C:\Backup\Active Directory\ntds.dit' `
                        -LogPath 'C:\Backup\Active Directory' `
                        -OldBootKey 610bc29e6f62ca7004e9872cd51a0116 `
                        -NewBootKey 6ffec6b70dc863db1906a5507c0576ee
Re-encrypts the ntds.dit file with a new boot key.
```

---

### Parameters
#### **DatabasePath**
Specifies the path to a domain database, for instance, C:\Windows\NTDS\ntds.dit.

|Type      |Required|Position|PipelineInput|Aliases                                                |
|----------|--------|--------|-------------|-------------------------------------------------------|
|`[String]`|true    |named   |False        |Database<br/>DBPath<br/>DatabaseFilePath<br/>DBFilePath|

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

#### **NewBootKey**
Specifies the new boot key (AKA system key) that will be used to re-encrypt the password encryption key (pekList) stored in the target Active Directory database.

|Type      |Required|Position|PipelineInput|Aliases                     |
|----------|--------|--------|-------------|----------------------------|
|`[Byte[]]`|false   |named   |False        |NewKey<br/>New<br/>NewSysKey|

#### **OldBootKey**
Specifies the current boot key (AKA system key) that will be used to decrypt the password encryption key (pekList) stored in the target Active Directory database.

|Type      |Required|Position|PipelineInput|Aliases                     |
|----------|--------|--------|-------------|----------------------------|
|`[Byte[]]`|true    |named   |False        |OldKey<br/>Old<br/>OldSysKey|

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
Set-ADDBBootKey -DatabasePath <String> [-Force] [-LogPath <String>] [-NewBootKey <Byte[]>] -OldBootKey <Byte[]> [<CommonParameters>]
```
