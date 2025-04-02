New-NcSecuritySessionLimit
--------------------------

### Synopsis
Creates a session default limit.

---

### Description

Creates a session default limit.

---

### Related Links
* [Remove-NcSecuritySessionLimit](Remove-NcSecuritySessionLimit)

* [Set-NcSecuritySessionLimit](Set-NcSecuritySessionLimit)

* [Get-NcSecuritySessionLimit](Get-NcSecuritySessionLimit)

---

### Examples
> Example 1

New-NcSecuritySessionLimit -Category request -Interface cli -MaxActiveLimit 64
Create a new new session limit on the request category

Category                                                            Interface                            MaxActiveLimit
--------                                                            ---------                            --------------
request                                                             cli                                              64

---

### Parameters
#### **Category**
The session type for this default limit. Valid values are 'application', 'vserver', 'user', 'location', 'request'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Interface**
The interface (cli or ontapi) for this default limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **MaxActiveLimit**
The maximum number of concurrent sessions allowed for this category.

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
* DataONTAP.C.Types.SecuritySession.SessionDefaultLimitsInfo

---

### Notes
Category: security session
API: security-session-limit-create
Family: cluster

---

### Syntax
```PowerShell
New-NcSecuritySessionLimit [-Category] <String> [-Interface] <String> [-MaxActiveLimit] <Int32> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
