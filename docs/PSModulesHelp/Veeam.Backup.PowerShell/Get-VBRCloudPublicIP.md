Get-VBRCloudPublicIP
--------------------

### Synopsis
Returns existing public IP addresses.

---

### Description

This cmdlet returns public IP addresses that are configured by the service provider. You can get all configured IP addresses or the IP addresses allocated to a selected user.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Example 1. Getting All Configured Public IP Addresses

```PowerShell
Get-VBRCloudPublicIP
This command returns all configured public IP addresses.
```
> Example 2. Getting All Configured Public IP Addresses

$tenant = Get-VBRCloudTenant -Name "ABC Company"
Get-VBRCloudPublicIP -Tenant $tenant
This example shows how to return public IP addresses assigned to the ABC company.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRCloudPublicIP cmdlet. Set the $tenant variable as the Tenant parameter value.

---

### Parameters
#### **Tenant**
Specifies the cloud user. The cmdlet will return the IP addresses assigned to this user. Accepts the VBRCloudTenant object. To get this object, run the Get-VBRCloudTenant cmdlet.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRCloudTenant]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudPublicIP [-Tenant <VBRCloudTenant>] [<CommonParameters>]
```
