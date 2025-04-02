Set-NcNvmeNamespace
-------------------

### Synopsis
Modify the attributes of NVMe target namespace object.

---

### Description

Modify the attributes of NVMe target namespace object.

---

### Examples
> Example 1

```PowerShell
Set-NcNvmeNamespace -Comment "a" -Path /vol/vinoths_vol1/vinoths_ns1 -VserverContext vinoths_vs_nvme
Modify the attributes Comment of NVMe target namespace object in the vserver vinoths_vs_name.

Anagrpid                     :
BlockSize                    : 4096
Comment                      : a
CreationTimestamp            : 1533500027
IsReadOnly                   : False
NcController                 : 10.236.44.127
Node                         : sti31-vsim-ucs476e
Nsid                         :
Ostype                       : linux
Path                         : /vol/vinoths_vol1/vinoths_ns1
Qtree                        :
RestoreInaccessible          : False
Size                         : 1073741824
SizeUsed                     : 0
State                        : online
Subsystem                    :
Uuid                         : 25bc1655-89d4-4e2a-b7f9-1842578fdb6e
Volume                       : vinoths_vol1
Vserver                      : vinoths_vs_nvme
VserverUuid                  : e671810e-9717-11e8-a570-005056acdb28
AnagrpidSpecified            : False
IsReadOnlySpecified          : True
NsidSpecified                : False
RestoreInaccessibleSpecified : True

```

---

### Parameters
#### **Comment**
Comment

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Path**
Namespace Path

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Size**
SpaceSize. This parameter is supported with Rest only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **AutoDelete.**
AutoDelete. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Clone**
Specifies clone. To create object use New-Object DataONTAP.C.Types.Nvme.Clone. This parameter is supported with Rest only.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nvme.Clone]`|false   |named   |false        |

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
* DataONTAP.C.Types.Nvme.NvmeNamespaceInfo

---

### Notes
Category: nvme
API: nvme-namespace-modify
Family: ontap-vserver

---

### Syntax
```PowerShell
Set-NcNvmeNamespace [-Comment] <String> [-Path] <String> [-VserverContext <String>] [-Size <Int64>] [-AutoDelete. <Boolean>] [-Clone <DataONTAP.C.Types.Nvme.Clone>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
