Set-VBRAzureLinuxRestoreAppliance
---------------------------------

### Synopsis
Modifies helper appliances for restoring Linux VMs to Microsoft Azure.

---

### Description

This cmdlet modifies helper appliances for restoring Linux VMs to Microsoft Azure.
You will need to further deploy the helper appliance with the Deploy-VBRAzureLinuxRestoreAppliance cmdlet.
NOTE: This cmdlet does not support Microsoft Azure accounts with the Azure Service Manager type of a subscription (ASM, also known as a "classic" type subscription).

---

### Examples
> Example 1

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
$appliance = Get-VBRAzureLinuxRestoreAppliance -Account $account | Select-Object -First 1 
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
$newstorageaccount = Get-VBRAzureStorageAccount -Subscription $subscription -Name "VeeamDirectRestore2AzureStorage"
Set-VBRAzureLinuxRestoreAppliance -Appliance $appliance -StorageAccount $newstorageaccount
This example shows how to set another storage account for a Linux VM restore helper appliance.
Perform the following steps:
1. Get the Linux helper appliance:
- Run the Get-VBRAzureAccount cmdlet. Set the ResourceManager option for the Type parameter. Specify the Name parameter value. Save the result to the $account variable.
- Run the Get-VBRAzureLinuxRestoreAppliance cmdlet. Set the $account variable as the Account parameter value. Pipe the cmdlet output to the Select-Object cmdlet. Specify the First parameter value. Save the result to the $appliance variable.
2. Get the Microsoft Azure storage account you want to use:
- Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save the subscription to the $subscription variable.
- Run the Get-VBRAzureStorageAccount cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save it to the $newstorageaccount variable.
3. Run the Set-VBRAzureLinuxRestoreAppliance cmdlet. Set the $appliance variable as the Appliance parameter value. Set the $storageaccount variable as the StorageAccount parameter value.

---

### Parameters
#### **Appliance**
Specifies the helper appliance you want to modify.

|Type                             |Required|Position|PipelineInput                 |
|---------------------------------|--------|--------|------------------------------|
|`[VBRAzureLinuxRestoreAppliance]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ResourceGroup**
Specifies a Microsoft Azure resource group to which you want to connect the helper appliance.

|Type                     |Required|Position|PipelineInput        |
|-------------------------|--------|--------|---------------------|
|`[VBRAzureResourceGroup]`|false   |named   |True (ByPropertyName)|

#### **SshPort**
Specifies a port over which Veeam Backup & Replication will will communicate with the helper appliance.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |True (ByPropertyName)|

#### **StorageAccount**
Specifies the storage account you want to use to deploy the helper appliance.

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VBRAzureStorageAccount]`|false   |named   |True (ByPropertyName)|

#### **Subscription**
Specifies the Microsoft Azure subscription in which you plan to deploy the helper appliance.

|Type                    |Required|Position|PipelineInput        |
|------------------------|--------|--------|---------------------|
|`[VBRAzureSubscription]`|false   |named   |True (ByPropertyName)|

#### **VirtualNetwork**
Specifies the virtual network to which you want to connect the helper appliance.

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VBRAzureVirtualNetwork]`|false   |named   |True (ByPropertyName)|

#### **VirtualSubnet**
Specifies the virtual network subnet to which you want to connect the helper appliance.

|Type                     |Required|Position|PipelineInput        |
|-------------------------|--------|--------|---------------------|
|`[VBRAzureNetworkSubnet]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureLinuxRestoreAppliance

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
Set-VBRAzureLinuxRestoreAppliance -Appliance <VBRAzureLinuxRestoreAppliance> [-ResourceGroup <VBRAzureResourceGroup>] [-SshPort <Int32>] [-StorageAccount <VBRAzureStorageAccount>] [-Subscription 
```
```PowerShell
<VBRAzureSubscription>] [-VirtualNetwork <VBRAzureVirtualNetwork>] [-VirtualSubnet <VBRAzureNetworkSubnet>] [<CommonParameters>]
```
