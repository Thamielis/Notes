Get-VBRCloudProviderNetworkAppliance
------------------------------------

### Synopsis
Returns network extension appliance configured on the user side.

---

### Description

This cmdlet returns network extension appliance created on the user side. This appliance is used in replica failover scenarios.

---

### Related Links
* [Get-VBRCloudProvider](Get-VBRCloudProvider)

---

### Examples
> Example - Getting All Network Appliances by Cloud Service Provider IP Address

$provider = Get-VBRCloudProvider -Name "104.45.95.227" 
Get-VBRCloudProviderNetworkAppliance -CloudProvider $provider
This example shows how to search for all network appliances configured by the cloud service provider with the 104.45.95.227 IP address.

Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter value. Save the result to the $provider variable.
2. Run the Get-VBRCloudProviderNetworkAppliance cmdlet. Set the $provider variable as the CloudProvider parameter value.

---

### Parameters
#### **CloudProvider**
Specifies the array of the service providers. The cmdlet will return appliances configured by these providers. Accepts the VBRCloudProvider[] object.  To get this object, run the Get-VBRCloudProvider cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRCloudProvider[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of the appliance names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudProvider[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudProviderNetworkAppliance [-CloudProvider <VBRCloudProvider[]>] [-Name <String[]>] [<CommonParameters>]
```
