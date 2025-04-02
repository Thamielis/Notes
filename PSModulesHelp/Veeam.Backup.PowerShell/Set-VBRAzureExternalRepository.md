Set-VBRAzureExternalRepository
------------------------------

### Synopsis
Modifies external Microsoft Azure Blob storage repository.

---

### Description

This cmdlet modifies external Microsoft Azure Blob storage repository added to the backup infrastructure.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRExternalRepository](Get-VBRExternalRepository)

* [Add-VBREncryptionKey](Add-VBREncryptionKey)

---

### Examples
> Modifying Decryption Password of External Azure Blob Storage Repository

$repository = Get-VBRExternalRepository -Name "Microsoft Azure Repository"
$securepassword = Read-Host -Prompt "Enter password" -AsSecureString
$key = Add-VBREncryptionKey -Password $securepassword
Set-VBRAzureExternalRepository -ExternalRepository $repository -DecryptBackups -DecryptionKey $key
This example shows how to modify the decryption password of Microsoft Azure Blob storage repository named Microsoft Azure Repository.
Perform the following steps:
1. Run the Get-VBRExternalRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Specify the password to decrypt backup files:
- Run the Read-Host cmdlet. Specify the Prompt parameter value. Provide the AsSecureString parameter. Save the result to the $securepassword variable.
- Run the Add-VBREncryptionKey cmdlet. Set the $securepassword variable as the Password parameter value. Save the result to the $key variable.
3. Run the Set-VBRAzureExternalRepository cmdlet. Specify the following settings:
- Set the $repository variable as the ExternalRepository parameter value.
- Provide the DecryptBackups parameter.
- Set the $key variable as the DecryptionKey parameter value.

---

### Parameters
#### **AzureSubscription**
Specifies subscriptions associated with a Microsoft Azure account.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRAzureSubscription]`|false   |named   |False        |

#### **DecryptBackups**
Defines that Veeam Backup & Replication will decrypt encrypted backups.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DecryptionKey**
Specifies the password that Veeam Backup & Replication will use to decrypt the backup files.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **Description**
Specifies the description of Microsoft Azure Blob storage repository that you want to add as an external repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ExternalRepository**
Specifies Microsoft Azure Blob storage repository added as an external repository. The cmdlet will modify this repository.

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[VBRAzureExternalRepository]`|true    |named   |True (ByValue)|

#### **GatewayServer**
Specifies a gateway server. Veeam Backup & Replication will use this server to access Microsoft Azure Blob storage repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Name**
Specifies a name of Microsoft Azure Blob storage repository that you want to add as an external repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureExternalRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAzureExternalRepository [-AzureSubscription <VBRAzureSubscription>] [-DecryptBackups] [-DecryptionKey <VBREncryptionKey>] [-Description <String>] -ExternalRepository <VBRAzureExternalRepository> 
```
```PowerShell
[-GatewayServer <CHost>] [-Name <String>] [<CommonParameters>]
```
