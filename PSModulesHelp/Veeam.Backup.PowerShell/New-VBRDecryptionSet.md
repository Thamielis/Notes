New-VBRDecryptionSet
--------------------

### Synopsis
Defines data decryption settings.
NOTE: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet creates the VBRDecryptionSet object. This object defines the data decryption settings.

---

### Related Links
* [Get-VBREncryptionKey](Get-VBREncryptionKey)

* [Get-VBRKMSServer](Get-VBRKMSServer)

---

### Examples
> Example 1. Defining Decryption Settings for Data Encrypted by KMS

$key = Get-VBREncryptionKey -Description "Veeam KMS"
$kmsserver = Get-VBRKMSServer -Name "thales.tech.local"
$decryption = New-VBRDecryptionSet -EncryptionKey $key -KMSServer $kmsserver -KmsKeyId "c302ebfd-821c-4372-bf46-beccca0516ec-pub"
This example shows how to define settings to decrypt data encrypted by KMS server.
Perform the following steps:
1. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value. Save the result to the $key variable.
2. Run the Get-VBRKMSServer cmdlet. Specify the Name parameter value. Save the result to the $kmsserver variable.
3. Run the New-VBRDecryptionSet cmdlet. Set the $key variable as the EncryptionKey parameter value. Set the $kmsserver variable as the KMSServer parameter value. Specify the KmsKeyId parameter value. Save the result to the $decryption variable.
> Example 2. Defining Data Decryption Settings with Password

$key = Get-VBREncryptionKey -Description "Veeam KMS"
$decryption = New-VBRDecryptionSet -EncryptionKey $key -Password "VeeamPassword"
This example shows how to define settings to decrypt data using password.
Perform the following steps:
1. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value. Save the result to the $key variable.
2. Run the New-VBRDecryptionSet cmdlet. Set the $key variable as the EncryptionKey parameter value. Specify the Password parameter value. Save the result to the $decryption variable.

---

### Parameters
#### **EncryptionKey**
Specifies encryption keys managed by Veeam Backup & Replication.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[PSCryptoKey]`|true    |named   |True (ByPropertyName, ByValue)|

#### **KmsKeyId**
Specifies the ID of the private key stored on the KMS server. The cmdlet will use it to decrypt data.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|false   |named   |True (ByPropertyName, ByValue)|

#### **KMSServer**
Specifies KMS servers added to theVeeam Backup & Replication console. The cmdlet will decrypt data encrypted by this server.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRKMSServer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Password**
Specifies a password. The cmdlet will use the password to decrypt data.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.PSCryptoKey

System.String

Veeam.Backup.PowerShell.Infos.VBRKMSServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRDecryptionSet -EncryptionKey <PSCryptoKey> [-KmsKeyId <String>] -KMSServer <VBRKMSServer> [<CommonParameters>]
```
```PowerShell
New-VBRDecryptionSet -EncryptionKey <PSCryptoKey> -Password <String> [<CommonParameters>]
```
