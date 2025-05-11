New-VBRHvInstantRecoveryNetworkMappingRule
------------------------------------------

### Synopsis
Creates a new network mapping rule.

---

### Description

This cmdlet defines the VBRHvInstantRecoveryNetworkMappingRule object. This object defines how to map networks in the original site to networks in the target site (site where VMs will be recovered). You can use this object to perform instant recovery of Veeam Agent computers.

---

### Examples
> Example 1

$network = Get-VBRComputerNetworkInfo       
New-VBRHvInstantRecoveryNetworkMappingRule -SourceNetwork $network
This example shows how to define settings for a new network mapping rule.
Perform the following steps:
1.	Run the Get-VBRComputerNetworkInfocmdlet. Save the result to the $network variable.
2.	Run the New-VBRHvInstantRecoveryNetworkMappingRule cmdlet. Set the $network variable as the SourceNetwork parameter value.

---

### Parameters
#### **SourceNetwork**
Specifies the array of networks connected to Veeam Agent computers.
Accepts the VBRComputerNetworkInfo[] object. To get this object, run the Get-VBRComputerNetworkInfo cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRComputerNetworkInfo]`|true    |named   |False        |

#### **TargetNetwork**
Specifies the array of virtual networks connected to the Hyper-V host which computers are restored to.
Accepts the VBRHvServerNetworkInfo[] object. To get this object, run the Get-VBRHvServerNetworkInfo cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRHvServerNetworkInfo]`|true    |named   |False        |

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
New-VBRHvInstantRecoveryNetworkMappingRule -SourceNetwork <VBRComputerNetworkInfo> -TargetNetwork <VBRHvServerNetworkInfo> [<CommonParameters>]
```
