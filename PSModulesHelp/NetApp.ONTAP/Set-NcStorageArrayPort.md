Set-NcStorageArrayPort
----------------------

### Synopsis
Update an array port with new or changed information.

---

### Description

Update an array port with new or changed information.

---

### Related Links
* [Get-NcStorageArrayPort](Get-NcStorageArrayPort)

---

### Examples
> Example 1

```PowerShell
Set-NcStorageArrayPort -ArrayName VMware_Virtualdisk_1 -Wwnn 5000c29f8596cb38 -Wwpn 5000c29f8596cb3b -MaxQueueDepth 20
Modify the Max Queue Depth of one port

ArrayId                : 8526527150424195152
ArrayName              : VMware_Virtualdisk_1
ConnectionType         : fabric
MaxQueueDepth          : 20
NcController           : 10.238.48.40
PortStatInfo           : {DataONTAP.C.Types.StorageArray.StorageArrayPortStats}
SwitchPort             : N/A
TargetPortSpeed        : 4
UtilizationPolicy      : normal
Wwnn                   : 5000c29f8596cb38
Wwpn                   : 5000c29f8596cb3b
MaxQueueDepthSpecified : True

```

---

### Parameters
#### **ArrayName**
The name of the array profile to update.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **Wwnn**
World wide node name of array's target port (64 chars).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Wwpn**
World wide port name of array's target port (64 chars).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **MaxQueueDepth**
The target port queue depth for this target port.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **UtilizationPolicy**
The policy used while sending I/O to an array target port when it *

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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

#### **TargetIqn**
Target IQN.
This parameter is available in ONTAP 9.3 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Tpgt**
TPGT
This parameter is available in ONTAP 9.3 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageArray.StorageArrayPort

---

### Notes
Category: storage array
API: storage-array-port-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcStorageArrayPort [-ArrayName] <String> [-Wwnn] <String> [-Wwpn] <String> [-MaxQueueDepth <Int64>] [-UtilizationPolicy <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcStorageArrayPort [-ArrayName] <String> [-MaxQueueDepth <Int64>] [-UtilizationPolicy <String>] [-TargetIqn] <String> [-Tpgt] <String> [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
