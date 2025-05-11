Get-NcNvmeSubsystemHost
-----------------------

### Synopsis
Iterate over a list of NVMe subsystem hosts objects.

---

### Description

Iterate over a list of NVMe subsystem hosts objects.

---

### Examples
> Example 1

```PowerShell
Get-NcNvmeSubsystemHost
Iterate over a list of NVMe subsystem hosts objects.

HostNqn               : nqn.2014-08.org.nvmexpress:nvmf:uuid:6cfd4ef9-72f0-4ed1-9e96-45557d28462aaf
IoQueueCount          : 4
IoQueueDepth          : 32
NcController          : 10.236.44.127
Subsystem             : subsys1
SubsystemUuid         : 683c58c7-971e-11e8-a570-005056acdb28
Vserver               : vinoths_vs_nvme
VserverUuid           : e671810e-9717-11e8-a570-005056acdb28
IoQueueCountSpecified : True
IoQueueDepthSpecified : True

HostNqn               : nqn.2014-08.org.nvmexpress:nvmf:uuid:6cfd4ef9-72f0-4ed1-9e96-45557d28462f
IoQueueCount          : 4
IoQueueDepth          : 32
NcController          : 10.236.44.127
Subsystem             : subsys1
SubsystemUuid         : 683c58c7-971e-11e8-a570-005056acdb28
Vserver               : vinoths_vs_nvme
VserverUuid           : e671810e-9717-11e8-a570-005056acdb28
IoQueueCountSpecified : True
IoQueueDepthSpecified : True

HostNqn               : nqn.2014-08.org.nvmexpress:nvmf:uuid:6cfd4ef9-72f0-4ed1-9e96-45557d28462ff
IoQueueCount          : 4
IoQueueDepth          : 32
NcController          : 10.236.44.127
Subsystem             : subsys1
SubsystemUuid         : 683c58c7-971e-11e8-a570-005056acdb28
Vserver               : vinoths_vs_nvme
VserverUuid           : e671810e-9717-11e8-a570-005056acdb28
IoQueueCountSpecified : True
IoQueueDepthSpecified : True

HostNqn               : nqn.2014-08.org.nvmexpress:nvmf:uuid:6cfd4ef9-72f0-4ed1-9e96-45557d28462fft
IoQueueCount          : 4
IoQueueDepth          : 32
NcController          : 10.236.44.127
Subsystem             : subsys1
SubsystemUuid         : 683c58c7-971e-11e8-a570-005056acdb28
Vserver               : vinoths_vs_nvme
VserverUuid           : e671810e-9717-11e8-a570-005056acdb28
IoQueueCountSpecified : True
IoQueueDepthSpecified : True

```

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

#### **HostNqn**
Host NQN

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[NvmeTargetSubsystemHostInfo]`|false   |named   |false        |

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
Specify to get an empty NvmeTargetSubsystemHostInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NvmeTargetSubsystemHostInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNvmeSubsystemHost -Template" to get the initially empty NvmeTargetSubsystemHostInfo object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[NvmeTargetSubsystemHostInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nvme.NvmeTargetSubsystemHostInfo

---

### Notes
Category: nvme
API: nvme-subsystem-host-get-iter
Family: ontap-cluster,ontap-vserver

---

### Syntax
```PowerShell
Get-NcNvmeSubsystemHost [[-Vserver] <String[]>] [[-Subsystem] <String[]>] [[-HostNqn] <String[]>] [-Attributes <NvmeTargetSubsystemHostInfo>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeSubsystemHost -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeSubsystemHost -Query <NvmeTargetSubsystemHostInfo> [-Attributes <NvmeTargetSubsystemHostInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
