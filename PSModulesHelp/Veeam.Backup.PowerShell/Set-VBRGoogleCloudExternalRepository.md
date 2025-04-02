Set-VBRGoogleCloudExternalRepository
------------------------------------

### Synopsis
Modifies external Google Cloud storage repository.

---

### Description

This cmdllet modifies external Google Cloud storage repository added to the backup infrastructure.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRExternalRepository](Get-VBRExternalRepository)

* [Add-VBREncryptionKey](Add-VBREncryptionKey)

---

### Examples
> Modifying Decryption Password of External Google Cloud Storage

$repository = Get-VBRExternalRepository -Name "Google_Repository"
$securepassword = Read-Host -Prompt "Enter password" -AsSecureString
$key = Add-VBREncryptionKey -Password $securepassword
Set-VBRGoogleCloudExternalRepository -ExternalRepository $repository -DecryptBackups -DecryptionKey $key
This example shows how to modify the decryption password for the Google_Repository external Google Cloud storage.
Perform the following steps:
1. Run the Get-VBRExternalRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Read-Host cmdlet. Specify the message that the console will display as a prompt. Provide the AsSecureString parameter. Save the result to the $securepassword variable.
3. Run the Add-VBREncryptionKey cmdlet. Set the $securepassword variable as the Password parameter value. Save the result to the $key variable.
4. Run the Set-VBRGoogleCloudExternalRepository cmdlet. Specify the following settings:
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

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **Description**
Specifies the description of the Google Cloud storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ExternalRepository**
Specifies an external Google Cloud storage repository that you want to modify.

|Type                                |Required|Position|PipelineInput |
|------------------------------------|--------|--------|--------------|
|`[VBRGoogleCloudExternalRepository]`|true    |named   |True (ByValue)|

#### **GatewayServer**
Specifies a gateway server. Veeam Backup & Replication will use this server to access a Google Cloud bucket.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Name**
Specifies the name of the Google Cloud storage repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRGoogleCloudExternalRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRGoogleCloudExternalRepository [-DecryptBackups] [-DecryptionKey <VBREncryptionKey>] [-Description <String>] -ExternalRepository <VBRGoogleCloudExternalRepository> [-GatewayServer <CHost>] [-Name 
```
```PowerShell
<String>] [<CommonParameters>]
```
