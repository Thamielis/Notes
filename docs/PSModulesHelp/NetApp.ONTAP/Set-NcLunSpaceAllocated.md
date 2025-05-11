Set-NcLunSpaceAllocated
-----------------------

### Synopsis
Sets the space allocation settings for the named LUN.

---

### Description

Sets the space allocation settings for the named LUN.

This parameter determines how Data ONTAP behaves when an out-of-space condition occurs during a write to a thin-provisioned (i.e. non-space-reserved) LUN.

WAFL can return either a "soft ENOSPC" (it's trying to reclaim space) or a "hard ENOSPC" (there is no space left).

With space allocation disabled, the target returns BUSY to initiators on a soft ENOSPC and offlines the LUN on a hard ENOSPC.

With space allocation enabled, the target uses the T10 standard thin provisioning sense codes and keeps the LUN online even with a hard ENOSPC.

---

### Related Links
* [Get-NcLun](Get-NcLun)

* [Set-NcLunSpaceReserved](Set-NcLunSpaceReserved)

---

### Examples
> Example 1

Set-NcLunSpaceAllocated /vol/testvol/exchangeLun
Enable space allocation on LUN 'exchangeLun'.

Path                        Size Protocol Online Mapped Thin Vserver  Comment
----                        ---- -------- ------ ------ ---- -------  -------
/vol/testvol/exchangeLun 20.0 GB hyper_v  False   True  True costea01

---

### Parameters
#### **Path**
Path of the LUN.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Off**
Specify -Off to disable space allocation for this LUN.  Without this parameter, space allocation is enabled for this LUN.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Category: lun
API: lun-set-space-alloc
Family: vserver

---

### Syntax
```PowerShell
Set-NcLunSpaceAllocated [-Path] <String> [-Off] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
