Get-NcSecuritySessionUserStats
------------------------------

### Synopsis
Returns session user statistics.

---

### Description

Returns session user statistics.

---

### Related Links
* [Get-NcSecuritySessionUserLimit](Get-NcSecuritySessionUserLimit)

* [New-NcSecuritySessionUserLimit](New-NcSecuritySessionUserLimit)

* [Remove-NcSecuritySessionUserLimit](Remove-NcSecuritySessionUserLimit)

---

### Examples
> Example 1

Get-NcSecuritySessionUserStats -NodeName aparajir-vsim2 -Username admin -Vserver aparajircluster-1 -Interface cli
Get statistics on a particular user's logins

Active                     : 0
AverageTime                : 755
BlockedPercent             : 0
BlockedRequests            : 0
FailedPercent              : 2
FailedRequests             : 18
IdleSeconds                : 2960
Interface                  : cli
LastActiveSeconds          :
LastTime                   : 0
MaxActive                  : 2
MaxActiveLimit             :
MaxTime                    : 67258
NcController               : 10.63.1.234
NodeName                   : aparajir-vsim2
SuccessPercent             : 97
TotalRequests              : 662
TotalSeconds               : 499
Username                   : admin
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
MaxActiveLimitSpecified    : False
MaxActiveSpecified         : True
MaxTimeSpecified           : True
SuccessPercentSpecified    : True
TotalRequestsSpecified     : True
TotalSecondsSpecified      : True

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

#### **Username**
Specify to filter by Username

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[SessionUserStatsInfo]`|false   |named   |false        |

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

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[SessionUserStatsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecuritySession.SessionUserStatsInfo

---

### Notes
Category: security session
API: security-session-user-stats-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecuritySessionUserStats [[-NodeName] <String[]>] [[-Interface] <String[]>] [[-Vserver] <String[]>] [[-Username] <String[]>] [-Attributes <SessionUserStatsInfo>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionUserStats -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionUserStats -Query <SessionUserStatsInfo> [-Attributes <SessionUserStatsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
