New-NcNvmeNamespace
-------------------

### Synopsis
Create a new NVMe target namespace.

---

### Description

Create a new NVMe target namespace.

---

### Examples
> Example 1

```PowerShell
New-NcNvmeNamespace -Comment "" -Ostype linux -Path /vol/vinoths_vol1/vinoths_ns1 -Size 1GB -VserverContext vinoths_vs_nvme
Creates a new nvme Target namespace of ostype linux at /vol/vinoths_vol1/vinoths_ns1 of size 1 GB in the vserver vinoths_vs_nvme
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
  <li> "vmware"    - The namespace contains VMware file system
  data,
  <li> "hyper_v"   - The namespace contains Windows Hyper-V file
  system data,
  <li> "windows"   - The namespace contains Windows file system
  data,
  <li> "linux"     - The namespace contains Linux file system
  data,
  <li> "xen"       - The namespace contains Xen file system data
</ul>

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Path**
Namespace Path

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Size**
Size

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |3       |true (ByPropertyName)|

#### **AutoDelete. This parameter is supported with Rest only.**
AutoDelete

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Clone**
Specifies clone. To create object use New-Object DataONTAP.C.Types.Nvme.Clone. This parameter is supported with Rest only.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nvme.Clone]`|false   |named   |false        |

#### **Qtree**
Qtree. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Volume**
Volume. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LocationNameSpace**
LocationNameSpace. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Convert**
Specifies convert . To create object use New-Object DataONTAP.C.Types.Nvme.Convert. This parameter is supported with Rest only.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nvme.Convert]`|false   |named   |false        |

#### **BlockSize**

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nvme.NvmeNamespaceInfo

---

### Notes
Category: nvme
API: nvme-namespace-create
Family: ontap-vserver

---

### Syntax
```PowerShell
New-NcNvmeNamespace [-Comment <String>] [-Ostype] <String> [-Path] <String> [-Size] <Int64> [-AutoDelete <Boolean>] [-Clone <DataONTAP.C.Types.Nvme.Clone>] [-Qtree <String>] [-Volume 
```
```PowerShell
<String>] [-LocationNameSpace <String>] [-Convert <DataONTAP.C.Types.Nvme.Convert>] [-BlockSize <Int32>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
