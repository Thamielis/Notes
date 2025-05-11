Get-VBRDefaultGatewayConfiguration
----------------------------------

### Synopsis
Returns configuration of default gateways.

---

### Description

This cmdlet returns configuration information on service provider default gateways. You can get information about all gateways of all service providers, or look for a selected service provider.

---

### Related Links
* [Get-VBRCloudProvider](Get-VBRCloudProvider)

---

### Examples
> Example 1. Getting Configuration of Default Gateways of All Cloud Providers

```PowerShell
Get-VBRDefaultGatewayConfiguration
This command looks for configuration of default gateways of all cloud providers.
```
> Example 2. Getting Configuration of Default Gateway of Selected Cloud Provider

$cloudprovider = Get-VBRCloudprovider -Name "Cloud provider01" 
Get-VBRDefaultGatewayConfiguration -CloudProvider $cloudprovider
This example shows how to look for configuration of default gateway of the cloud provider named Cloud provider01.

Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter value. Save the result to the $cloudprovider variable.
2. Run the Get-VBRDefaultGatewayConfiguration cmdlet. Set the $cloudprovider variable as the CloudProvider parameter value.

---

### Parameters
#### **CloudProvider**
Specifies the array of cloud providers. The cmdlet will return the default gateways of these cloud providers. Accepts the VBRCloudProvider[] object.  To get this object, run the Get-VBRCloudProvider cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRCloudProvider[]]`|false   |named   |True (ByPropertyName, ByValue)|

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
Get-VBRDefaultGatewayConfiguration [-CloudProvider <VBRCloudProvider[]>] [<CommonParameters>]
```
