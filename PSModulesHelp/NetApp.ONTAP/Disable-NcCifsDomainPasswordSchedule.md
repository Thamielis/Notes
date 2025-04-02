Disable-NcCifsDomainPasswordSchedule
------------------------------------

### Synopsis
Disable the CIFS domain password schedule.

---

### Description

Disable the CIFS domain password schedule.

---

### Related Links
* [Get-NcCifsDomainPasswordSchedule](Get-NcCifsDomainPasswordSchedule)

* [Set-NcCifsDomainPasswordSchedule](Set-NcCifsDomainPasswordSchedule)

* [Enable-NcCifsDomainPasswordSchedule](Enable-NcCifsDomainPasswordSchedule)

---

### Examples
> Example 1

```PowerShell
Disable-NcCifsDomainPasswordSchedule
Disable the CIFS domain password schedule for the current Vserver.

IsScheduleEnabled                 : False
NcController                      : 10.63.10.33
ScheduleDayOfWeek                 : 0
ScheduleRandomizedMinute          : 150
ScheduleTimeOfDay                 : 06:30:00
ScheduleWeeklyInterval            : 8
Vserver                           : beam01
IsScheduleEnabledSpecified        : True
ScheduleRandomizedMinuteSpecified : True
ScheduleWeeklyIntervalSpecified   : True

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
* DataONTAP.C.Types.Cifs.CifsDomainPasswordSchedule

---

### Notes
Category: cifs
API: cifs-domain-password-schedule-modify
Family: vserver

---

### Syntax
```PowerShell
Disable-NcCifsDomainPasswordSchedule [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
