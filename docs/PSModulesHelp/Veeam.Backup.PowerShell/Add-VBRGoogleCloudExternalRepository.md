Add-VBRGoogleCloudExternalRepository
------------------------------------

### Synopsis
Adds external Google Cloud storage repository to the backup infrastructure.

---

### Description

This cmdlet adds external Google Cloud storage repository to the backup infrastructure.

---

### Related Links
* [Get-VBRGoogleCloudAccount](Get-VBRGoogleCloudAccount)

* [Connect-VBRGoogleCloudService](Connect-VBRGoogleCloudService)

* [Get-VBRGoogleCloudBucket](Get-VBRGoogleCloudBucket)

* [Get-VBRGoogleCloudFolder](Get-VBRGoogleCloudFolder)

---

### Examples
> Adding External Google Cloud Storage

$account = Get-VBRGoogleCloudAccount -AccessKey "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$connection = Connect-VBRGoogleCloudService -Account $account
$bucket = Get-VBRGoogleCloudBucket -Connection $connection -Region $region
$folder = Get-VBRGoogleCloudFolder -Connection $connection -Bucket $bucket
Add-VBRGoogleCloudExternalRepository -GoogleCloudFolder $folder -Connection $connection -Name "Google_Repository"
This example shows how to add the Google_Repository Google Cloud storage as an external repository to the backup infrastructure.
Perform the following steps:
1. Get the Google Cloud folder:
a. Run the Get-VBRGoogleCloudAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $account variable.
b. Run the Connect-VBRGoogleCloudService cmdlet. Set the $account variable as the Account parameter value. Save the result to the $connection variable.
c. Run the Get-VBRGoogleCloudBucket cmdlet. Set the $connection variable as the Connection parameter value. Set the $region variable as the Region parameter value. Save the result to the $bucket variable.
d. Run the Get-VBRGoogleCloudFolder cmdlet. Set the $connection variable as the Connection parameter value. Set the $bucket variable as the Bucket parameter value. Save the result to the $folder variable.
2. Run the Add-VBRGoogleCloudExternalRepository cmdlet. Set the $folder variable as the GoogleCloudFolder parameter value. Set the $connection variable as the Connection parameter value. Specify the Name parameter value.

---

### Parameters
#### **Connection**
Specifies the active session with the Google Cloud storage that you want to add as an external repository.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudExternalConnection]`|true    |named   |False        |

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
Specifies the description of the Google Cloud storage that you want to add as an external repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add an external repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GoogleCloudFolder**
Specifies a name of a folder in the external repository. Veeam Backup & Replication will import backups from this folder into the backup infrastructure.

|Type                    |Required|Position|PipelineInput |
|------------------------|--------|--------|--------------|
|`[VBRGoogleCloudFolder]`|true    |named   |True (ByValue)|

#### **Name**
Specifies the name of the Google Cloud storage that you want to add as an external repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRGoogleCloudFolder

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRGoogleCloudExternalRepository -Connection <VBRGoogleCloudExternalConnection> [-DecryptBackups] [-DecryptionKey <VBREncryptionKey>] [-Description <String>] [-Force] -GoogleCloudFolder 
```
```PowerShell
<VBRGoogleCloudFolder> [-Name <String>] [<CommonParameters>]
```
