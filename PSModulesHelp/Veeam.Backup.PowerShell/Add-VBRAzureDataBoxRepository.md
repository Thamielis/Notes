Add-VBRAzureDataBoxRepository
-----------------------------

### Synopsis
Adds Azure Data Box storage as an object storage repository to the backup infrastructure.

---

### Description

This cmdlet adds Azure Data Box storage as an object storage repository to the backup infrastructure.
IMPORTANT! This cmdlet adds the Azure Data Box storage that can be used as a capacity extent of the scale-out backup repository.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

* [Connect-VBRAzureDataBoxService](Connect-VBRAzureDataBoxService)

* [Get-VBRAzureBlobContainer](Get-VBRAzureBlobContainer)

* [Get-VBRAzureBlobFolder](Get-VBRAzureBlobFolder)

---

### Examples
> Adding Azure Data Box Storage to Backup Infrastructure

$account = Get-VBRAzureBlobAccount -Name "Azure Blob"
$connect = Connect-VBRAzureDataBoxService -Account $account -ServicePoint "http://123.45.67.89:9000"
$container = Get-VBRAzureBlobContainer -Connection $connect
$folder = Get-VBRAzureBlobFolder -Container $container -Connection $connect
Add-VBRAzureDataBoxRepository -AzureBlobFolder $folder -Connection $connect -Name "DataBox 009"
This example shows how to add the DataBox 009 Azure Data Box storage to the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureDataBoxService cmdlet. Set the $account variable as the Account parameter value. Specify the ServicePoint parameter value. Save the result to the $connect variable.
3. Run the Get-VBRAzureBlobContainer cmdlet. Set the $connect variable as the Connection parameter value. Save the result to the $container variable.
4. Run the Get-VBRAzureBlobFolder cmdlet. Set the $container variable as the Container parameter value. Set the $connect variable as the Connection parameter value. Save the result to the $folder variable.
5. Run the Add-VBRAzureDataBoxRepository cmdlet. Specify the following settings:
- Set the $folder variable as the AzureBlobFolder parameter value.
- Set the $connect variable as the Connection parameter value.
- Specify the Name parameter value.

---

### Parameters
#### **AzureBlobFolder**
Specifies an Azure Data Box folder. The cmdlet will move the backup files to the specified folder.

|Type                  |Required|Position|PipelineInput |
|----------------------|--------|--------|--------------|
|`[VBRAzureBlobFolder]`|true    |named   |True (ByValue)|

#### **Connection**
Specifies an active session with Azure Data Box storage that you want to add as the backup repository.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRAzureDataBoxConnection]`|true    |named   |False        |

#### **Description**
Specifies a description of Azure Data Box storage. The cmdlet will add Azure Data Box storage to Veeam Backup & Replication with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableConcurrentTasksLimit**
Enables limits for concurrent tasks that can be processed by the object storage repository.
Use the MaxConcurrentTasks paramter to specify the number of tasks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add an object storage repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MaxConcurrentTasks**
Specifies a maximum number of concurrent tasks that can be processed at once by the object storage repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Name**
Specifies a name of Azure Data Box storage. The cmdlet will add Azure Data Box storage to Veeam Backup & Replication with this name.

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
Add-VBRAzureDataBoxRepository -AzureBlobFolder <VBRAzureBlobFolder> -Connection <VBRAzureDataBoxConnection> [-Description <String>] [-EnableConcurrentTasksLimit] [-Force] [-MaxConcurrentTasks <Int32>] [-Name 
```
```PowerShell
<String>] [<CommonParameters>]
```
