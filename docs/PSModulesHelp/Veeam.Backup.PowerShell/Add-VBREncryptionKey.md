Add-VBREncryptionKey
--------------------

### Synopsis
Creates encryption key.

---

### Description

This cmdlet creates a new encryption key.
This cmdlet accepts SecureString type. Use Microsoft PowerShell standard capabilities to convert your password into the SecureString.

---

### Examples
> Creating Encryption Key

$plainpassword = "VeeamPassword"
$securepassword = $plainpassword | ConvertTo-SecureString -AsPlainText -Force
Add-VBREncryptionKey -Password $securepassword -Description "Veeam Administrator"
This command creates the Veeam Administrator encryption key.
Perform the following steps:
1. Save the password into the $plainpassword variable.
2. Turn the password into a SecureString by running the ConvertTo-SecureString command. Provide the AsPlainText and Force parameters.
3. Run the Add-VBREncryptionKey cmdlet. Set the $securepassword variable as the Password parameter value. Specify the Description parameter value.

---

### Parameters
#### **Description**
Specifies description of the new encryption key that you can further use to search encryption keys.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |False        |

#### **Password**
Specifies password you want to use to encrypt data.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[SecureString]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
System.Security.SecureString

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBREncryptionKey [-Password] <SecureString> [[-Description] <String>] [<CommonParameters>]
```
