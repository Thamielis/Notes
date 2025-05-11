Get-NcCifsDomainPasswordSchedule
--------------------------------

### Synopsis
Get a list of CIFS domain password schedule objects.

---

### Description

Get a list of CIFS domain password schedule objects.

---

### Related Links
* [Set-NcCifsDomainPasswordSchedule](Set-NcCifsDomainPasswordSchedule)

* [Enable-NcCifsDomainPasswordSchedule](Enable-NcCifsDomainPasswordSchedule)

* [Disable-NcCifsDomainPasswordSchedule](Disable-NcCifsDomainPasswordSchedule)

---

### Examples
> Example 1

```PowerShell
Get-NcCifsDomainPasswordSchedule
Get the CIFS domain password schedule for the current Vserver.

IsScheduleEnabled                 : False
NcController                      : 10.63.10.33
ScheduleDayOfWeek                 : 0
ScheduleRandomizedMinute          : 120
ScheduleTimeOfDay                 : 01:00:00
ScheduleWeeklyInterval            : 4
Vserver                           : beam01
IsScheduleEnabledSpecified        : True
ScheduleRandomizedMinuteSpecified : True
ScheduleWeeklyIntervalSpecified   : True

```
> Example 2

```PowerShell
Get-NcCifsDomainPasswordSchedule -Vserver beam01
Get the CIFS domain password schedule for the given Vserver.

IsScheduleEnabled                 : False
NcController                      : 10.63.10.33
ScheduleDayOfWeek                 : 0
ScheduleRandomizedMinute          : 120
ScheduleTimeOfDay                 : 01:00:00
ScheduleWeeklyInterval            : 4
Vserver                           : beam01
IsScheduleEnabledSpecified        : True
ScheduleRandomizedMinuteSpecified : True
ScheduleWeeklyIntervalSpecified   : True

```

---

### Parameters
#### **Vserver**
Restrict the results to one or more Vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsDomainPasswordSchedule object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsDomainPasswordSchedule -Template" to get the initially empty CifsDomainPasswordSchedule object.  If not specified, all data is returned for each object.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CifsDomainPasswordSchedule]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty CifsDomainPasswordSchedule object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsDomainPasswordSchedule object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsDomainPasswordSchedule -Template" to get the initially empty CifsDomainPasswordSchedule object.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CifsDomainPasswordSchedule]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsDomainPasswordSchedule

---

### Notes
Category: cifs
API: cifs-domain-password-schedule-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsDomainPasswordSchedule [[-Vserver] <String[]>] [-Attributes <CifsDomainPasswordSchedule>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsDomainPasswordSchedule -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsDomainPasswordSchedule -Query <CifsDomainPasswordSchedule> [-Attributes <CifsDomainPasswordSchedule>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
