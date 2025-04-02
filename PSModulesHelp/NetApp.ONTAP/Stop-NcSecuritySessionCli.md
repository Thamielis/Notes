Stop-NcSecuritySessionCli
-------------------------

### Synopsis
Kill an active CLI session

---

### Description

Kill an active CLI session

---

### Related Links
* [Get-NcSecuritySessionLimit](Get-NcSecuritySessionLimit)

---

### Examples
> Example 1

Stop-NcSecuritySessionCli -NodeName aparajir-vsim1 -Interface ontapi
Kill all ONTAPI sessions currently existing on node aparajir-vsim1

Kill sessions
Are you sure you want to kill all matching sessions?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

NcController : 10.63.1.234
SuccessCount : 0
FailureCount : 0
SuccessList  : {}
FailureList  : {}

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

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **ContinueOnFailure**
Specify to continue attempting the operation on other instances, even if it fails on one instances

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
If operation is allowed to continue on failure, this can be specified to stop the operation after n number of failures

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

#### **Query**
Specify to query using a object with restricting fields set.

|Type                       |Required|Position|PipelineInput        |
|---------------------------|--------|--------|---------------------|
|`[SessionRunningStatsInfo]`|true    |1       |true (ByPropertyName)|

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.TableModifyResult

---

### Notes
Category: security session
API: security-session-kill-cli-iter
Family: cluster

---

### Syntax
```PowerShell
Stop-NcSecuritySessionCli [[-NodeName] <String[]>] [[-Interface] <String[]>] [[-StartTime] <DateTime>] [[-SessionId] <Int64>] [[-Application] <String[]>] [[-Location] <String[]>] [[-Vserver] 
```
```PowerShell
<String[]>] [[-Username] <String[]>] [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Stop-NcSecuritySessionCli [-Query] <SessionRunningStatsInfo> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Stop-NcSecuritySessionCli [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
