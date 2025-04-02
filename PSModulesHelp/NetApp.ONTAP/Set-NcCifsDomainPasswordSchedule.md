Set-NcCifsDomainPasswordSchedule
--------------------------------

### Synopsis
Modify the attributes of CIFS domain password schedule object.

---

### Description

Modify the attributes of CIFS domain password schedule object.

---

### Related Links
* [Get-NcCifsDomainPasswordSchedule](Get-NcCifsDomainPasswordSchedule)

* [Enable-NcCifsDomainPasswordSchedule](Enable-NcCifsDomainPasswordSchedule)

* [Disable-NcCifsDomainPasswordSchedule](Disable-NcCifsDomainPasswordSchedule)

---

### Examples
> Example 1

```PowerShell
Set-NcCifsDomainPasswordSchedule -WeeklyInterval 8 -RandomizedMinute 150 -TimeOfDay 06:30:00
Update the WeeklyInterval, RandomizedMinute, and TimeOfDay values for the CIFS domain password schedule of the current Vserver.

IsScheduleEnabled                 : False
NcController                      : 10.63.10.33
ScheduleDayOfWeek                 : 0
ScheduleRandomizedMinute          : 150
ScheduleTimeOfDay                 : 06:30:00
ScheduleWeeklyInterval            : 8
Vserver                           : beam01

```

---

### Parameters
#### **WeeklyInterval**
The number of weeks after which the scheduled domain account password change must occur.

|Type     |Required|Position|PipelineInput        |Aliases               |
|---------|--------|--------|---------------------|----------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|ScheduleWeeklyInterval|

#### **RandomizedMinute**
The minutes within which the scheduled domain account password start time can be randomized beginning at TimeOfDay.

|Type     |Required|Position|PipelineInput        |Aliases                 |
|---------|--------|--------|---------------------|------------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|ScheduleRandomizedMinute|

#### **DayOfWeek**
The day of week when the scheduled domain account password change occurs.

|Type     |Required|Position|PipelineInput        |Aliases          |
|---------|--------|--------|---------------------|-----------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|ScheduleDayOfWeek|

#### **TimeOfDay**
The time in HH:MM:SS format at which the scheduled domain account password change starts.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |named   |true (ByPropertyName)|ScheduleTimeOfDay|

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
Set-NcCifsDomainPasswordSchedule [-WeeklyInterval <Int32>] [-RandomizedMinute <Int32>] [-DayOfWeek <Int32>] [-TimeOfDay <String>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
