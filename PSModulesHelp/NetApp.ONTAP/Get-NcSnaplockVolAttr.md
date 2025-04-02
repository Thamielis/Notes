Get-NcSnaplockVolAttr
---------------------

### Synopsis
Returns snaplock attributes of a given snaplock volume.

---

### Description

Returns snaplock attributes of a given snaplock volume.

---

### Related Links
* [Set-NcSnaplockVolAttr](Set-NcSnaplockVolAttr)

---

### Examples
> Example 1

```PowerShell
Get-NcSnaplockVolAttr -Volume locked -VserverContext primary1
Get the SnapLock Attributes from Volume primary1:locked

AutocommitPeriod       : none
DefaultRetentionPeriod : max
MaximumRetentionPeriod : 30 years
MinimumRetentionPeriod : 0 years
NcController           : 10.63.1.234
PrivilegedDeleteState  : disallowed
Type                   : compliance
VolumeComplianceClock  : DataONTAP.C.Types.Snaplock.ComplianceClockInfo
VolumeExpiryTime       : none

```

---

### Parameters
#### **Volume**
Name of the snaplock volume whose attributes are required.

|Type      |Required|Position|PipelineInput        |Aliases                                |
|----------|--------|--------|---------------------|---------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Vol<br/>VolName<br/>VolumeName<br/>Name|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snaplock.SnaplockAttrsInfo

---

### Notes
Category: snaplock
API: volume-get-snaplock-attrs
Family: vserver

---

### Syntax
```PowerShell
Get-NcSnaplockVolAttr [-Volume] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
