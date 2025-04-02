Set-NcSecurityProtocolSsh
-------------------------

### Synopsis
Modifies the security protocol ssh configuration.

---

### Description

Modifies the security protocol ssh configuration.

---

### Examples
> Example 1

```PowerShell
Set-NcSecurityProtocolSsh -ConnectionsPerSecond 10 -MaxInstances 64 -PerSourceLimit 32
Modifies the security protocol ssh configuration.

ConnectionsPerSecond          : 10
MaxInstances                  : 64
NcController                  : 10.140.111.42
PerSourceLimit                : 32
ConnectionsPerSecondSpecified : True
MaxInstancesSpecified         : True
PerSourceLimitSpecified       : True

```

---

### Parameters
#### **ConnectionsPerSecond**
Connections Per Second

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |1       |true (ByPropertyName)|

#### **MaxInstances**
Maximum Number of Instances

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |2       |true (ByPropertyName)|

#### **PerSourceLimit**
Per-Source Limit

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |3       |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityProtocolSshInfo

---

### Notes
Category: security
API: security-protocol-ssh-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcSecurityProtocolSsh [-ConnectionsPerSecond] <Int32> [-MaxInstances] <Int32> [-PerSourceLimit] <Int32> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
