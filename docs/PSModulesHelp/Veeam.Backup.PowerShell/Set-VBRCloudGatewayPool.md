Set-VBRCloudGatewayPool
-----------------------

### Synopsis
Modifies cloud gateway pools.

---

### Description

This cmdlet modifies cloud gateway pools. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCloudGatewayPool](Get-VBRCloudGatewayPool)

---

### Examples
> Example - Modifying Name of Cloud Gateway Pool

$pool = Get-VBRCloudGatewayPool -Name "New Cloud Pool"
Set-VBRCloudGatewayPool -CloudGatewayPool $pool -Name "Silver Cloud Pool"
This example shows how to modify the name of a cloud gateway pool.

Perform the following steps:
1. Run the Get-VBRCloudGatewayPool cmdlet. Save the result to the $pool variable.
2. Run the Set-VBRCloudGatewayPool cmdlet. Set the $pool variable as the CloudGatewayPool parameter value. Specify the Name parameter value.

---

### Parameters
#### **CloudGateway**
Specifies cloud gateways. The cmdlet will add these cloud gateways to the cloud gateway pool. NOTE: The cmdlet will overwrite the existing cloud gateway pools with the new ones. Accepts the VBRCloudGateway[] object. To get this object, run the Get-VBRCloudGateway cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRCloudGateway[]]`|false   |named   |False        |

#### **CloudGatewayPool**
Specifies the cloud gateway pool that you want to modify. Accepts the VBRCloudGatewayPool object. To get this object, run the Get-VBRCloudGatewayPool cmdlet.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[VBRCloudGatewayPool]`|true    |named   |True (ByValue)|

#### **Description**
Specifies the description that you want to add to the existing cloud gateway pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add all available gateways to cloud gateway pools without warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name that you want to assign to the existing cloud gateway pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudGatewayPool

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudGatewayPool [-CloudGateway <VBRCloudGateway[]>] -CloudGatewayPool <VBRCloudGatewayPool> [-Description <String>] [-Force] [-Name <String>] [<CommonParameters>]
```
