Get-NcLunOsTypes
----------------

### Synopsis
Displays the supported values and descriptions for lun-os-type.

---

### Description

Displays the supported values and descriptions for lun-os-type.

---

### Related Links
* [Get-NcLun](Get-NcLun)

* [Get-NcIgroupOsTypes](Get-NcIgroupOsTypes)

---

### Examples
> Example 1

Get-NcLunOsTypes
Supported OS Types

Value                Description
-----                -----------
aix                  The LUN will be used to store an AIX filesystem.
hpux                 The LUN will be used to store an HP-UX filesystem.
hyper_v              The LUN will be used to store Hyper-V VHDs (Virtual Hard Disks).
linux                The LUN will be used to store a Linux filesystem with no partition table.
netware              The LUN will be used to store a Netware filesystem.
openvms              The LUN will be used to store an OpenVMS filesystem.
solaris              The LUN will be used to store a Solaris filesystem in a single slice partition.
solaris_efi          The LUN will be used to store a Solaris filesystem with an EFI partition table.
vmware               The LUN will be used to store a VMware Virtual Machine File System (VMFS) containing Virtual Ma...
windows              The LUN will be used to store a Windows filesystem with a Master Boot Record (MBR) partition ta...
windows_2008         The LUN will be used to store a Windows filesystem with a Master Boot Record (MBR) partition ta...
windows_gpt          The LUN will be used to store a Windows filesystem with a GUID Partition Table (GPT).
xen                  The LUN will be used to provide storage for XenServer.

---

### Parameters
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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.SystemApiEnumValueInfo

---

### Notes
Category: Lun
API: lun-os-type-list
Family: cluster

---

### Syntax
```PowerShell
Get-NcLunOsTypes [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
