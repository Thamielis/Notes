Disable-NcFileserviceAudit
--------------------------

### Synopsis
Disable Auditing for Vserver.

---

### Description

Disable Auditing for Vserver.

---

### Related Links
* [Enable-NcFileserviceAudit](Enable-NcFileserviceAudit)

---

### Examples
> Example 1

```PowerShell
Disable-NcFileserviceAudit
Disable fileservice auditing for the current Vserver.

AuditGuarantee              : True
Destination                 : /hashes
IsEnabled                   : False
NcController                : 10.63.165.62
RotateLimit                 : 0
RotateScheduleDay           : {1}
RotateScheduleDayofweek     : {-1}
RotateScheduleHour          : {0}
RotateScheduleMinute        : {5}
RotateScheduleMonth         : {-1}
RotateSize                  :
RotationScheduleDescription : 1@0:05
Vserver                     : beam01
AuditGuaranteeSpecified     : True
IsEnabledSpecified          : True
RotateLimitSpecified        : True

```

---

### Parameters
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
* DataONTAP.C.Types.FileserviceAudit.FileserviceAuditConfig

---

### Notes
Category: fileservice audit
API: fileservice-audit-disable
Family: vserver

---

### Syntax
```PowerShell
Disable-NcFileserviceAudit [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
