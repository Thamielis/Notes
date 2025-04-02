Add-VBRNetworkTrafficRule
-------------------------

### Synopsis
Creates network traffic rules.

---

### Description

This cmdlet creates network traffic rules. With network traffic rules, you can limit the traffic throughput between components in the backup infrastructure.

---

### Examples
> Creating Network Traffic Rule

```PowerShell
Add-VBRNetworkTrafficRule -Name "New rule" -SourceIPStart 192.168.0.1 -SourceIPEnd 192.168.0.255 -TargetIPStart 192.168.0.1 -TargetIPEnd 192.168.0.255 -EnableThrottling -ThrottlingValue 5 -ThrottlingUnit MbitPerSec
This command creates a network traffic rule.
```

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
Specifies a name that you want to assign to a network traffic rule.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **SourceIPEnd**
Specifies the last IP address of the IP source range.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|true    |named   |False        |

#### **SourceIPStart**
Specifies the first IP address of the IP source range.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|true    |named   |False        |

#### **TargetIPEnd**
Specifies the last IP address of the IP target range.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|true    |named   |False        |

#### **TargetIPStart**
Specifies the first IP address of the IP target range.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|true    |named   |False        |

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
Specifies the time interval during which Veeam Backup & Replication must apply a network traffic rule.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

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
Add-VBRNetworkTrafficRule [-EnableEncryption] [-EnableThrottling] [-EnableThrottlingWindow] -Name <String> -SourceIPEnd <IPAddress> -SourceIPStart <IPAddress> -TargetIPEnd <IPAddress> -TargetIPStart <IPAddress> 
```
```PowerShell
[-ThrottlingUnit {MbitPerSec | MbytePerSec | KbytePerSec}] [-ThrottlingValue <Int32>] [-ThrottlingWindowOptions <VBRBackupWindowOptions>] [<CommonParameters>]
```
