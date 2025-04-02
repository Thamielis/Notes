Add-VBRAzureArchiveRepository
-----------------------------

### Synopsis
Adds Azure Archive repository to the backup infrastructure.

---

### Description

This cmdlet adds Azure Archive repository to the backup infrastructure.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

* [Connect-VBRAzureBlobService](Connect-VBRAzureBlobService)

* [Get-VBRAzureBlobContainer](Get-VBRAzureBlobContainer)

* [Get-VBRAzureBlobFolder](Get-VBRAzureBlobFolder)

* [Get-VBRAzureAccount](Get-VBRAzureAccount)

* [Get-VBRAzureSubscription](Get-VBRAzureSubscription)

* [Get-VBRAzureLocation](Get-VBRAzureLocation)

* [Get-VBRAzureVMSize](Get-VBRAzureVMSize)

* [Get-VBRAzureVirtualNetwork](Get-VBRAzureVirtualNetwork)

* [Get-VBRAzureVirtualNetworkSubnet](Get-VBRAzureVirtualNetworkSubnet)

* [Get-VBRAzureResourceGroup](Get-VBRAzureResourceGroup)

* [New-VBRAzureComputeProxyAppliance](New-VBRAzureComputeProxyAppliance)

---

### Examples
> Adding Azure Archive Repository

$account = Get-VBRAzureBlobAccount -Name "Azure_Blob"
$connection = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType ArchiveTier
$container =Get-VBRAzureBlobContainer -Connection $connection -Name "container01"
$folder = Get-VBRAzureBlobFolder -Container $container -Connection $connection -Name "folder02"
$subscriptaccount = Get-VBRAzureAccount
$subscription = Get-VBRAzureSubscription -Account $subscriptaccount
$location = Get-VBRAzureLocation -Subscription $subscription
$vmsize = Get-VBRAzureVMSize -Subscription $subscription -Location $location
$network = Get-VBRAzureVirtualNetwork -Subscription $subscription -Name "VeeamInternalNetwork"
$subnet = Get-VBRAzureVirtualNetworkSubnet -Network $network -Name "VeeamInternalSubnet"
$rg = Get-VBRAzureResourceGroup -Subscription $subscription -Name "VeeamResourceGroup"
$proxy = New-VBRAzureComputeProxyAppliance -VMSize $vmsize -Network $network -Subnet $subnet -ResourceGroup $rg -RedirectorPort 443
Add-VBRAzureArchiveRepository -Connection $connection -AzureBlobFolder $folder -AzureProxySpec $proxy -Name "MyAzureArchive"
This example shows how to add the Azure Archive repository to the backup infrastructure.
Perform the following steps:
1. Specify Azure connection settings:
- Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
- Run the Connect-VBRAzureBlobService cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connection variable.
2. Specify object storage settings:
- Run the Get-VBRAzureBlobContainer cmdlet. Set the $connection variable as the Connection parameter value. Specify the Name parameter value. Save the result to the $container variable.
- Run the Get-VBRAzureBlobFolder cmdlet. Set the $container variable as the Container parameter value. Set the $connection variable as the Connection parameter value. Specify the Name parameter value. Save the result to the $folder variable.
3. Define the Azure proxy settings:
- Run the Get-VBRAzureAccount cmdlet. Save the result to the $subscriptaccount variable.
- Run the Get-VBRAzureSubscription cmdlet. Set the $subscriptaccount variable as the Account parameter value. Save the result to the $subscription variable.
- Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable the Subscription parameter value. Save the result to the $location variable.
- Run the Get-VBRAzureVMSize cmdlet. Set the $subscription variable as the Subscription parameter value. Set the $location variable as the Location parameter value. Save the result to the $vmsize variable.
- Run the Get-VBRAzureVirtualNetwork cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save the result to the $network variable.
- Run the Get-VBRAzureVirtualNetworkSubnet cmdlet. Set the $network variable as the Network parameter value. Specify the Name parameter values. Save the result to the $subnet variable.
- Run the Get-VBRAzureResourceGroup cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save the result to the $rg variable.
- Run the New-VBRAzureComputeProxyAppliance cmdlet. Set the $vmsize variable as the VMSize parameter value. Set the $network variable as the Network parameter value. Set the $subnet variable as the Subnet parameter value. Set the $rg variable as the ResourceGroup parameter value. Specify the RedirectorPort parameter value. Save the result to the $proxy variable.
4. Run the Add-VBRAzureArchiveRepository cmdlet. Specify the following settings:
- Set the $connection variable as the Connection parameter value.
- Set the $folder variable as the AzureBlobFolder parameter value.
- Set the $proxy variable as the AzureProxySpec parameter value.
- Specify the Name parameter value.

---

### Parameters
#### **AzureBlobFolder**
Specifies an Azure Blob folder. Veeam Backup & Replication will move backup files into this folder.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRAzureBlobFolder]`|true    |named   |False        |

#### **AzureProxySpec**
Specifies an archiver appliance that transfers data from Azure Blob storage to Azure Archive Storage.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRAzureComputeProxyAppliance]`|true    |named   |False        |

#### **Connection**
Specifies an active session with an Azure Archive repository that you want to add to the backup infrastructure.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRAzureBlobConnection]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies a description of an Azure Archive repository. The cmdlet will add an archive repository with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableBackupImmutability**
Defines that the cmdlet will enable the immutability option.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add an object storage repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a name of an Azure Archive repository. The cmdlet will add an archive repository with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **UseInstantRetrieval**
Defines that the cmdlet will create a repository where data blocks are marked with the cool access tier.
Note: If you do not provide the UseInstantRetrieval parameter, the cmdlet will create a repository where blocks are marked as the archive access tier.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureBlobConnection

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRAzureArchiveRepository

---

### Notes

---

### Syntax
```PowerShell
Add-VBRAzureArchiveRepository -AzureBlobFolder <VBRAzureBlobFolder> -AzureProxySpec <VBRAzureComputeProxyAppliance> -Connection <VBRAzureBlobConnection> [-Description <String>] [-EnableBackupImmutability] 
```
```PowerShell
[-Force] [-Name <String>] [-UseInstantRetrieval] [<CommonParameters>]
```
