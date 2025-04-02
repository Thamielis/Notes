Get-NcSecuritySessionReqStats
-----------------------------

### Synopsis
Get session statistics per-request.

---

### Description

Get session statistics per-request.

---

### Related Links
* [Get-NcSecuritySessionReqLimit](Get-NcSecuritySessionReqLimit)

* [New-NcSecuritySessionReqLimit](New-NcSecuritySessionReqLimit)

* [Remove-NcSecuritySessionReqLimit](Remove-NcSecuritySessionReqLimit)

---

### Examples
> Example 1

```PowerShell
Get-NcSecuritySessionReqStats -Request "name-mapping-get-iter" -NodeName aparajir-vsim1
Get session statistics for a particular request on the node aparajir-vsim1

Active                     : 0
AverageTime                : 4
BlockedPercent             : 0
BlockedRequests            : 0
FailedPercent              : 0
FailedRequests             : 0
IdleSeconds                : 5863
Interface                  : ontapi
LastActiveSeconds          :
LastTime                   : 4
MaxActive                  : 1
MaxActiveLimit             :
MaxTime                    : 11
NcController               : 10.63.1.234
NodeName                   : aparajir-vsim1
Request                    : name-mapping-get-iter
SuccessPercent             : 100
TotalRequests              : 650
TotalSeconds               : 3
ActiveSpecified            : True
AverageTimeSpecified       : True
BlockedPercentSpecified    : True
BlockedRequestsSpecified   : True
FailedPercentSpecified     : True
FailedRequestsSpecified    : True
IdleSecondsSpecified       : True
LastActiveSecondsSpecified : False
LastTimeSpecified          : True
MaxActiveLimitSpecified    : False
MaxActiveSpecified         : True
MaxTimeSpecified           : True
SuccessPercentSpecified    : True
TotalRequestsSpecified     : True
TotalSecondsSpecified      : True

```

---

### Parameters
#### **NodeName**
Specify to filter by NodeName

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Interface**
Specify to filter by Interface

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Request**
Specify to filter by Request

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[SessionRequestStatsInfo]`|false   |named   |false        |

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

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[SessionRequestStatsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecuritySession.SessionRequestStatsInfo

---

### Notes
Category: security session
API: security-session-request-stats-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecuritySessionReqStats [[-NodeName] <String[]>] [[-Interface] <String[]>] [[-Request] <String[]>] [-Attributes <SessionRequestStatsInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionReqStats -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionReqStats -Query <SessionRequestStatsInfo> [-Attributes <SessionRequestStatsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
