Get-NcSecuritySessionVserverStats
---------------------------------

### Synopsis
Returns session vserver statistics.

---

### Description

Returns session vserver statistics.

---

### Related Links
* [Get-NcSecuritySessionVserverLimit](Get-NcSecuritySessionVserverLimit)

* [New-NcSecuritySessionVserverLimit](New-NcSecuritySessionVserverLimit)

* [Remove-NcSecuritySessionVserverLimit](Remove-NcSecuritySessionVserverLimit)

---

### Examples
> Example 1

```PowerShell
Get-NcSecuritySessionVserverStats -Interface ontapi -Vserver aparajircluster-1 -NodeName aparajir-vsim1
Get session statistics for a particular combination

Active                     : 0
AverageTime                : 30
BlockedPercent             : 0
BlockedRequests            : 0
FailedPercent              : 4
FailedRequests             : 2442
IdleSeconds                : 894
Interface                  : ontapi
LastActiveSeconds          :
LastTime                   : 59
MaxActive                  : 3
MaxActiveLimit             : 24
MaxTime                    : 916
NcController               : 10.63.1.234
NodeName                   : aparajir-vsim1
SuccessPercent             : 95
TotalRequests              : 54272
TotalSeconds               : 1674
Vserver                    : aparajircluster-1
ActiveSpecified            : True
AverageTimeSpecified       : True
BlockedPercentSpecified    : True
BlockedRequestsSpecified   : True
FailedPercentSpecified     : True
FailedRequestsSpecified    : True
IdleSecondsSpecified       : True
LastActiveSecondsSpecified : False
LastTimeSpecified          : True
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
Specify to filter by NodeName

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Interface**
Specify to filter by Interface

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Vserver**
Specify to filter by Vserver

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[SessionVserverStatsInfo]`|false   |named   |false        |

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
|`[SessionVserverStatsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecuritySession.SessionVserverStatsInfo

---

### Notes
Category: security session
API: security-session-vserver-stats-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecuritySessionVserverStats [[-NodeName] <String[]>] [[-Interface] <String[]>] [[-Vserver] <String[]>] [-Attributes <SessionVserverStatsInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionVserverStats -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionVserverStats -Query <SessionVserverStatsInfo> [-Attributes <SessionVserverStatsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
