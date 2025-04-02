Set-NcSecuritySessionReqLimit
-----------------------------

### Synopsis
Modifies a per-request session limit.

---

### Description

Modifies a per-request session limit.

---

### Related Links
* [Remove-NcSecuritySessionReqLimit](Remove-NcSecuritySessionReqLimit)

* [Get-NcSecuritySessionReqLimit](Get-NcSecuritySessionReqLimit)

* [New-NcSecuritySessionReqLimit](New-NcSecuritySessionReqLimit)

---

### Examples
> Example 1

Set-NcSecuritySessionReqLimit -Request newReq -Interface cli -MaxActiveLimit 24
Modify the maximum concurrent requests allowed over CLI for "newReq"

Request                                                             Interface                            MaxActiveLimit
-------                                                             ---------                            --------------
newReq                                                              cli                                              24

---

### Parameters
#### **Interface**
The interface (cli or ontapi) for this application limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Request**
The name of the request for this limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **MaxActiveLimit**
The maximum number of concurrent sessions allowed for this *

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |3       |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecuritySession.SessionRequestLimitsInfo

---

### Notes
Category: security session
API: security-session-limit-request-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcSecuritySessionReqLimit [-Interface] <String> [-Request] <String> [-MaxActiveLimit] <Int32> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
