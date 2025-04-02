Set-VBREncryptedTapeMediumPassword
----------------------------------

### Synopsis
Decrypts encrypted backups stored on tapes.

---

### Description

This cmdlet decrypts selected encrypted backups stored on tapes.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

* [New-VBRDecryptionSet](New-VBRDecryptionSet)

---

### Examples
> Example - Decrypting Encrypted Backups on Tapes

$tape = Get-VBRTapeMedium -Name "00110001"
Set-VBREncryptedTapeMediumPassword -Medium $tape -Password "SecurePassword"
This example shows how to decrypt encrypted backups stored on tapes.

Perform the following steps:
1. Run Get-VBRTapeMedium to get the tape. Save the result to the $tape variable.
2. Run Set-VBREncryptedTapeMediumPassword with the $tape variable. Use the password parameter to specify the password.

---

### Parameters
#### **DecryptionSet**
Specifies the data decryption settings.
Accepts the VBRDecryptionSet[] object. To get this object, run the New-VBRDecryptionSet cmdlet.

|Type                  |Required|Position|PipelineInput        |
|----------------------|--------|--------|---------------------|
|`[VBRDecryptionSet[]]`|true    |named   |True (ByPropertyName)|

#### **Medium**
Specifies the tape that contains the encrypted backup that you want to decrypt. Accepts the VBRTapeMedium[] object.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeMedium[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**
Specifies the password. Veeam Backup & Replication will use that password to decrypt the backups.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeMedium[]

System.String[]

Veeam.Backup.PowerShell.Infos.VBRDecryptionSet[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBREncryptedTapeMediumPassword -DecryptionSet <VBRDecryptionSet[]> -Medium <VBRTapeMedium[]> [-PassThru] [<CommonParameters>]
```
```PowerShell
Set-VBREncryptedTapeMediumPassword -Medium <VBRTapeMedium[]> [-PassThru] -Password <String[]> [<CommonParameters>]
```
