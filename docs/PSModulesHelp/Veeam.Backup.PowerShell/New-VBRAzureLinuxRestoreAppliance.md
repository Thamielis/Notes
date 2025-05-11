New-VBRAzureLinuxRestoreAppliance
---------------------------------

### Synopsis
Creates appliances for restoring Linux VMs to Microsoft Azure.

---

### Description

This cmdlet creates an appliance for restoring Linux VMs to Microsoft Azure.
You will need to further deploy the appliance with Deploy-VBRAzureLinuxRestoreAppliance.

---

### Examples
> Example 1

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
$storageaccount = Get-VBRAzureStorageAccount -Subscription $subscription -Name "VeeamDirectRestore2AzureStorage"
$network = Get-VBRAzureVirtualNetwork -Subscription $subscription -Name "VeeamInternalNetwork"
$subnet = Get-VBRAzureVirtualNetworkSubnet -Network $network -Name "VeeamInternalSubnet"
New-VBRAzureLinuxRestoreAppliance -Subscription $subscription -StorageAccount $storageaccount -VirtualNetwork $network -VirtualSubnet $subnet
This example shows how to restore a VM to a Resource Manager account:

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Set the ResourceManager value as the Type parameter value. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureStorageAccount cmdlet.  Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save it to the $storageaccount variable.
4. Run the Get-VBRAzureVirtualNetwork cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save the result to the $network variable.
5. Run the Get-VBRAzureVirtualNetworkSubnet cmdlet. Set the $network variable as the Network parameter value. Specify the Name parameter value. Save the result to the $subnet variable.
6. Run the New-VBRAzureLinuxRestoreAppliance cmdlet. Specify the following settings:
- Set the $subscription variable as the Subscription parameter value.
- Set the $storageaccount variable as the StorageAccount parameter value.
- Set the $network variable as the VirtualNetwork parameter value.
- Set the $subnet variable as the VirtualSubnet parameter value.

---

### Parameters
#### **ResourceGroup**
Specifies the resource group to which you want to connect the helper appliance.

|Type                     |Required|Position|PipelineInput        |
|-------------------------|--------|--------|---------------------|
|`[VBRAzureResourceGroup]`|false   |named   |True (ByPropertyName)|

#### **SshPort**
Specifies the port that used to connect the helper appliance.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |True (ByPropertyName)|

#### **StorageAccount**
Specifies the storage account you want to use to deploy the helper appliance.

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VBRAzureStorageAccount]`|true    |named   |True (ByPropertyName)|

#### **Subscription**
Specifies the Microsoft Azure subscription in which you plan to deploy the helper appliance.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRAzureSubscription]`|true    |named   |True (ByPropertyName, ByValue)|

#### **VirtualNetwork**
Specifies the virtual network to which you want to connect the helper appliance.

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VBRAzureVirtualNetwork]`|true    |named   |True (ByPropertyName)|

#### **VirtualSubnet**
Specifies the virtual network subnet to which you want to connect the helper appliance.

|Type                     |Required|Position|PipelineInput        |
|-------------------------|--------|--------|---------------------|
|`[VBRAzureNetworkSubnet]`|true    |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureSubscription

Veeam.Backup.PowerShell.Infos.VBRAzureStorageAccount

Veeam.Backup.PowerShell.Infos.VBRAzureResourceGroup

Veeam.Backup.PowerShell.Infos.VBRAzureVirtualNetwork

Veeam.Backup.PowerShell.Infos.VBRAzureNetworkSubnet

System.Int32

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRAzureLinuxRestoreAppliance [-ResourceGroup <VBRAzureResourceGroup>] [-SshPort <Int32>] -StorageAccount <VBRAzureStorageAccount> -Subscription <VBRAzureSubscription> -VirtualNetwork 
```
```PowerShell
<VBRAzureVirtualNetwork> -VirtualSubnet <VBRAzureNetworkSubnet> [<CommonParameters>]
```
