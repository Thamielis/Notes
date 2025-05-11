New-NcNvmeSubsystem
-------------------

### Synopsis
Create a new NVMe target subsystem.

---

### Description

Create a new NVMe target subsystem.

---

### Examples
> Example 1

```PowerShell
New-NcNvmeSubsystem -Comment "" -Ostype linux -Subsystem subsys1 -VserverContext vinoths_vs_nvme
Create a new NVMe target subsystem subsys1 of ostype linux in vserver vinoths_vs_name

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
#### **Comment**
Comment

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Ostype**
OS Type
            Possible values: 
            <ul>
              <li> "windows"   - The initiators belong to a Windows host,
              <li> "linux"     - The initiators belong to a Linux host,
              <li> "vmware"    - The initiators belong to a VMware ESX host,
              <li> "xen"       - The initiators belong to a Xen hypervisor
            host,
              <li> "hyper_v"   - The initiators belong to a Hyper-V parent
            host
            </ul>

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Subsystem**
Subsystem

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **DeleteOnUnmap**
An option that causes the subsystem to be deleted when the last subsystem map associated with it is deleted. This property defaults to false when the subsystem is created. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Hosts**
The NVMe hosts configured for access to the NVMe subsystem. To create object use New-Object DataONTAP.C.Types.Nvme.Host. This parameter is supported with Rest only.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nvme.Host]`|false   |named   |false        |

#### **VendorUuids**
Vendor-specific identifiers (UUIDs) optionally assigned to an NVMe subsystem when the subsystem is created. This parameter is supported with Rest only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Nvme.NvmeSubsystemInfo

---

### Notes
Category: nvme
API: nvme-subsystem-create
Family: ontap-vserver

---

### Syntax
```PowerShell
New-NcNvmeSubsystem [-Comment <String>] [-Ostype] <String> [-Subsystem] <String> [-VserverContext <String>] [-DeleteOnUnmap <Boolean>] [-Hosts <DataONTAP.C.Types.Nvme.Host>] [-VendorUuids 
```
```PowerShell
<String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
