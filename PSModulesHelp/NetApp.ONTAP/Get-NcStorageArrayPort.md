Get-NcStorageArrayPort
----------------------

### Synopsis
Generate a list of online array ports and their associated arrays.

---

### Description

Generate a list of online array ports and their associated arrays.

---

### Related Links
* [Set-NcStorageArrayPort](Set-NcStorageArrayPort)

---

### Examples
> Example 1

Get-NcStorageArrayPort
Get storage array ports

ArrayId                : 549772591104
ArrayName              : EMC_SYMMETRIX_1
ConnectionType         : fabric
MaxQueueDepth          :
NcController           : 10.238.48.40
PortStatInfo           : {DataONTAP.C.Types.StorageArray.StorageArrayPortStats,
                         DataONTAP.C.Types.StorageArray.StorageArrayPortStats}
SwitchPort             : switch1:6
TargetPortSpeed        : 4
UtilizationPolicy      : normal
Wwnn                   : 50060480000001a0
Wwpn                   : 50060480000001a0
MaxQueueDepthSpecified : False

ArrayId                : 8526527150424195152
ArrayName              : VMware_Virtualdisk_1
ConnectionType         : fabric
MaxQueueDepth          :
NcController           : 10.238.48.40
PortStatInfo           : {DataONTAP.C.Types.StorageArray.StorageArrayPortStats}
SwitchPort             : N/A
TargetPortSpeed        : 4
UtilizationPolicy      : normal
Wwnn                   : 5000c29fbabbef14
Wwpn                   : 5000c29fbabbef15
MaxQueueDepthSpecified : False

---

### Parameters
#### **ArrayName**
Specify to get only the named array port record.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|Name   |

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
* DataONTAP.C.Types.StorageArray.StorageArrayPort

---

### Notes
Category: storage array
API: storage-array-ports-list-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageArrayPort [-ArrayName <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
