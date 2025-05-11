Get-NcEmsStatus
---------------

### Synopsis
Get status information on EMS messages.

---

### Description

Get status information on EMS messages.

---

### Examples
> Example 1

Get-NcEmsStatus -Node fas3070cluster01-01 -Name app.log.info
Get the EMS status of the app.log.info messages on node fas3070cluster01-01.

NcController                    : 10.61.172.155
AccumulatedBytes                : 1310
ChangeSince                     : False
Drops                           : 0
Indications                     : 4
IsChatter                       : False
LastDayHistogram                : {0, 0, 0, 3...}
LastHourHistogram               : {0, 0, 0, 0...}
LastTimeDropped                 :
LastTimeOccurred                : 1333032910
LastTimeProcessed               : 1333032910
LastWeekHistogram               : {4, 0, 0, 0...}
MessageName                     : app.log.info
Node                            : fas3070cluster01-01
NumAutosuppressed               : 0
NumDupSuppressed                : 0
NumRateLimited                  : 0
NumSuppressedSinceLast          : 0
NumTimerSuppressed              : 0
Probability                     : 0
Severity                        : info
StatStartingTime                : 1333026742

> Example 2

$q = Get-NcEmsStatus -Template
$q.Indications = ">10000"
Get-NcEmsStatus -Query $q
Get the status of EMS messages that have greater than 10,000 indications.

AccumulatedBytes                : 615004
ChangeSince                     : False
Drops                           : 56077
Indications                     : 58345
IsChatter                       : True
LastDayHistogram                : {216, 240, 240, 240...}
LastHourHistogram               : {4, 4, 4, 4...}
LastTimeDropped                 : 1333112032
LastTimeOccurred                : 1333112032
LastTimeProcessed               : 1333111942
LastWeekHistogram               : {3095, 5760, 5759, 5759...}
MessageName                     : cf.disk.resvRelResult
Node                            : fas3070cluster01-01
NumAutosuppressed               : 0
NumDupSuppressed                : 16260
NumRateLimited                  : 39817
NumSuppressedSinceLast          : 6
NumTimerSuppressed              : 0
Probability                     : 99
Severity                        : debug
StatStartingTime                : 1332236768

---

### Parameters
#### **Node**
Node emitting the EMS message.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Name**
The message name.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|MessageName|

#### **Severity**
The severity of the event. Possible values:
    "node_fault"     - A data corruption has been detected or the node is unable to provide client service
    "svc_fault"      - A temporary loss of service has been detected, typically a transient software fault
    "node_error"     - A hardware error has been detected which is not immediately fatal
    "svc_error"      - A software error has been detected which is not immediately fatal
    "warning"        - A high-priority message, does not indicate a fault
    "notice"         - A normal-priority message, does not indicate a fault
    "info"           - A low-priority message, does not indicate a fault
    "debug"          - A debugging message, typically suppressed from customer
    "var"            - Message has variable severity, selected at runtime

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
The number of times to retry commands that return with errors that may succeed after a retry

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[EmsStatusInfo]`|false   |named   |false        |

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
Specify to get an empty EmsStatusInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a EmsStatusInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcEmsStatus -Template" to get the initially empty EmsStatusInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[EmsStatusInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsStatusInfo

---

### Notes
Category: ems
API: ems-status-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcEmsStatus [[-Node] <String[]>] [[-Name] <String[]>] [[-Severity] <String[]>] [-Attributes <EmsStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsStatus -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcEmsStatus -Query <EmsStatusInfo> [-Attributes <EmsStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
