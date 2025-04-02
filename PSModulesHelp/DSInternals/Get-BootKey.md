Get-BootKey
-----------

### Synopsis
Reads the Boot Key (AKA SysKey or System Key) from an online or offline SYSTEM registry hive.

---

### Description

The BootKey/SysKey is an encryption key that is stored in the Windows SYSTEM registry hive. This key is used by several Windows components to encrypt sensitive information like the AD database, machine account password or system certificates etc.

The Boot Key is returned in hexadecimal format.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Get-BootKey.md)

* [Get-ADDBAccount](Get-ADDBAccount)

* [Get-ADDBBackupKey](Get-ADDBBackupKey)

* [Set-ADDBAccountPassword](Set-ADDBAccountPassword)

* [Set-ADDBAccountPasswordHash](Set-ADDBAccountPasswordHash)

* [Set-ADDBBootKey](Set-ADDBBootKey)

---

### Examples
> Example 1

```PowerShell
PS C:\> Get-BootKey -Online
0be7a2afe1713642182e9b96f73a75da
Retrieves the BootKey from the currently running OS.
```
> Example 2

```PowerShell
PS C:\> reg.exe SAVE HKLM\SYSTEM C:\RegBackup\SYSTEM.hiv
PS C:\> $key = Get-BootKey -SystemHiveFilePath C:\RegBackup\SYSTEM.hiv
Creates a backup of the SYSTEM registry hive and then retrieves the BootKey from this backup.
```

---

### Parameters
#### **Online**
Specifies that the action is to be taken on the operating system that is currently running on the local computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **SystemHiveFilePath**
Path to an offline SYSTEM registry hive.

|Type      |Required|Position|PipelineInput|Aliases                                          |
|----------|--------|--------|-------------|-------------------------------------------------|
|`[String]`|true    |0       |False        |Path<br/>FilePath<br/>SystemHivePath<br/>HivePath|

---

### Inputs
None

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
Get-BootKey -Online [<CommonParameters>]
```
```PowerShell
Get-BootKey [-SystemHiveFilePath] <String> [<CommonParameters>]
```
