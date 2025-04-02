Set-VBRAmazonS3ExternalRepository
---------------------------------

### Synopsis
Modifies external Amazon S3 storage repository.

---

### Description

This cmdlet modifies external Amazon S3 storage repository added to the backup infrastructure.
Note: This cmdlet requires the PSCredential object. Use the Get-Credential cmdlet to get the PSCredentials object.

---

### Related Links
* [Get-VBRExternalRepository](Get-VBRExternalRepository)

* [Add-VBREncryptionKey](Add-VBREncryptionKey)

---

### Examples
> Modifying Decryption Password of External Amazon S3 Storage Repository

$repository = Get-VBRExternalRepository -Name "External Repository"
$securepassword = Read-Host -Prompt "Enter password" -AsSecureString
$key = Add-VBREncryptionKey -Password $securepassword
Set-VBRAmazonS3ExternalRepository -ExternalRepository $repository -DecryptBackups -DecryptionKey $key
This example shows how to modify the decryption password for external Amazon S3 storage repository.
Perform the following steps:
1. Run the Get-VBRExternalRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Read-Host cmdlet. Specify the message that the console will display as a prompt. Provide the AsSecureString parameter. Save the result to the $securepassword variable.
3. Run the Add-VBREncryptionKey cmdlet. Set the $securepassword variable as the Password parameter value. Save the result to the $key variable.
4. Run the Set-VBRAmazonS3ExternalRepository cmdlet. Specify the following settings:
- Set the $repository variable as the ExternalRepository parameter value.
- Provide the DecryptBackups parameter.
- Set the $key variable as the DecryptionKey parameter value.

---

### Parameters
#### **DecryptBackups**
Defines that Veeam Backup & Replication will decrypt encrypted backups.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DecryptionKey**
Specifies the password that Veeam Backup & Replication will use to decrypt the backup files.
Default: False.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **Description**
Specifies a description of external Amazon S3 storage repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ExternalRepository**
Specifies external Amazon S3 repository that you want to modify.

|Type                             |Required|Position|PipelineInput |
|---------------------------------|--------|--------|--------------|
|`[VBRAmazonS3ExternalRepository]`|true    |named   |True (ByValue)|

#### **GatewayServer**
Specifies a gateway server. Veeam Backup & Replication will use this server to access an Amazon S3 bucket.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Name**
Specifies a name of external Amazon S3 storage repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonS3ExternalRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAmazonS3ExternalRepository [-DecryptBackups] [-DecryptionKey <VBREncryptionKey>] [-Description <String>] -ExternalRepository <VBRAmazonS3ExternalRepository> [-GatewayServer <CHost>] [-Name <String>] 
```
```PowerShell
[<CommonParameters>]
```
