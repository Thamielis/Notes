Get-NcSecuritySessionLocStats
-----------------------------

### Synopsis
Get session statistics per location.

---

### Description

Get session statistics per location.

---

### Related Links
* [Get-NcSecuritySessionLocLimit](Get-NcSecuritySessionLocLimit)

* [New-NcSecuritySessionLocLimit](New-NcSecuritySessionLocLimit)

* [Remove-NcSecuritySessionLocLimit](Remove-NcSecuritySessionLocLimit)

---

### Examples
> Example 1

```PowerShell
Get-NcSecuritySessionLocStats -Interface ontapi -Location 10.72.164.71 -NodeName aparajir-vsim2
Get the ontapi session statistics for a particular IP

Active                     : 0
AverageTime                : 51
BlockedPercent             : 0
BlockedRequests            : 0
FailedPercent              : 2
FailedRequests             : 2
IdleSeconds                :
Interface                  : ontapi
Ipspace                    : Default
LastActiveSeconds          :
LastTime                   :
Location                   : 10.72.164.71
MaxActive                  : 3
MaxActiveLimit             : 20
MaxTime                    : 445
NcController               : 10.63.1.234
NodeName                   : aparajir-vsim2
SuccessPercent             : 97
TotalRequests              : 86
TotalSeconds               : 4
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
Specify to filter by NodeName

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Interface**
Specify to filter by Interface

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Location**
Specify to filter by Location

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Ipspace**
Specify to filter by Ipspace

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SessionLocationStatsInfo]`|false   |named   |false        |

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

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SessionLocationStatsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecuritySession.SessionLocationStatsInfo

---

### Notes
Category: security session
API: security-session-location-stats-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecuritySessionLocStats [[-NodeName] <String[]>] [[-Interface] <String[]>] [[-Location] <String[]>] [[-Ipspace] <String[]>] [-Attributes <SessionLocationStatsInfo>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionLocStats -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionLocStats -Query <SessionLocationStatsInfo> [-Attributes <SessionLocationStatsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
