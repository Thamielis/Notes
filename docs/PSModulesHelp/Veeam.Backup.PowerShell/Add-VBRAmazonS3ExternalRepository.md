Add-VBRAmazonS3ExternalRepository
---------------------------------

### Synopsis
Adds external Amazon S3 storage repository to the backup infrastructure.

---

### Description

This cmdlet adds external Amazon S3 object storage repository to the backup infrastructure.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Connect-VBRAmazonS3Service](Connect-VBRAmazonS3Service)

* [Get-VBRAmazonS3Bucket](Get-VBRAmazonS3Bucket)

* [Get-VBRAmazonS3Folder](Get-VBRAmazonS3Folder)

* [Add-VBREncryptionKey](Add-VBREncryptionKey)

---

### Examples
> Example 1. Adding Amazon S3 External Repository

$account = Get-VBRAmazonAccount
$connect = Connect-VBRAmazonS3Service -Account $account[1] -RegionType Global -ServiceType ExternalRepository
$bucket = Get-VBRAmazonS3Bucket -Connection $connect -Name "veeam-tw"
$folder = Get-VBRAmazonS3Folder -Name "frozenbucket" -Bucket $bucket -Connection $connect
Add-VBRAmazonS3ExternalRepository -Name "New Repository" -AmazonS3Folder $folder -Connection $connect
This example shows how to add the Amazon S3 object storage repository named New Repository as an external repository into the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connect variable.
3. Run the Get-VBRAmazonS3Bucket cmdlet. Set the $connect variable as the Connection parameter value. Specify the Name parameter value. Save the result to the $bucket variable.
4. Run the Get-VBRAmazonS3Folder cmdlet. Specify the Name parameter value. Set the $bucket variable as the Bucket parameter value. Set the $connect variable as the Connection parameter value. Save the result to the $folder variable.
5. Run the Add-VBRAmazonS3Repository cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $folder variable as the AmazonS3Folder parameter
- Set the $connect variable as the Connection parameter value.
> Example 2. Adding Amazon S3 External Repository and Decrypting the Imported Backup Files

$account = Get-VBRAmazonAccount
$connect = Connect-VBRAmazonS3Service -Account $account[1] -RegionType Global -ServiceType ExternalRepository
$bucket = Get-VBRAmazonS3Bucket -Connection $connect -Name "veeam-tw"
$folder = Get-VBRAmazonS3Folder -Name "frozenbucket" -Bucket $bucket -Connection $connect
$securepassword = Read-Host -Prompt "Enter password" -AsSecureString
$key = Add-VBREncryptionKey -Password $securepassword
Add-VBRAmazonS3ExternalRepository -Name "New Repository" -AmazonS3Foslder $folder -Connection $connect -DecryptBackups -DecryptionKey $key
This example shows how to add Amazon S3 object storage repository named New Repository as an external repository into the backup infrastructure. Veeam Backup & Replication will decrypt backup files that are imported from the external repository.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Specify the Account, RegionType and ServiceType parameter values. Save the result to the $connect variable.
3. Run the Get-VBRAmazonS3Bucket cmdlet. Set the $connect variable as the Connection parameter value. Specify the Name parameter value. Save the result to the $bucket variable.
4. Run the Get-VBRAmazonS3Folder cmdlet. Specify the Name parameter value. Set the $bucket variable as the Bucket parameter value. Set the $connect variable as the Connection parameter value. Save the result to the $folder variable.
5. Run the Read-Host cmdlet. cmdlet. Specify the message that the console will display as a prompt. Specify the AsSecureString parameter. Save the result to the $securepassword variable.
6. Run the Add-VBREncryptionKey cmdlet. Specify the Password parameter. Save the result to the $key variable.
7. Run the Add-VBRAmazonS3Repository cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $folder variable as the AmazonS3Folder parameter value.
- Set the $connect variable as the Connection parameter value.
- Provide the DecryptBackups parameter.
- Set the $key variable as the DecryptionKey parameter value.

---

### Parameters
#### **AmazonS3Folder**
Specifies a name of a folder in the Amazon S3 bucket where EC2 instance backups reside.

|Type                 |Required|Position|PipelineInput |
|---------------------|--------|--------|--------------|
|`[VBRAmazonS3Folder]`|true    |named   |True (ByValue)|

#### **Connection**
Specifies an active session with the Amazon S3 storage repository that you want to add as an external repository.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRAmazonS3ExternalConnection]`|true    |named   |False        |

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
Specifies a description of the Amazon S3 storage repository that you want to add as an external repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add an external repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a name of the Amazon S3 storage repository that you want to add as an external repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonS3Folder

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRAmazonS3ExternalRepository -AmazonS3Folder <VBRAmazonS3Folder> -Connection <VBRAmazonS3ExternalConnection> [-DecryptBackups] [-DecryptionKey <VBREncryptionKey>] [-Description <String>] [-Force] [-Name 
```
```PowerShell
<String>] [<CommonParameters>]
```
