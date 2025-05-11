Get-VBRAzureBlobContainer
-------------------------

### Synopsis
Returns Microsoft Azure Blob containers.

---

### Description

This cmdlet returns an array of Microsoft Azure Blob containers.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

* [Connect-VBRAzureBlobService](Connect-VBRAzureBlobService)

---

### Examples
> Getting All Microsoft Azure Blob Containers

$account = Get-VBRAzureBlobAccount -Name "Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global  -ServiceType ExternalRepository
Get-VBRAzureBlobContainer -Connection $connect
This example shows how to get all containers added to Microsoft Azure Blob storage. The cmdlet will return an array of containers added to the Global region type.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Specify the Account, RegionType and the ServiceType parameter values. Save the result to the $connect variable.
3. Run the Get-VBRAzureBlobContainer cmdlet. Set the $connect variable as the Connection parameter value.

---

### Parameters
#### **Connection**
Specifies an active session with Microsoft Azure Blob storage. The cmdlet will return an array of the containers added to this object storage.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[IVBRAzureBlobConnection]`|true    |named   |False        |

#### **Name**
Specifies an array of names of the Microsoft Azure Blob container that you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRAzureBlobContainer -Connection <IVBRAzureBlobConnection> [-Name <String[]>] [<CommonParameters>]
```
