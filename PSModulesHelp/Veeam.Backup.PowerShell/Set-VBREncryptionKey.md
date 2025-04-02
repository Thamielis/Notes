Set-VBREncryptionKey
--------------------

### Synopsis
Modifies encryption key.

---

### Description

This cmdlet modifies encryption key that was created before.
This cmdlet accepts SecureString type. Use Microsoft PowerShell standard capabilities to convert your password into the SecureString.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBREncryptionKey](Get-VBREncryptionKey)

---

### Examples
> Example 1. Modifying Description of Encryption Key

Get-VBREncryptionKey -Description "Veeam Administrator" | Set-VBREncryptionKey -Description "Veeam Tape Backup Administrator"
This command modifies description of the Veeam Administrator encryption key.
Perform the following steps:
1. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value.
2. Pipe the cmdlet output to the Set-VBREncryptionKey cmdlet. Specify the Description parameter.
> Example 2. Setting New Password to Encryption Key

$plainpassword = "VeeamPassword"
$securepassword = $plainpassword | ConvertTo-SecureString -AsPlainText -Force
Get-VBREncryptionKey -Description "Veeam Administrator" | Set-VBREncryptionKey -Password $securepassword
This command sets a new password to the Veeam Administrator encryption key.
Perform the following steps:
1. Save the password as the $plainpassword variable.
2. Run the ConvertTo-SecureString cmdlet. Provide the AsPlainText and Force parameters. Save it to the $securepassword variable.
3. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value.
4. Pipe the cmdlet output to the Set-VBREncryptionKey cmdlet. Set the Password parameter as the Password parameter value.

---

### Parameters
#### **Description**
Specifies the new description you want to apply to the encryption key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EncryptionKey**
Specifies the encryption key you want to modify.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[PSCryptoKey]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Password**
Specifies the new password you want to apply to the encryption key.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |named   |False        |

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
Set-VBREncryptionKey [-EncryptionKey] <PSCryptoKey> [-Description <String>] [-Password <SecureString>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
