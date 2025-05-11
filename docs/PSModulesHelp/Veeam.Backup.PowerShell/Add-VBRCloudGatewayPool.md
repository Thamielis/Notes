Add-VBRCloudGatewayPool
-----------------------

### Synopsis
Creates cloud gateway pools.

---

### Description

This cmdlet creates cloud gateway pools.

Important! If you add all available gateways to cloud gateway pools, the jobs will fail for tenants with the automatic gateway type. You will not be able to create new tenants with automatic selection type.

---

### Related Links
* [Get-VBRCloudGateway](Get-VBRCloudGateway)

---

### Examples
> Example - Creating Cloud Gateway Pool

$gateway = Get-VBRCloudGateway
Add-VBRCloudGatewayPool -Name "Silver Pool" -CloudGateway $gateway
This example shows how to create a cloud gateway pool.

Perform the following steps:
1. Run the Get-VBRCloudGateway cmdlet to get the array of cloud gateways. Save the result to the $gateway variable.
2. Run the Add-VBRCloudGatewayPool cmdlet. Specify the Name parameter value. Set the $gateway variable as the CloudGateway parameter value.

---

### Parameters
#### **CloudGateway**
Specifies an array of gateways from the cloud infrastructure. The cmdlet will add these gateways to the cloud gateway pool. Accepts the VBRCloudGateway[] object.  To get this object, run the Get-VBRCloudGateway cmdlet.

|Type                 |Required|Position|PipelineInput |
|---------------------|--------|--------|--------------|
|`[VBRCloudGateway[]]`|true    |named   |True (ByValue)|

#### **Description**
Specifies the description of the cloud gateway pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add all available gateways to cloud gateway pools without warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name of the cloud gateway pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudGateway[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRCloudGatewayPool -CloudGateway <VBRCloudGateway[]> [-Description <String>] [-Force] -Name <String> [<CommonParameters>]
```
