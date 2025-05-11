New-VBRAzureComputeProxyAppliance
---------------------------------

### Synopsis
Defines proxy appliance settings for adding Azure Archive repository.

---

### Description

This cmdlet defines the proxy appliance settings for adding an Azure Archive repository.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

* [Get-VBRAzureSubscription](Get-VBRAzureSubscription)

* [Get-VBRAzureLocation](Get-VBRAzureLocation)

* [Get-VBRAzureVMSize](Get-VBRAzureVMSize)

* [Get-VBRAzureVirtualNetwork](Get-VBRAzureVirtualNetwork)

* [Get-VBRAzureVirtualNetworkSubnet](Get-VBRAzureVirtualNetworkSubnet)

* [Get-VBRAzureResourceGroup](Get-VBRAzureResourceGroup)

---

### Examples
> Adding Azure Proxy Appliance

$account = Get-VBRAzureBlobAccount -Name "Azure_Blob"
$subscription = Get-VBRAzureSubscription -Account $account
$location = Get-VBRAzureLocation -Subscription $subscription
$vmsize = Get-VBRAzureVMSize -Subscription $subscription -Location $location
$network = Get-VBRAzureVirtualNetwork -Name "VeeamInternalNetwork"
$subnet = Get-VBRAzureVirtualNetworkSubnet -Network $network -Name "VeeamInternalSubnet"
$rg = Get-VBRAzureResourceGroup -Subscription $subscription -Name "VeeamResourceGroup"
New-VBRAzureComputeProxyAppliance -VMSize $vmsize -Network $network -Subnet $subnet -ResourceGroup $rg -RedirectorPort 443
This example shows how to defines settings of an Azure proxy appliance.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Define the Azure proxy settings:
a. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Save the result to the $subscription variable.
b. Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable as the Subscription parameter value. Save the result to the $location variable.
c. Run the Get-VBRAzureVMSize cmdlet. Set the $subscription variable as the Subscription parameter value. Set the $location variable as the Location parameter value. Save the result to the $vmsize variable.
d. Run the Get-VBRAzureVirtualNetwork cmdlet. Specify the Name parameter values. Save the result to the $network variable. e. Run the Get-VBRAzureVirtualNetworkSubnet cmdlet. Set the $network variable as the Network parameter value. Specify the Name parameter value. Save the result to the $subnet variable.
f. Run the Get-VBRAzureResourceGroup cmdlet. Specify the Name parameter value. Save the result to the $rg variable.
3. Run the New-VBRAzureComputeProxyAppliance cmdlet. Specify the following settings:
- Set the $vmsize variable as the VMSize parameter value.
- Set the $network variable as the Network parameter value.
- Set the $subnet variable as the Subnet parameter value.
- Set the $rg variable as the ResourceGroup parameter value.
- Specify the RedirectorPort parameter value.

---

### Parameters
#### **Network**
Specifies the network to which the proxy appliance appliance must be connected.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRAzureVirtualNetwork]`|true    |named   |False        |

#### **RedirectorPort**
Specifies the port that Veeam Backup & Replication will use to route requests between the proxy appliance and backup infrastructure components.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ResourceGroup**
Specifies the resource group that will be associated with the proxy appliance.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRAzureResourceGroup]`|true    |named   |False        |

#### **Subnet**
Specifies the subnet for the proxy appliance.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRAzureNetworkSubnet]`|true    |named   |False        |

#### **VMSize**
Specifies the size of the proxy appliance.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRAzureVMSize]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRAzureComputeProxyAppliance

---

### Notes

---

### Syntax
```PowerShell
New-VBRAzureComputeProxyAppliance -Network <VBRAzureVirtualNetwork> [-RedirectorPort <Int32>] -ResourceGroup <VBRAzureResourceGroup> -Subnet <VBRAzureNetworkSubnet> -VMSize <VBRAzureVMSize> [<CommonParameters>]
```
