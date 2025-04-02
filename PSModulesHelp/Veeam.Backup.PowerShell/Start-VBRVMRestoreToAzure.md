Start-VBRVMRestoreToAzure
-------------------------

### Synopsis
Restores VM backups to Microsoft Azure.

---

### Description

This cmdlet restores VM backups to Microsoft Azure. You can restore the data to the following types of Microsoft Azure deployment models:
- Microsoft Azure Resource Manager
- Microsoft Azure Stack
- For Microsoft Azure Classic
IMPORTANT! You must select the Microsoft Azure configuration options that supports the VM you restore.
For example, if you restore a VM that has 4 disks, select an Azure VM configuration option that supports 4 or more disks.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRAzureSubscription](Get-VBRAzureSubscription)

* [Get-VBRAzureStorageAccount](Get-VBRAzureStorageAccount)

* [Get-VBRAzureVMSize](Get-VBRAzureVMSize)

* [Get-VBRAzureVirtualNetwork](Get-VBRAzureVirtualNetwork)

* [Get-VBRAzureVirtualNetworkSubnet](Get-VBRAzureVirtualNetworkSubnet)

* [Get-VBRServer](Get-VBRServer)

* [Get-VBRAzureResourceGroup](Get-VBRAzureResourceGroup)

* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRAzureCloudService](Get-VBRAzureCloudService)

---

### Examples
> Example 1

$restorepoint = Get-VBRBackup -Name "MSExchange Backup" | Get-VBRRestorePoint -Name "MSExchange02" | Sort-Object CreationTime -Descending | Select -First 1
$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
$storageaccount = Get-VBRAzureStorageAccount -Subscription $subscription -Name "VeeamDirectRestore2AzureStorage"
$location = Get-VBRAzureLocation -Subscription $subscription -Name australiaeast
$vmsize = Get-VBRAzureVMSize -Subscription $subscription -Location $location -Name Standard_G3
$network = Get-VBRAzureVirtualNetwork -Subscription $subscription -Name "VeeamInternalNetwork"
$subnet = Get-VBRAzureVirtualNetworkSubnet -Network $network -Name "VeeamInternalSubnet"
$resourcegroup = Get-VBRAzureResourceGroup -Subscription $subscription -Name "VeeamResourceGroup"
Start-VBRVMRestoreToAzure -RestorePoint $restorepoint -Subscription $subscription -StorageAccount $storageaccount -VmSize $vmsize -VirtualNetwork $network -VirtualSubnet $subnet -ResourceGroup $resourcegroup -VmName CRM_db_restored2Azure -Reason "Back up CRM_db to Microsoft Azure"
This example shows how to restore a VM to Microsoft Azure for the Resource Manager deployment model.

Perform the following steps:
1. Get the restore point of the VM that you want to restore:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value.
- Pipe the cmdlet output to the Get-VBRRestorePoint cmdlet. Specify the Name parameter value.
- Pipe the cmdlet output to the Sort-Object cmdlet and specify the CreationTime parameter value.
- Pipe the cmdlet output to the Select cmdlet. Specify the First parameter value.
- Save the result to the $restorepoint variable.
2. Run the Get-VBRAzureAccount cmdlet. Set the ResourceManager value as the Type parameter value. Specify the Name parameter value. Save the result to the $account variable.
3. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save the subscription to the $subscription variable.
4. Run the Get-VBRAzureStorageAccount cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save it to the $storageaccount variable.
5. Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save the result to the $location variable.
6. Run the Get-VBRAzureVMSize cmdlet. Set the $subscription variable as the Subscription parameter value. Set the $location variable as the Location parameter value. Specify the Name parameter value. Save it to the $vmsize variable.
7. Run the Get-VBRAzureVirtualNetwork cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save the result to the $network variable.
8. Run the Get-VBRAzureVirtualNetworkSubnet cmdlet. Set the $network variable as the Network parameter value. Specify the Name parameter value. Save the result to the $subnet variable.
9. Run the Get-VBRAzureResourceGroup cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save the result to the $resourcegroup variable.
10. Run the Start-VBRVMRestoreToAzure cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $subscription variable as the Subscription parameter value.
- Set the $storageaccount variable as the StorageAccount parameter value.
- Set the $vmsize variable as the VmSize parameter value.
- Set the $network variable as the VirtualNetwork parameter value.
- Set the $subnet variable as the VirtualSubnet parameter value.
- Set the $resourcegroup variable as the ResourceGroup parameter value.
- Specify the VmName and the Reason parameter values.
> Example 2

$restorepoint = Get-VBRBackup -Name "MSExchange Backup" | Get-VBRRestorePoint -Name "MSExchange02" | Sort-Object CreationTime -Descending | Select -First 1 
$account = Get-VBRAzureAccount -Type Classic -Name "RestoreToAzure@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
$storageaccount = Get-VBRAzureStorageAccount -Subscription $subscription -Name "VeeamDirectRestore2AzureStorage"
$location = Get-VBRAzureLocation -Subscription $subscription -Name "Classic Central US"
$vmsize = Get-VBRAzureVMSize -Subscription $subscription -Location $location -Name Standard_G3
Start-VBRVMRestoreToAzure -RestorePoint $restorepoint -Subscription $subscription -StorageAccount $storageaccount -VmSize $vmsize -DNSName "CRM_db_Restored_to_Azure" -Endpoint 443 -Reason "Back up CRM_db to Microsoft Azure"
This example shows how to restore a VM to a Classic account.

Perform the following steps:
1. Get the restore point of the VM that you want to restore:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value.
- Pipe the cmdlet output to the Get-VBRRestorePoint cmdlet. Specify the Name parameter value.
- Pipe the cmdlet output to the Sort-Object cmdlet and specify the CreationTime parameter value.
- Pipe the cmdlet output to the Select cmdlet. Specify the First parameter value.
- Save the result to the $restorepoint variable.
2. Run the Get-VBRAzureAccount cmdlet. Set the Classic value as the Type parameter value. Specify the Name parameter value. Save the result to the $account variable.
3. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save the subscription to the $subscription variable.
4. Run the Get-VBRAzureStorageAccount cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save it to the $storageaccount variable.
5. Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save the result to the $location variable.
6. Run the Get-VBRAzureVMSize cmdlet. Set the $subscription variable as the Subscription parameter value. Set the $location variable as the Location parameter value. Specify the Name parameter value. Save it to the $vmsize variable.
7. Run the Start-VBRVMRestoreToAzure cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $subscription variable as the Subscription parameter value.
- Set the $storageaccount variable as the StorageAccount parameter value.
- Set the $vmsize variable as the VmSize parameter value.
- Specify the DNSName parameter value.
- Specify the Endpoint parameter value.
- Specify the Reason parameter value.
> Example 3

$restorepoint = Get-VBRBackup -Name "MSExchange Backup" | Get-VBRRestorePoint -Name "MSExchange02" | Sort-Object CreationTime -Descending | Select -First 1 
$account = Get-VBRAzureAccount -Type Classic -Name "RestoreToAzure@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
$storageaccount = Get-VBRAzureStorageAccount -Subscription $subscription -Name "VeeamDirectRestore2AzureStorage"
$location = Get-VBRAzureLocation -Subscription $subscription -Name "Classic Central US"
$vmsize = Get-VBRAzureVMSize -Subscription $subscription -Location $location -Name Standard_G3
$network = Get-VBRAzureVirtualNetwork -Subscription $subscription -Name "VeeamInternalNetwork"
$subnet = Get-VBRAzureVirtualNetworkSubnet -Network $network -Name "VeeamInternalSubnet"
$resourcegroup = Get-VBRAzureResourceGroup -Subscription $subscription -Name "VeeamResourceGroup"
$proxy = Get-VBRServer -Name "azureproxy.cloudapp.net"
Start-VBRVMRestoreToAzure -RestorePoint $restorepoint -Subscription $subscription -StorageAccount $storageaccount -VmSize $vmsize -VirtualNetwork $network -VirtualSubnet $subnet -ResourceGroup $resourcegroup -VmName CRM_db_restored2Azure -Reason "Back up CRM_db to Microsoft Azure" -GatewayServer $proxy
This example shows how to start restore using a proxy server.

Perform the following steps:
1. Get the restore point of the VM that you want to restore:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value.
- Pipe the cmdlet output to the Get-VBRRestorePoint cmdlet. Specify the Name parameter value.
- Pipe the cmdlet output to the Sort-Object cmdlet and specify the CreationTime parameter value.
- Pipe the cmdlet output to the Select cmdlet. Specify the First parameter value.
- Save the result to the $restorepoint variable.
2. Run the Get-VBRAzureAccount cmdlet. Set the Classic value as the Type parameter value. Specify the Name parameter value. Save the result to the $account variable.
3. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save the subscription to the $subscription variable.
4. Run the Get-VBRAzureStorageAccount cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save it to the $storageaccount variable.
5. Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save the result to the $location variable.
6. Run the Get-VBRAzureVMSize cmdlet. Set the $subscription variable as the Subscription parameter value. Set the $location variable as the Location parameter value. Specify the Name parameter value. Save it to the $vmsize variable.
7. Run the Get-VBRAzureVirtualNetwork cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save the result to the $network variable.
8. Run the Get-VBRAzureVirtualNetworkSubnet cmdlet. Set the $network variable as the Network parameter value. Specify the Name parameter value. Save the result to the $subnet variable.
9. Run the Get-VBRAzureResourceGroup cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save the result to the $resourcegroup variable.
10. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
11. Run the Start-VBRVMRestoreToAzure cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $subscription variable as the Subscription parameter value.
- Set the $storageaccount variable as the StorageAccount parameter value.
- Set the $vmsize variable as the VmSize parameter value.
- Set the $network variable as the VirtualNetwork parameter value.
- Set the $subnet variable as the VirtualSubnet parameter value.
- Set the $resourcegroup variable as the ResourceGroup parameter value.
- Specify the VmName and the Reason parameter values.
- Set the $proxy variable as the GatewayServer parameter value.

---

### Parameters
#### **AllocatePublicIP**
Defines that the cmdlet will assign a public IP to the restored VM.
If you provide this parameter, Veeam Backup & Replication will assign a public IP to it.
Otherwise, the restored VM will remain without the public IP.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **CloudService**
For Microsoft Azure Classic accounts.
Specifies the existing cloud service. The restored VM will be added to this cloud service.
If you skip this parameter, the cmdlet will create a new cloud service for the restored VM. Use the DNSName parameter to set the name for the new cloud service.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRAzureCloudService]`|false   |named   |False        |

#### **Credentials**
For restoring backups located on a network shared folder.
Specifies the credentials to authenticate with the network shared folder.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **DiskConfigurations**
Specifies the Azure VM disk type. The cmdlet will attach disks of this type to the restored VM.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRAzureDiskConfiguration[]]`|false   |named   |False        |

#### **DisksToExclude**
Specifies the array of VM disk file names.
Use this parameter to specify the VM disks that you want to exclude.
The cmdlet will not restore these disks.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **DNSName**
For Microsoft Azure Classic deployment model.
Specifies the name of the new cloud service.
If you skip this parameter, use the CloudService parameter to place the restored VM to an existing cloud service.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableAntivirusScan**
Enables the secure restore option.
Veeam Backup & Replication will trigger the antivirus software to scan selected VMs before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Defines that the antivirus will continue VMs scan after the first virus threat is found.
Use this option if you want to get the report on all virus threats.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableYARAScan**
Enables the YARA scan for the selected VMs.
Use the YARAScanRule parameter to specify the YARA rule to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Endpoint**
For Microsoft Azure Classic accounts.
Specifies the port number. This port will be used to connect to the restored VM.
If you skip this parameter, the cmdlet will use the default port numbers:
* For Windows VMs: 3389.
* For Linux VMs: 22.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |False        |

#### **GatewayServer**
Specifies the proxy server.
The restore process will use this server to transfer the VM data to the Microsoft Azure datacenter.
If you skip this parameter, the restore process will use Veeam backup server as a proxy server.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Location**
Specifies a geographic location of Microsoft Azure datacenters.
The cmdletwill restore a VM to this location.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRAzureLocation]`|false   |named   |False        |

#### **NetworkSecurityGroup**
Specifies a security group for the restored VM.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRNetworkSecurityGroup]`|false   |named   |False        |

#### **NewResourceGroupName**
For Microsoft Azure Resource Manager deployment models.
Specifies the name of a new resource group. The cmdlet will create a new resource group with this name.
If you skip this parameter, use the ResourceGroup parameter to specify an existing resource group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ResourceGroup**
For Microsoft Azure Resource Manager accounts.
Specifies the Microsoft Azure resource group. The restored VM will use this restore group.
If you skip this parameter, the cmdlet will need to create a new resource group. Use the NewResourceGroupName parameter to create a new resource group. The new resource group is created with default resources.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRAzureResourceGroup]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point of the backup you want to restore to Microsoft Azure.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ShutdownVM**
Defines that the cmdlet will power on the restored VM after the restore is complete.
If you do not provide this parameter, the restored VM will remain powered on.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StorageAccount**
Specifies the Microsoft Azure storage account. The restored VM will use this storage account.
Note: This parameter is not required if the StorageType parameter is set to Managed. If you do not specify the StorageAccount parameter, you must specify the Location parameter.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRAzureStorageAccount]`|false   |named   |False        |

#### **StorageType**
Specifies a type of Microsoft Azure disks.
You can specify either of the following disk types:
* Managed
* Unmanaged
Valid Values:

* Managed
* Unmanaged

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRAzureStorageType]`|false   |named   |False        |

#### **Subscription**
Specifies the Microsoft Azure subscription.
The cmdlet will restore the backup to this subscription.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRAzureSubscription]`|true    |named   |False        |

#### **VirtualNetwork**
Specifies the Microsoft Azure virtual network.
The restored VM will be connected to this network.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRAzureVirtualNetwork]`|true    |named   |False        |

#### **VirtualSubnet**
Specifies the Microsoft Azure virtual subnet.
The restored VM will be connected to this subnet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRAzureNetworkSubnet]`|true    |named   |False        |

#### **VirusDetectionAction**
For secure restore.
Specifies secure restore action when the virus threat is detected.
* ConnectToIsolatedNetwork - use this option if you want to restore a machine to the isolated network.
* AbortRecovery - use this option if you want to cancel the restore session.
Valid Values:

* ConnectToIsolatedNetwork
* AbortRecovery

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRAzureVirusDetectionAction]`|false   |named   |False        |

#### **VirusIsolatedNetwork**
Specifies the Azure virtual network.
Veeam Backup & Replication will restore the infected VM to the selected network.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRAzureVirtualNetwork]`|false   |named   |False        |

#### **VirusIsolatedNetworkSubnet**
Specifies the Azure virtual network subnet.
Veeam Backup & Replication will restore the infected VM to the selected network.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRAzureNetworkSubnet]`|false   |named   |False        |

#### **VmName**
Specifies the VM name. The restored VM will have this name.
If you do not specify a new name, the restored VM will have it's original name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **VmSize**
Specifies the Microsoft Azure VM configuration option.
The VM will use this configuration template.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRAzureVMSize]`|true    |named   |False        |

#### **Wait**
Indicates that the command waits for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **YARAScanRule**
Specifies the YARA rule. Veeam Backup & Replication will scan VMs with this rule.
Veeam Backup & Replication searches for YARA rules by the following path: C:\Program Files\Veeam\Backup and Replication\Backup\YaraRules.
To use the Yara rule, you must specify its name and extension. Veeam Backup & Replication accepts only .yar and .yara extension.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRVMRestoreToAzure [-AllocatePublicIP] [-CloudService <VBRAzureCloudService>] [-Credentials <CCredentials>] [-DiskConfigurations <VBRAzureDiskConfiguration[]>] [-DisksToExclude <String[]>] [-DNSName 
```
```PowerShell
<String>] [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableYARAScan] [-Endpoint <UInt16>] [-GatewayServer <CHost>] [-Location <VBRAzureLocation>] [-NetworkSecurityGroup <VBRNetworkSecurityGroup>] 
```
```PowerShell
[-Reason <String>] -RestorePoint <COib> [-ShutdownVM] [-StorageAccount <VBRAzureStorageAccount>] [-StorageType {Managed | Unmanaged}] -Subscription <VBRAzureSubscription> [-VirtualNetwork 
```
```PowerShell
<VBRAzureVirtualNetwork>] [-VirtualSubnet <VBRAzureNetworkSubnet>] [-VirusDetectionAction {ConnectToIsolatedNetwork | AbortRecovery}] [-VirusIsolatedNetwork <VBRAzureVirtualNetwork>] 
```
```PowerShell
[-VirusIsolatedNetworkSubnet <VBRAzureNetworkSubnet>] [-VmName <String>] -VmSize <VBRAzureVMSize> [-Wait] [-YARAScanRule <String>] [<CommonParameters>]
```
```PowerShell
Start-VBRVMRestoreToAzure [-AllocatePublicIP] [-Credentials <CCredentials>] [-DiskConfigurations <VBRAzureDiskConfiguration[]>] [-DisksToExclude <String[]>] [-EnableAntivirusScan] [-EnableEntireVolumeScan] 
```
```PowerShell
[-EnableYARAScan] [-GatewayServer <CHost>] [-Location <VBRAzureLocation>] [-NetworkSecurityGroup <VBRNetworkSecurityGroup>] [-NewResourceGroupName <String>] [-Reason <String>] [-ResourceGroup 
```
```PowerShell
<VBRAzureResourceGroup>] -RestorePoint <COib> [-ShutdownVM] [-StorageAccount <VBRAzureStorageAccount>] [-StorageType {Managed | Unmanaged}] -Subscription <VBRAzureSubscription> -VirtualNetwork 
```
```PowerShell
<VBRAzureVirtualNetwork> -VirtualSubnet <VBRAzureNetworkSubnet> [-VirusDetectionAction {ConnectToIsolatedNetwork | AbortRecovery}] [-VirusIsolatedNetwork <VBRAzureVirtualNetwork>] [-VirusIsolatedNetworkSubnet 
```
```PowerShell
<VBRAzureNetworkSubnet>] [-VmName <String>] -VmSize <VBRAzureVMSize> [-Wait] [-YARAScanRule <String>] [<CommonParameters>]
```
