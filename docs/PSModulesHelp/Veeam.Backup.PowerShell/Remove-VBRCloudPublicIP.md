Remove-VBRCloudPublicIP
-----------------------

### Synopsis
Removes IP addresses from public IP addresses pools.

---

### Description

This cmdlet removes a selected IP address from the public IP addresses pool.

---

### Related Links
* [Get-VBRCloudPublicIP](Get-VBRCloudPublicIP)

---

### Examples
> Example 1. Removing IP Address from Pool of Public IP Addresses

$ip = Get-VBRCloudPublicIP
Remove-VBRCloudPublicIP -CloudIP $ip[0]
This example shows how to remove the first IP address from the configured pool of public IP addresses.

Perform the following steps:
1. Run the Get-VBRCloudPublicIP cmdlet. Save the pool to the $ip variable. Mind the ordinal number of the necessary IP address (in our example, it is the first IP address in the array).
2. Run the Remove-VBRCloudPublicIP cmdlet. Set the $ip variable as the CloudIP parameter value.
> Example 2. Removing IP Address from Pool of Public IP Addresses

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$ip = Get-VBRCloudPublicIP -Tenant $tenant
Remove-VBRCloudPublicIP -CloudIP $ip
This example shows how to remove all IP addresses assigned to the cloud tenant named "ABC Company".

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRCloudPublicIP cmdlet. Set the $tenant variable as the Tenant parameter value. Save the result to the $ip variable.
3. Run the Remove-VBRCloudPublicIP cmdlet. Set the $ip variable as the CloudIP parameter value.

---

### Parameters
#### **CloudIp**
Specifies the array of IP addresses that you want to remove. Accepts the VBRCloudIP[] object.  To get this object, run the Get-VBRCloudPublicIP cmdlet.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRCloudIP[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudIP[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRCloudPublicIP -CloudIp <VBRCloudIP[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
