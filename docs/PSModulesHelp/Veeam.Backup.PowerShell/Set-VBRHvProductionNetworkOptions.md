Set-VBRHvProductionNetworkOptions
---------------------------------

### Synopsis
Modifies production network options for Hyper-V virtual lab.

---

### Description

This cmdlet modifies production network options for Hyper-V virtual lab.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRHvServerNetworkInfo](Get-VBRHvServerNetworkInfo)

* [New-VBRHvProductionNetworkOptions](New-VBRHvProductionNetworkOptions)

---

### Examples
> Modifying Production Network Options

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRHvServerNetworkInfo -Server $server
$prod = New-VBRHvProductionNetworkOptions -ProductionNetwork $network[3] -UseProductionNetworkVLANID -ProductionNetworkVLANID "2"
Set-VBRHvProductionNetworkOptions -ProductionNetworkOptions $prod ProductionNetworkVLANID "3"
This example shows how to modify production network options.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRHvProductionNetworkOptions cmdlet. Specify the ProductionNetwork, UseProductionNetworkVLANID and ProductionNetworkVLANID parameter values. Save the result to the $prod variable.
4. Run the Set-VBRHvProductionNetworkOptions cmdlet. Set the $prod variable as the ProductionNetworkOptions parameter value. Specify the ProductionNetworkVLANID parameter value.

---

### Parameters
#### **ProductionNetwork**
Specifies a production network with original VMs. The cmdlet will map VMs from this network to VMs from the isolated network.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRHvServerNetworkInfo]`|false   |named   |False        |

#### **ProductionNetworkOptions**
Specifies options of a production network. The cmdlet will modify settings of this network.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRHvProductionNetworkOptions]`|true    |named   |False        |

#### **ProductionNetworkVLanID**
Specifies an ID of a production network. The cmdlet will create the production network with the specified ID.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **UseProductionNetworkVLANID**
Defines that the cmdlet will enable a production network VLANID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRHvProductionNetworkOptions [-ProductionNetwork <VBRHvServerNetworkInfo>] -ProductionNetworkOptions <VBRHvProductionNetworkOptions> [-ProductionNetworkVLanID <Int32>] [-UseProductionNetworkVLANID] 
```
```PowerShell
[<CommonParameters>]
```
