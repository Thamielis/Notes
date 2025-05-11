New-VBRViReplicaReIpRule
------------------------

### Synopsis
Creates a new VMware replica re-IP rule.

---

### Description

This cmdlet creates a VBRViReplicaReIpRule object containing a list of rules for different IP addressing scheme.
Use this object to set re-IP rules for replication jobs.

---

### Examples
> Example 1

```PowerShell
$reiprule = New-VBRViReplicaReIpRule -SourceIp 172.16.*.* -SourceMask 255.255.0.0 -TargetIp 172.17.*.* -TargetMask 255.255.0.0 -TargetGateway 172.17.0.1
This command generates a new re-IP rule. Save it to the $reiprule variable for future needs.
```

---

### Parameters
#### **Description**
Specifies the description of the re-IP rule.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DNS**
Specifies the DNS server address.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **SourceIp**
Specifies the IP address or the IP addressing scheme of the network in which the source VM is located.
You can use the asterisk character (*) to specify a range of IP addresses.
Default: 172.16. . .

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SourceMask**
Specifies the mask of the network in which the source VM is located.
You can use the asterisk character (*) to specify a range of IP addresses.
Default: 255.255.0.0.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetGateway**
Specifies the gateway address of the network in which the replica VM will be located.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **TargetIp**
Specifies the IP address or the IP addressing scheme of the network in which the replica VM will be located.
You can use the asterisk character (*) to specify a range of IP addresses.
Default: 172.17. . .

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetMask**
Specifies the mask of the network in which the replica VM will be located.
You can use the asterisk character (*) to specify a range of IP addresses.
Accepts string type.
Default: 255.255.0.0.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **WINS**
Specifies the WINS server address.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
New-VBRViReplicaReIpRule [-Description <String>] [-DNS <String[]>] [-SourceIp <String>] [-SourceMask <String>] -TargetGateway <String> [-TargetIp <String>] [-TargetMask <String>] [-WINS <String[]>] 
```
```PowerShell
[<CommonParameters>]
```
