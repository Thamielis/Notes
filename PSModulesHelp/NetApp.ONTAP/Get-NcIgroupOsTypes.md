Get-NcIgroupOsTypes
-------------------

### Synopsis
Displays the supported values and descriptions for initiator-group-os-type.

---

### Description

Displays the supported values and descriptions for initiator-group-os-type.

---

### Related Links
* [Get-NcLunOsTypes](Get-NcLunOsTypes)

* [Get-NcIgroup](Get-NcIgroup)

* [New-NcIgroup](New-NcIgroup)

---

### Examples
> Example 1

Get-NcIgroupOsTypes
Get all supported values and descriptions for initiator-group-os-type.

Value                Description
-----                -----------
aix                  The initiators belong to an AIX host.
hpux                 The initiators belong to an HP-UX host.
hyper_v              The initiators belong to a Hyper-V parent host.
linux                The initiators belong to a Linux host.
netware              The initiators belong to a NetWare host.
openvms              The initiators belong to an OpenVMS host.
solaris              The initiators belong to a Solaris host.
vmware               The initiators belong to a VMware ESX host.
windows              The initiators belong to a Windows host.
xen                  The initiators belong to a Xen hypervisor host.

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
Category: igroup
API: igroup-os-type-list
Family: cluster

---

### Syntax
```PowerShell
Get-NcIgroupOsTypes [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
