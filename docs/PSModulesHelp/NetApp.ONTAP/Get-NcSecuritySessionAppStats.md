Get-NcSecuritySessionAppStats
-----------------------------

### Synopsis
Gets session statistics per application.

---

### Description

Gets session statistics per application.

---

### Related Links
* [Get-NcSecuritySessionAppLimit](Get-NcSecuritySessionAppLimit)

* [New-NcSecuritySessionAppLimit](New-NcSecuritySessionAppLimit)

* [Remove-NcSecuritySessionAppLimit](Remove-NcSecuritySessionAppLimit)

---

### Examples
> Example 1

```PowerShell
Get-NcSecuritySessionAppStats -Application "ReSTful zapis"
Get the session related statistics of a particular application

Active                     : 0
Application                : ReSTful zapis
AverageTime                : 105
BlockedPercent             : 0
BlockedRequests            : 0
FailedPercent              : 6
FailedRequests             : 5
IdleSeconds                :
Interface                  : ontapi
LastActiveSeconds          :
LastTime                   :
MaxActive                  : 1
MaxActiveLimit             : 20
MaxTime                    : 4141
NcController               : 10.63.1.234
NodeName                   : aparajir-vsim2
SuccessPercent             : 93
TotalRequests              : 82
TotalSeconds               : 8
ActiveSpecified            : True
AverageTimeSpecified       : True
BlockedPercentSpecified    : True
BlockedRequestsSpecified   : True
FailedPercentSpecified     : True
FailedRequestsSpecified    : True
IdleSecondsSpecified       : False
LastActiveSecondsSpecified : False
LastTimeSpecified          : False
MaxActiveLimitSpecified    : True
MaxActiveSpecified         : True
MaxTimeSpecified           : True
SuccessPercentSpecified    : True
TotalRequestsSpecified     : True
TotalSecondsSpecified      : True

```

---

### Parameters
#### **NodeName**
Specify to filter by nodes - statistics collected only from the specified node(s) will be returned.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Interface**
Specify to filter by Interface - information from only the specified interface(s) will be returned

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Application**
Specify to filter by Application - statistics for only the specified application is returned

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[SessionApplicationStatsInfo]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[SessionApplicationStatsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecuritySession.SessionApplicationStatsInfo

---

### Notes
Category: security session
API: security-session-application-stats-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecuritySessionAppStats [[-NodeName] <String[]>] [[-Interface] <String[]>] [[-Application] <String[]>] [-Attributes <SessionApplicationStatsInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionAppStats -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionAppStats -Query <SessionApplicationStatsInfo> [-Attributes <SessionApplicationStatsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
