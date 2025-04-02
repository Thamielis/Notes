Get-VBRAzureBlobFolder
----------------------

### Synopsis
Returns Microsoft Azure Blob folders.

---

### Description

This cmdlet returns an array of Microsoft Azure Blob folders. You can get the array of all folders from your Microsoft Azure Blob storage or the array of the folders from the particular container.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

* [Connect-VBRAzureBlobService](Connect-VBRAzureBlobService)

* [Get-VBRAzureBlobContainer](Get-VBRAzureBlobContainer)

---

### Examples
> Example 1. Getting All Folders from Microsoft Azure Blob Storage

$account = Get-VBRAzureBlobAccount -Name "Microsoft Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType CapacityTier
$container = Get-VBRAzureBlobContainer -Connection $connect
Get-VBRAzureBlobFolder -Container $Container -Connection $connect
This example shows how to get all folders from Microsoft Azure Blob storage.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and the ServiceType parameter values. Save the result to the $connect variable.
3. Run the Get-VBRAzureBlobContainer cmdlet. Set the $connect variable as the Connection parameter value. Save the result to the $container variable.
4. Run the Get-VBRAzureBlobFolder cmdlet. Set the $container variable as the Container parameter value. Set the $connect variable as the Connection parameter value.
> Example 2. Getting All Folders from Specific Microsoft Azure Blob Container

$account = Get-VBRAzureBlobAccount -Name "Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType CapacityTier
$container = Get-VBRAzureBlobContainer -Connection $connect -Name "Container"
Get-VBRAzureBlobFolder -Container $Container -Connection $connect
This example shows how to get all folders from a specific Microsoft Azure Blob container.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and the ServiceType parameter values. Save the result to the $connect variable.
3. Run the Get-VBRAzureBlobContainer cmdlet. Set the $connect variable as the Connection parameter value. Specify the Name parameter value. Save the result to the $container variable.
4. Run the Get-VBRAzureBlobFolder cmdlet. Set the $container variable as the Container parameter value. Set the $connect variable as the Connection parameter value.
> Example 3. Getting Specific Folder from Microsoft Azure Blob Storage

$account = Get-VBRAzureBlobAccount -Name "Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType CapacityTier
$container = Get-VBRAzureBlobContainer -Connection $connect
Get-VBRAzureBlobFolder -Container $container -Connection $connect -Name "New Folder"
This example shows how to get a specific folder from Microsoft Azure Blob storage.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and the ServiceType parameter values. Save the result to the $connect variable.
3. Run the Get-VBRAzureBlobContainer cmdlet. Set the $connect variable as the Connection parameter value. Save the result to the $container variable.
4. Run the Get-VBRAzureBlobFolder cmdlet. Set the $container variable as the Container parameter value. Set the $connect variable as the Connection parameter value. Specify the Name parameter value.

---

### Parameters
#### **Connection**
Specifies an active session with Microsoft Azure Blob storage.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[IVBRAzureBlobConnection]`|true    |named   |False        |

#### **Container**
Specifies an array of Microsoft Azure Blob containers. The cmdlet will return the folders from these containers.

|Type                       |Required|Position|PipelineInput |
|---------------------------|--------|--------|--------------|
|`[VBRAzureBlobContainer[]]`|true    |named   |True (ByValue)|

#### **Name**
Specifies an array of names for Microsoft Azure Blob folders that you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureBlobContainer[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRAzureBlobFolder -Connection <IVBRAzureBlobConnection> -Container <VBRAzureBlobContainer[]> [-Name <String[]>] [<CommonParameters>]
```
