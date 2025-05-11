New-NcSecuritySessionUserLimit
------------------------------

### Synopsis
Creates a per-user session limit.

---

### Description

Creates a per-user session limit.

---

### Related Links
* [Remove-NcSecuritySessionUserLimit](Remove-NcSecuritySessionUserLimit)

* [Set-NcSecuritySessionUserLimit](Set-NcSecuritySessionUserLimit)

* [Get-NcSecuritySessionUserLimit](Get-NcSecuritySessionUserLimit)

---

### Examples
> Example 1

New-NcSecuritySessionUserLimit -Interface cli -Username aparajir -Vserver test -MaxActiveLimit 64
Create a limit for maximum concurrent CLI sessions by user aparajir

Username                             Vserver                        Interface                            MaxActiveLimit
--------                             -------                        ---------                            --------------
aparajir                             test                           cli                                              64

---

### Parameters
#### **Interface**
The interface (cli or ontapi) for this application limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Username**
The name of the authenticated user for this limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Vserver**
The name of the Vserver for this limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **MaxActiveLimit**
The maximum number of concurrent sessions allowed for this user

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |4       |true (ByPropertyName)|

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
* DataONTAP.C.Types.SecuritySession.SessionUserLimitsInfo

---

### Notes
Category: security session
API: security-session-limit-user-create
Family: cluster

---

### Syntax
```PowerShell
New-NcSecuritySessionUserLimit [-Interface] <String> [-Username] <String> [-Vserver] <String> [-MaxActiveLimit] <Int32> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
