Clear-NcLunPersistentReservation
--------------------------------

### Synopsis
Clear the SCSI-2 reservation or SCSI-3 persistent reservation information for a given LUN.

---

### Description

Clear the SCSI-2 reservation or SCSI-3 persistent reservation information for a given LUN.  Note: the LUN must either be offline or not mapped to clear the persistent reservation information.

---

### Related Links
* [Get-NcLunPersistentReservation](Get-NcLunPersistentReservation)

* [Confirm-NcLunHasScsiReservation](Confirm-NcLunHasScsiReservation)

---

### Examples
> Example 1

Clear-NcLunPersistentReservation /vol/testvol/testlun
Clear persistent reservations on LUN 'testlun'.

WARNING: No persistent reservations found for /vol/testvol/testlun

Path                    Size Protocol Online Mapped Thin Vserver  Comment
----                    ---- -------- ------ ------ ---- -------  -------
/vol/testvol/testlun 20.0 GB hyper_v   True   True  True costea01

---

### Parameters
#### **Path**
Path of the LUN.  The path should start with '/vol/'.

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
Category: lun
API: lun-clear-persistent-reservation-info
Family: vserver

---

### Syntax
```PowerShell
Clear-NcLunPersistentReservation [-Path] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
