Get-NcNvmeSubsystem
-------------------

### Synopsis
Iterate over a list of NVMe target subsystem objects.

---

### Description

Iterate over a list of NVMe target subsystem objects.

---

### Examples
> Example 1

```PowerShell
Get-NcNvmeSubsystem -Vserver vinoths_vs_nvme
Iterate over a list of NVMe target subsystem objects of the vserver vinoths_vs_nvme

Comment                      :
DefaultIoQueueCount          : 4
DefaultIoQueueDepth          : 32
NcController                 : 10.236.44.127
Ostype                       : linux
SerialNumber                 : wqU6jFM-7004AAAAAAAB
Subsystem                    : subsys1
TargetNqn                    : nqn.1992-08.com.netapp:sn.e671810e971711e8a570005056acdb28:subsystem.subsys1
Uuid                         : 683c58c7-971e-11e8-a570-005056acdb28
Vserver                      : vinoths_vs_nvme
VserverUuid                  : e671810e-9717-11e8-a570-005056acdb28
DefaultIoQueueCountSpecified : True
DefaultIoQueueDepthSpecified : True

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

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[NvmeSubsystemInfo]`|false   |named   |false        |

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
Specify to get an empty NvmeSubsystemInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NvmeSubsystemInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNvmeSubsystem -Template" to get the initially empty NvmeSubsystemInfo object.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[NvmeSubsystemInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nvme.NvmeSubsystemInfo

---

### Notes
Category: nvme
API: nvme-subsystem-get-iter
Family: ontap-cluster,ontap-vserver

---

### Syntax
```PowerShell
Get-NcNvmeSubsystem [[-Vserver] <String[]>] [[-Subsystem] <String[]>] [-Attributes <NvmeSubsystemInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeSubsystem -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeSubsystem -Query <NvmeSubsystemInfo> [-Attributes <NvmeSubsystemInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
