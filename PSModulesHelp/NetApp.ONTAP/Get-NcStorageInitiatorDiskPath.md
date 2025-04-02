Get-NcStorageInitiatorDiskPath
------------------------------

### Synopsis
Get path information and statistics for a given disk or all disks.

---

### Description

Get path information and statistics for a given disk or all disks. The disk can refer to an array lun, real disk, or Solid State Device.

---

### Examples
> Example 1

```PowerShell
Get-NcStorageInitiatorDiskPath -Name v0.16
Get the specified storage initiator disk path.

Node                    : vsim_cluster-01
DiskName                : vsim_cluster-01:v0.16
NcController            : 192.168.182.144
ArrayName               : N/A
DiskPort                :
DiskPortName            :
DiskUid                 : 4E455441:50502020:56442D31:3030304D:422D465A:2D353230:31393038:32353030:00000000:00000000
InitiatorIoKbps         : 0
InitiatorIops           : 0
InitiatorLunInUseCount  : 0
InitiatorPort           : v0
InitiatorPortSpeed      : -
InitiatorSideSwitchPort : N/A
LunIoKbps               : 0
LunIops                 : 0
LunNumber               : 0
LunPathUseState         : RDY
PathIoKbps              : 0
PathIops                : 0
PathLinkErrors          : 0
PathLunInUseCount       : 0
PathQuality             : 0
TargetIoKbps            : 0
TargetIops              : 0
TargetLunInUseCount     : 0
TargetPortAccessState   : AO
TargetSideSwitchPort    : N/A
TargetWwpn              : 0000000000000000
Tpgn                    : 0

```

---

### Parameters
#### **Name**
The name of the disk to list path information for.  Data ONTAP wildcards are accepted.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |1       |true (ByPropertyName)|DiskName|

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageInitiator.DiskPathInfo

---

### Notes
Category: storage initiator
API: storage-initiator-disk-path-list-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageInitiatorDiskPath [[-Name] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
