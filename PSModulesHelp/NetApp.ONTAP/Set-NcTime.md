Set-NcTime
----------

### Synopsis
Set current date and time to the specified date and time.

---

### Description

Set current date and time  to the specified date and time.

---

### Related Links
* [Get-NcTime](Get-NcTime)

---

### Examples
> Example 1

```PowerShell
Set-NcTime -Node tesla-01 -DateTime (Get-Date)
Set the current date and time on the node tesla-01 to the current date and time on the host.

LocalTime    : 1347545997
UtcTime      : 1347560397
LocalTimeDT  : 9/13/2012 2:19:57 PM
UtcTimeDT    : 9/13/2012 6:19:57 PM

```
> Example 2

```PowerShell
Set-NcTime -Node tesla-01 -Timezone America/Los_Angeles
Set the timezone for the node tesla-01 to "America/Los_Angeles."

LocalTime    : 1347535360
UtcTime      : 1347560560
LocalTimeDT  : 9/13/2012 11:22:40 AM
UtcTimeDT    : 9/13/2012 6:22:40 PM

```

---

### Parameters
#### **Node**
Node for which to set time.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **DateTime**
The time value as a DateTime object.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|true    |2       |true (ByPropertyName)|

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

#### **Timezone**
The timezone specified in the Olson format.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Clock.Time

---

### Notes
Category: clock
API: system-cli
Family: cluster

---

### Syntax
```PowerShell
Set-NcTime [[-Node] <String>] [-DateTime] <DateTime> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcTime [[-Node] <String>] [-DateTime] <DateTime> [-Timezone] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
