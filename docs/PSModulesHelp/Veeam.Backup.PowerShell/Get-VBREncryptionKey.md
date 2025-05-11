Get-VBREncryptionKey
--------------------

### Synopsis
Returns encryption keys.

---

### Description

This cmdlet returns encryption keys managed by Veeam Backup & Replication.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

* [Get-VBRImportedEncryptedBackup](Get-VBRImportedEncryptedBackup)

---

### Examples
> Example 1. Getting All Encryption Keys

```PowerShell
Get-VBREncryptionKey
This command looks for all encryption keys.
```
> Example 2. Getting Specific Encryption Key

```PowerShell
Get-VBREncryptionKey -Description "Veeam Administrator"
This command looks for an encryption key with description Veeam Administrator.
```

---

### Parameters
#### **Backup**
Specifies the imported backup for which you want to get the encryption key.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRImportedEncryptedBackup]`|true    |1       |True (ByPropertyName, ByValue)|

#### **Description**
Specifies the description of the encryption key you want to get.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|false   |0       |True (ByPropertyName, ByValue)|

#### **Medium**
Specifies the tape for which you want to get the encryption key.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRTapeMedium]`|true    |2       |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

Veeam.Backup.PowerShell.Infos.VBRImportedEncryptedBackup

Veeam.Backup.PowerShell.Infos.VBRTapeMedium

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBREncryptionKey [-Backup] <VBRImportedEncryptedBackup> [<CommonParameters>]
```
```PowerShell
Get-VBREncryptionKey [[-Description] <String>] [<CommonParameters>]
```
```PowerShell
Get-VBREncryptionKey [-Medium] <VBRTapeMedium> [<CommonParameters>]
```
