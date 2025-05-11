Remove-VBREncryptionKey
-----------------------

### Synopsis
Removes encryption key.

---

### Description

This cmdlet removes a selected encryption key.
IMPORTANT!
You cannot remove an encryption key if it is used by any job or set in permissions for repository for Veeam Agent for Microsoft Windows jobs.

---

### Related Links
* [Get-VBREncryptionKey](Get-VBREncryptionKey)

---

### Examples
> Example 1. Removing Encryption Key [Using Pipeline]

Get-VBREncryptionKey -Description "Veeam Administrator" | Remove-VBREncryptionKey
This example shows how to remove the Veeam Administrator encryption key.
Perform the following steps:
1. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value.
2. Pipe the cmdlet output to the Remove-VBREncryptionKey cmdlet.
> Example 2. Removing Encryption Key [Using Variable]

$administratorkey = Get-VBREncryptionKey -Description "Veeam Administrator"
Remove-VBREncryptionKey -EncryptionKey $administratorkey
This example shows how to remove the Veeam Administrator encryption key.
Perform the following steps:
1. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value. Save the result to the $administratorkey variable.
2. Pipe the cmdlet output to the Remove-VBREncryptionKey cmdlet. Set the $administratorkey variable as the EncryptionKey parameter value.

---

### Parameters
#### **EncryptionKey**
Specifies the encryption key you  want to remove.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[PSCryptoKey]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.PowerShell.Infos.PSCryptoKey

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBREncryptionKey [-EncryptionKey] <PSCryptoKey> [-Confirm] [-WhatIf] [<CommonParameters>]
```
