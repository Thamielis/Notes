Get-NcNvmeSubsystemController
-----------------------------

### Synopsis
Iterate over a list of NVMe subsystem controllers objects.

---

### Description

Iterate over a list of NVMe subsystem controllers objects.

---

### Examples
> Example 1

Get-NcNvmeSubsystemController
Iterate over a list of NVMe subsystem controllers objects.

AdminQueueDepth           : 55
ControllerId              : 33726
HostNqn                   : nqn.1992-01.com.example:simulatedhost1
InitiatorTransportAddress : nn-0x2000005056b4aaaa:pn-0x2001005056b4aaaa
IoQueueCount              : 8
IoQueueDepth              : {32, 32, 64, 32...}
Lif                       :
LifUuid                   : 00000000-0000-0000-544f-a98cffffffff
NcController              : 10.236.44.127
Node                      : sti31-vsim-ucs476e
QueueDepth                :
Subsystem                 : subsys1
SubsystemUuid             : 683c58c7-971e-11e8-a570-005056acdb28
TransportProtocol         : fc_nvme
Vserver                   : vinoths_vs_nvme
VserverUuid               : e671810e-9717-11e8-a570-005056acdb28
AdminQueueDepthSpecified  : True
ControllerIdSpecified     : True
IoQueueCountSpecified     : True
IoQueueDepthSpecified     : True
QueueDepthSpecified       : False

AdminQueueDepth           : 57424
ControllerId              : 33727
HostNqn                   : nqn.1992-01.com.example:simulatedhost2
InitiatorTransportAddress : nn-0x2000005056b4bbbb:pn-0x2001005056b4bbbb
IoQueueCount              : 4
IoQueueDepth              : {32, 32, 64, 32}
Lif                       :
LifUuid                   : 00000000-0000-0000-544f-a98cffffffff
NcController              : 10.236.44.127
Node                      : sti31-vsim-ucs476e
QueueDepth                :
Subsystem                 : subsys1
SubsystemUuid             : 683c58c7-971e-11e8-a570-005056acdb28
TransportProtocol         : fc_nvme
Vserver                   : vinoths_vs_nvme
VserverUuid               : e671810e-9717-11e8-a570-005056acdb28
AdminQueueDepthSpecified  : True
ControllerIdSpecified     : True
IoQueueCountSpecified     : True
IoQueueDepthSpecified     : True
QueueDepthSpecified       : False

AdminQueueDepth           : 8
ControllerId              : 33728
HostNqn                   : nqn.1992-01.com.example:simulatedhost3
InitiatorTransportAddress : nn-0x2000005056b4cccc:pn-0x2001005056b4cccc
IoQueueCount              : 8
IoQueueDepth              : {32, 32, 64, 32...}
Lif                       :
LifUuid                   : 00000000-0000-0000-544f-a98cffffffff
NcController              : 10.236.44.127
Node                      : sti31-vsim-ucs476e
QueueDepth                :
Subsystem                 : subsys1
SubsystemUuid             : 683c58c7-971e-11e8-a570-005056acdb28
TransportProtocol         : fc_nvme
Vserver                   : vinoths_vs_nvme
VserverUuid               : e671810e-9717-11e8-a570-005056acdb28
AdminQueueDepthSpecified  : True
ControllerIdSpecified     : True
IoQueueCountSpecified     : True
IoQueueDepthSpecified     : True
QueueDepthSpecified       : False

AdminQueueDepth           : 256
ControllerId              : 33729
HostNqn                   : nqn.1992-01.com.example:simulatedhost4
InitiatorTransportAddress : nn-0x2000005056b4dddd:pn-0x2001005056b4dddd
IoQueueCount              : 6
IoQueueDepth              : {64, 1, 64, 64...}
Lif                       :
LifUuid                   : 1eb01ac0-f802-ffff-18e0-9f9affffffff
NcController              : 10.236.44.127
Node                      : sti31-vsim-ucs476e
QueueDepth                :
Subsystem                 : subsys1
SubsystemUuid             : 683c58c7-971e-11e8-a570-005056acdb28
TransportProtocol         : fc_nvme
Vserver                   : vinoths_vs_nvme
VserverUuid               : e671810e-9717-11e8-a570-005056acdb28
AdminQueueDepthSpecified  : True
ControllerIdSpecified     : True
IoQueueCountSpecified     : True
IoQueueDepthSpecified     : True
QueueDepthSpecified       : False

AdminQueueDepth           : 256
ControllerId              : 33730
HostNqn                   : nqn.1992-01.com.example:simulatedhost5
InitiatorTransportAddress : nn-0x2000005056b4eeee:pn-0x2001005056b4eeee
IoQueueCount              : 5
IoQueueDepth              : {64, 1, 64, 64...}
Lif                       :
LifUuid                   : 1eb01ac0-f802-ffff-18e0-9f9affffffff
NcController              : 10.236.44.127
Node                      : sti31-vsim-ucs476e
QueueDepth                :
Subsystem                 : subsys1
SubsystemUuid             : 683c58c7-971e-11e8-a570-005056acdb28
TransportProtocol         : fc_nvme
Vserver                   : vinoths_vs_nvme
VserverUuid               : e671810e-9717-11e8-a570-005056acdb28
AdminQueueDepthSpecified  : True
ControllerIdSpecified     : True
IoQueueCountSpecified     : True
IoQueueDepthSpecified     : True
QueueDepthSpecified       : False

---

### Parameters
#### **Vserver**
Vserver Name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Subsystem**
Subsystem

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **ControllerId**
Controller ID

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[NvmeTargetSubsystemControllerInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **Template**
Specify to get an empty NvmeTargetSubsystemControllerInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NvmeTargetSubsystemControllerInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNvmeSubsystemController -Template" to get the initially empty NvmeTargetSubsystemControllerInfo object.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[NvmeTargetSubsystemControllerInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nvme.NvmeTargetSubsystemControllerInfo

---

### Notes
Category: nvme
API: nvme-subsystem-controller-get-iter
Family: ontap-cluster,ontap-vserver

---

### Syntax
```PowerShell
Get-NcNvmeSubsystemController [[-Vserver] <String[]>] [[-Subsystem] <String[]>] [[-ControllerId] <Int32>] [-Attributes <NvmeTargetSubsystemControllerInfo>] [-VserverContext <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeSubsystemController -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeSubsystemController -Query <NvmeTargetSubsystemControllerInfo> [-Attributes <NvmeTargetSubsystemControllerInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
