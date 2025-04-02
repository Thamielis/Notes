New-VBRAzureBlobFolder
----------------------

### Synopsis
Creates Microsoft Azure Blob folders.

---

### Description

This cmdlet creates Microsoft Azure Blob folders. Veeam Backup & Replication will use these folders to keep backup files there.
Important! The default Root container is not supported. For more information about this container, see this Microsoft article.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

* [Connect-VBRAzureBlobService](Connect-VBRAzureBlobService)

* [Get-VBRAzureBlobContainer](Get-VBRAzureBlobContainer)

---

### Examples
> Adding Microsoft Azure Blob Folder

$account = Get-VBRAzureBlobAccount -Name "Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType CapacityTier
$container = Get-VBRAzureBlobContainer -Connection $connect -Name "Container"
New-VBRAzureBlobFolder -Container $container -Connection $connect -Name "Images"
This example shows how to create a Microsoft Azure Blob folder that an Azure Blob object storage will use as a repository.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Specify the Account, RegionType and the ServiceType parameter values. Save the result to the $connect variable.
3. Run the Get-VBRAzureBlobContainer cmdlet. Specify the Connection and the Name parameter values. Save the result to the $container variable.
4. Run the New-VBRAzureBlobFolder cmdlet. Set the $container variable as the Container parameter value. Set the $connect variable as the Connection parameter value. Specify the Name parameter value.

---

### Parameters
#### **Connection**
Specifies an active session with Microsoft Azure Blob storage. The cmdlet will use this session to connect to Microsoft Azure object storage.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[IVBRAzureBlobConnection]`|true    |named   |False        |

#### **Container**
Specifies an Microsoft Azure Blob container. The cmdlet will create a folder in this container.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRAzureBlobContainer]`|true    |named   |True (ByValue)|

#### **Name**
Specifies a name of the Microsoft Azure Blob container. The cmdlet will create a new Microsoft Azure Blob folder in this container.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureBlobContainer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRAzureBlobFolder -Connection <IVBRAzureBlobConnection> -Container <VBRAzureBlobContainer> -Name <String> [<CommonParameters>]
```
