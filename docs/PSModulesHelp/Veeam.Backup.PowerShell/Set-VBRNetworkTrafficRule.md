Set-VBRNetworkTrafficRule
-------------------------

### Synopsis
Modifies network traffic rules.

---

### Description

This cmdlet modifies network traffic rules.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRNetworkTrafficRule](Get-VBRNetworkTrafficRule)

---

### Examples
> Enabling Encyption for Network Traffic Rule

$rule = Get-VBRNetworkTrafficRule -Name "New rule"
Set-VBRNetworkTrafficRule -Rule $rule -EnableEncryption
This example shows how to enable encryption for a network traffic rule.
Perform the following steps:
1. Run the Get-VBRNetworkTrafficRule cmdlet. Specify the Name parameter value. Save the result to the $rule variable.
2. Run the Set-VBRNetworkTrafficRule cmdlet. Set the $rule variable as the Rule parameter value. Provide the EnableEncryption parameter.

---

### Parameters
#### **EnableEncryption**
Enables encryption for a network traffic rule. Veeam Backup & Replication will encrypt the data that is passed between backup infrastructure components on the source and target side.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableThrottling**
Enables throttling for a network traffic rule. Veeam Backup & Replication will limit the traffic throughput between the backup infrastructure components within the specified IP range.
Use the following parameters to set the maximum value:
* ThrottlingValue
* ThrottlingUnit

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableThrottlingWindow**
Enables the schedule for a network traffic rule.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a that you want to assign to a network traffic rule.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Rule**
Specifies a network traffic rule that you want to modify.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRNetworkTrafficRule]`|true    |named   |True (ByValue)|

#### **SourceIPEnd**
Specifies the last IP address of the IP source range.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **SourceIPStart**
Specifies the first IP address of the IP source range.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **TargetIPEnd**
Specifies the last IP address of the IP target range.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **TargetIPStart**
Specifies the first IP address of the IP target range

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **ThrottlingUnit**
For the EnableThrottling parameter.
Specifies the measuring unit for the ThrottlingValue parameter: You can set the following units:
* MbitPerSec
* MbytePerSec
* KbytePerSec
Default: MbitPerSec.
Valid Values:

* MbitPerSec
* MbytePerSec
* KbytePerSec

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRSpeedUnit]`|false   |named   |False        |

#### **ThrottlingValue**
Specifies the maximum speed value that must be used to transfer VM machine data from source to target.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ThrottlingWindowOptions**
Specifies the time intervals during which Veeam Backup & Replication must apply a network traffic rule.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNetworkTrafficRule

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNetworkTrafficRule [-EnableEncryption] [-EnableThrottling] [-EnableThrottlingWindow] [-Name <String>] -Rule <VBRNetworkTrafficRule> [-SourceIPEnd <IPAddress>] [-SourceIPStart <IPAddress>] [-TargetIPEnd 
```
```PowerShell
<IPAddress>] [-TargetIPStart <IPAddress>] [-ThrottlingUnit {MbitPerSec | MbytePerSec | KbytePerSec}] [-ThrottlingValue <Int32>] [-ThrottlingWindowOptions <VBRBackupWindowOptions>] [<CommonParameters>]
```
