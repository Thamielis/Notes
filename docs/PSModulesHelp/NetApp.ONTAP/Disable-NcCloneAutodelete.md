Disable-NcCloneAutodelete
-------------------------

### Synopsis
Disable autodelete on a LUN clone.

---

### Description

Disable autodelete on a LUN clone.

---

### Related Links
* [Enable-NcCloneAutodelete](Enable-NcCloneAutodelete)

---

### Examples
> Example 1

Disable-NcCloneAutodelete -Path /vol/luns/disk0_clone
Disable LUN clone autodelete for the given LUN.

Protocol                           : windows_2008
Thin                               : True
Alignment                          : indeterminate
BackingSnapshot                    :
BlockSize                          : 512
Class                              : regular
CloneBackingSnapshot               :
Comment                            :
CreationTimestamp                  : 1372277329
CreationTimestampDT                : 6/26/2013 4:08:49 PM
DeviceBinaryId                     :
DeviceId                           :
DeviceTextId                       :
IsClone                            : True
IsCloneAutodeleteEnabled           : False
IsRestoreInaccessible              : False
IsSpaceAllocEnabled                : False
IsSpaceReservationEnabled          : False
Mapped                             : False
MultiprotocolType                  : windows_2008
NcController                       : 10.63.165.62
Online                             : True
Path                               : /vol/luns/disk0_clone
PrefixSize                         : 0
QosPolicyGroup                     :
Qtree                              :
ReadOnly                           : False
SerialNumber                       : -gfsd+C1CiEh
ShareState                         : none
Size                               : 107389255680
SizeUsed                           : 717078528
Staging                            : False
SuffixSize                         : 0
Uuid                               : 8195496b-1450-412c-a6af-53552d57c0fb
Volume                             : luns
Vserver                            : beam01

---

### Parameters
#### **Path**
Path of the LUN inside the volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
Category: clone
API: clone-autodelete
Family: vserver

---

### Syntax
```PowerShell
Disable-NcCloneAutodelete [-Path] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
