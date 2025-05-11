New-VBRHvProductionNetworkOptions
---------------------------------

### Synopsis
Defines production networks options for Hyper-V virtual lab.

---

### Description

This cmdlet creates the VBRHvProductionNetworkOptions object that defines network options for Hyper-V production networks.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRHvServerNetworkInfo](Get-VBRHvServerNetworkInfo)

---

### Examples
> Defining Production Networks Options

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRHvServerNetworkInfo -Server $server
New-VBRHvProductionNetworkOptions -ProductionNetwork $network[3] -UseProductionNetworkVLANID -ProductionNetworkVLANID "2"
This example shows how to define network mapping rules of isolated networks.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRHvProductionNetworkOptions cmdlet. Specify the following settings:
- Set the $network[3] variable as the ProductionNetwork parameter value.
The Get-VBRHvServerNetworkInfo cmdlet will return an array of production networks. Mind the ordinal number of the necessary production network (An array starts with 0. In our example, it is the fourth production network in the array).
- Provide the UseProductionNetworkVLANID parameter.
- Specify the ProductionNetworkVLANID parameter value.

---

### Parameters
#### **ProductionNetwork**
Specifies a production network with original VMs.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRHvServerNetworkInfo]`|true    |named   |False        |

#### **ProductionNetworkVLANID**
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
New-VBRHvProductionNetworkOptions -ProductionNetwork <VBRHvServerNetworkInfo> [-ProductionNetworkVLANID <Int32>] [-UseProductionNetworkVLANID] [<CommonParameters>]
```
