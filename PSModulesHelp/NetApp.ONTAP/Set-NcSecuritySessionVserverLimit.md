Set-NcSecuritySessionVserverLimit
---------------------------------

### Synopsis
Modifies a per-vserver session limit.

---

### Description

Modifies a per-vserver session limit.

---

### Related Links
* [Remove-NcSecuritySessionVserverLimit](Remove-NcSecuritySessionVserverLimit)

* [Get-NcSecuritySessionVserverLimit](Get-NcSecuritySessionVserverLimit)

* [New-NcSecuritySessionVserverLimit](New-NcSecuritySessionVserverLimit)

---

### Examples
> Example 1

Set-NcSecuritySessionVserverLimit -Interface cli -Vserver test -MaxActiveLimit 16
Modifies the limit on the total number of CLI sessions that can be open on the test vserver

Vserver                                                             Interface                            MaxActiveLimit
-------                                                             ---------                            --------------
test                                                                cli                                              16

---

### Parameters
#### **Interface**
The interface (cli or ontapi) for this application limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
The name of the Vserver for this limit.

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
* DataONTAP.C.Types.SecuritySession.SessionVserverLimitsInfo

---

### Notes
Category: security session
API: security-session-limit-vserver-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcSecuritySessionVserverLimit [-Interface] <String> [-Vserver] <String> [-MaxActiveLimit] <Int32> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
