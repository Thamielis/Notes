Get-NcSecuritySessionRunningStats
---------------------------------

### Synopsis
Returns session running statistics.

---

### Description

Returns session running statistics.

---

### Related Links
* [Get-NcSecuritySessionLimit](Get-NcSecuritySessionLimit)

* [New-NcSecuritySessionLimit](New-NcSecuritySessionLimit)

* [Remove-NcSecuritySessionLimit](Remove-NcSecuritySessionLimit)

---

### Examples
> Example 1

```PowerShell
Get-NcSecuritySessionRunningStats
Get statistics on all currently running sessions

ActiveSeconds           : 0
Application             : PowerShell Toolkit
FailedRequests          : 0
IdleSeconds             :
Interface               : ontapi
Ipspace                 : Default
LastTime                :
Location                : 10.228.196.43
MaxTime                 : 0
NcController            : 10.63.1.234
NodeName                : aparajir-vsim2
Request                 : security-session-running-stats-get-iter
SessionId               : 3161
StartTime               : 1450711346
StartTimeDT             :
State                   : active
TotalRequests           : 1
TotalSeconds            : 0
Username                : admin
Vserver                 : aparajircluster-1
ActiveSecondsSpecified  : True
FailedRequestsSpecified : True
IdleSecondsSpecified    : False
LastTimeSpecified       : False
MaxTimeSpecified        : True
SessionIdSpecified      : True
StartTimeSpecified      : True
TotalRequestsSpecified  : True
TotalSecondsSpecified   : True

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

#### **StartTime**
Specify to filter by StartTime

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|false   |3       |true (ByPropertyName)|

#### **SessionId**
Specify to filter by SessionId

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |4       |true (ByPropertyName)|

#### **Application**
Specify to filter by Application

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |5       |true (ByPropertyName)|

#### **Location**
Specify to filter by Location

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |6       |true (ByPropertyName)|

#### **Vserver**
Specify to filter by Vserver

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |7       |true (ByPropertyName)|

#### **Username**
Specify to filter by Username

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |8       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[SessionRunningStatsInfo]`|false   |named   |false        |

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
|`[SessionRunningStatsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecuritySession.SessionRunningStatsInfo

---

### Notes
Category: security session
API: security-session-running-stats-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecuritySessionRunningStats [[-NodeName] <String[]>] [[-Interface] <String[]>] [[-StartTime] <DateTime>] [[-SessionId] <Int64>] [[-Application] <String[]>] [[-Location] <String[]>] 
```
```PowerShell
[[-Vserver] <String[]>] [[-Username] <String[]>] [-Attributes <SessionRunningStatsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionRunningStats -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionRunningStats -Query <SessionRunningStatsInfo> [-Attributes <SessionRunningStatsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
