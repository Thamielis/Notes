New-VBRFailoverPlanPublicIPRule
-------------------------------

### Synopsis
Creates a rule for mapping public IP and ports to the internal IP and ports of the cloud replica VM.

---

### Description

This cmdlet creates a VBRFailoverPlanPublicIPRule object. This object contains a rule for mapping public IP and ports to the internal IP and ports of the cloud replica VM.  Public IP address is selected from the public IP address pool.  Server provider assigns the public IP address pool in tenant's hardware plan. The object is used then in the New-VBRCloudFailoverPlanObject cmdlet.

---

### Examples
> Example - Creating Public IP Rule

```PowerShell
New-VBRFailoverPlanPublicIPRule -SourceIp "45.0.0.2" -SourcePort 8888 -TargetIp "172.16.2.232" -TargetPort 3389 -Description "Public IP for srv03"
This command defines settings of a new public IP rule.
```

---

### Parameters
#### **Description**
The description of the rule.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SourceIp**
Specifies the public IP address you want to set for the replica VM.  Select the public IP address from the IP address pool assigned by service provider in the hardware plan.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **SourcePort**
Specifies the port you want to set for the replica VM.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **TargetIp**
The original internal IP address of the replica VM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **TargetPort**
The internal port of the replica VM. The 22 port is reserved and cannot be used.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

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
New-VBRFailoverPlanPublicIPRule [-Description <String>] -SourceIp <String> -SourcePort <Int32> -TargetIp <String> -TargetPort <Int32> [<CommonParameters>]
```
