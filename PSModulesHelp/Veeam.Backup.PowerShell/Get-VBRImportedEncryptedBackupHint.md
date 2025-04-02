Get-VBRImportedEncryptedBackupHint
----------------------------------

### Synopsis
Returns password hints for imported encrypted backups.

---

### Description

This cmdlet returns password hints for a selected imported encrypted backup.

---

### Related Links
* [Get-VBRImportedEncryptedBackup](Get-VBRImportedEncryptedBackup)

---

### Examples
> Getting Password Hints for Imported Encrypted Backup

$encryptedbackup = Get-VBRImportedEncryptedBackup -Name "Atlanta SQL Server Backup"
Get-VBRImportedEncryptedBackupHint -Backup $encryptedbackup
The example shows how to get the password hints for an imported encrypted backup.
Perform the following steps:
1. Run the Get-VBRImportedEncryptedBackup cmdlet. Specify the Name parameter value. Save the result to the $encryptedbackup variable.
2. Run the Get-VBRImportedEncryptedBackupHint cmdlet. Set the $encryptedbackup variable as the Backup parameter value.

---

### Parameters
#### **Backup**
Specifies the imported encrypted backup. The cmdlet will return hints for this backup.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRImportedEncryptedBackup]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRImportedEncryptedBackup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRImportedEncryptedBackupHint -Backup <VBRImportedEncryptedBackup> [<CommonParameters>]
```
