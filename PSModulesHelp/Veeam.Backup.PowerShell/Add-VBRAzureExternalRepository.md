Add-VBRAzureExternalRepository
------------------------------

### Synopsis
Adds external Microsoft Azure Blob storage repository to the backup infrastructure.

---

### Description

This cmdlet adds external Microsoft Azure Blob storage repository to the backup infrastructure.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

* [Connect-VBRAzureBlobService](Connect-VBRAzureBlobService)

* [Get-VBRAzureBlobContainer](Get-VBRAzureBlobContainer)

* [Get-VBRAzureBlobFolder](Get-VBRAzureBlobFolder)

---

### Examples
> Adding Microsoft Azure Blob Storage as External Repository

$account = Get-VBRAzureBlobAccount
$connection = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType ExternalRepository
$container = Get-VBRAzureBlobContainer -Connection $connection -Name "Azure External Repository"
$folder = Get-VBRAzureBlobFolder -Container $container -Connection $connection
Add-VBRAzureExternalRepository -Name "AzureExternalRepo" -Description "New external repository" -AzureBlobFolder $folder -Connection $connection
This example shows how to add the Microsoft Azure Blob storage as an external repository to the backup infrastructure.
Perform the following steps:
1. Get the Azure Blob folder:
a. Run the Get-VBRAzureBlobAccount cmdlet. Save the result to the $account variable.
b. Run the Connect-VBRAzureBlobService cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connection variable.
c. Run the Get-VBRAzureBlobContainer cmdlet. Set the $connection variable as the Connection parameter value. Specify the Name parameter value. Save the result to the $container variable.
d. Run the Get-VBRAzureBlobFolder cmdlet. Set the $container variable as the Container parameter value. Set the $connection variable as the Connection parameter value. Save the result to the $folder variable.
2. Run the Add-VBRAzureExternalRepository cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Specify the Description parameter value.
- Set the $folder variable as the AzureBlobFolder parameter value.
- Set the $connection variable as the Connection parameter value.

---

### Parameters
#### **AzureBlobFolder**
Specifies a name of an Azure Blob storage container where Azure VMs backups reside.

|Type                  |Required|Position|PipelineInput |
|----------------------|--------|--------|--------------|
|`[VBRAzureBlobFolder]`|true    |named   |True (ByValue)|

#### **AzureSubscription**
Specifies subscriptions associated with a Microsoft Azure account.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRAzureSubscription]`|false   |named   |False        |

#### **Connection**
Specifies an active session with Microsoft Azure Blob storage that you want to add as an external repository.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRAzureBlobConnection]`|true    |named   |False        |

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
Specifies a description of Microsoft Azure Blob storage that you want to add as an external repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add an external repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a name of Microsoft Azure Blob storage that you want to add as an external repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureBlobFolder

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRAzureExternalRepository -AzureBlobFolder <VBRAzureBlobFolder> [-AzureSubscription <VBRAzureSubscription>] -Connection <VBRAzureBlobConnection> [-DecryptBackups] [-DecryptionKey <VBREncryptionKey>] 
```
```PowerShell
[-Description <String>] [-Force] [-Name <String>] [<CommonParameters>]
```
