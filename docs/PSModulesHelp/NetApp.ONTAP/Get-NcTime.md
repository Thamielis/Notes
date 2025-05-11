Get-NcTime
----------

### Synopsis
Get current date and time from the controller.

---

### Description

Get current date and time from the controller.

To run the command below ONTAP 8.3, it is necessary to either specify the -Node switch or be connected to the node vserver. From ONTAP 8.3 this command can be run on the cluster, without specifying node information.

---

### Related Links
* [Set-NcTime](Set-NcTime)

---

### Examples
> Example 1

```PowerShell
Get-NcTime -Node tesla-01
Get the current time for node tesla-01.

LocalTime    : 1347545437
UtcTime      : 1347559837
LocalTimeDT  : 9/13/2012 2:10:37 PM
UtcTimeDT    : 9/13/2012 6:10:37 PM

```

---

### Parameters
#### **Node**
Node for which to get time.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Clock.Time

---

### Notes
Category: clock
API: clock-get-clock
Family: cluster

---

### Syntax
```PowerShell
Get-NcTime [[-Node] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
