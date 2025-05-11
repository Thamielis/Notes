Set-VBREncryptedBackupPassword
------------------------------

### Synopsis
Decrypts imported encrypted backups.

---

### Description

This cmdlet decrypts a selected imported encrypted backup. After you decrypt an imported encrypted backup, you can use such backups for restore. The decrypted backups will be available in the array of backups returned by the Get-VBRBackup cmdlet.
To decrypt an imported encrypted backup, you will need to specify the password or passwords you used to encrypt the backups. If you changed the password one or several times while the backup chain was created, you must enter passwords in the following manner:
- If you decrypt a VBM file, you must specify the latest password that was used to encrypt files in the backup chain.
- If you decrypt a VBK file, you must specify the whole set of passwords that were used to encrypt files in the backup chain.
- [For a new Veeam Backup & Replication installation] When you run separate catalog jobs for tapes encrypted with the KMS solution and tapes encrypted with password-based keys.
You can use hints to recall the passwords you used to encrypt the backups. Run the Get-VBRImportedEncryptedBackupHint cmdlet to get the hints for the needed backup.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRImportedEncryptedBackup](Get-VBRImportedEncryptedBackup)

* [Get-VBRImportedEncryptedBackupHint](Get-VBRImportedEncryptedBackupHint)

---

### Examples
> Decrypting Imported Encrypted Backup

$encryptedbackup = Get-VBRImportedEncryptedBackup -Name "Atlanta SQL Server Backup"
Get-VBRImportedEncryptedBackupHint -Backup $encryptedbackup
Set-VBREncryptedBackupPassword -Backup $encryptedbackup -Password "123", "345"
The example shows how to decrypt an imported encrypted backup.
Perform the following steps:
1. Run the Get-VBRImportedEncryptedBackup cmdlet. Specify the Name parameter value. Save the result to the $encryptedbackup variable.
2. Run the Get-VBRImportedEncryptedBackupHint cmdlet. Set the $encryptedbackup variable as the Backup parameter value.
3. Run the Set-VBREncryptedBackupPassword cmdlet. Set the $encryptedbackup variable as the Backup parameter value. Specify the Password parameter value.

---

### Parameters
#### **Backup**
Specifies the imported encrypted backup you want to decrypt.

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[VBRImportedEncryptedBackup]`|true    |named   |True (ByValue)|

#### **DecryptionSet**
Specifies the data decryption settings if the KMS Server was used for encryption.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRDecryptionSet[]]`|true    |named   |False        |

#### **Password**
Specifies the password required for decrypting the backup.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

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
Set-VBREncryptedBackupPassword -Backup <VBRImportedEncryptedBackup> -DecryptionSet <VBRDecryptionSet[]> [<CommonParameters>]
```
```PowerShell
Set-VBREncryptedBackupPassword -Backup <VBRImportedEncryptedBackup> -Password <String[]> [<CommonParameters>]
```
