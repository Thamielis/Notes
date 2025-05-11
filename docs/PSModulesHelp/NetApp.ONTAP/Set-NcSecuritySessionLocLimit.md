Set-NcSecuritySessionLocLimit
-----------------------------

### Synopsis
Modifies a per-location session limit.

---

### Description

Modifies a per-location session limit.

---

### Related Links
* [Remove-NcSecuritySessionLocLimit](Remove-NcSecuritySessionLocLimit)

* [Get-NcSecuritySessionLocLimit](Get-NcSecuritySessionLocLimit)

* [New-NcSecuritySessionLocLimit](New-NcSecuritySessionLocLimit)

---

### Examples
> Example 1

Set-NcSecuritySessionLocLimit -Interface cli -Location 10.238.49.52 -MaxActiveLimit 128
Modify the limit on the maximum concurrent CLI sessions from a IP 10.238.49.52

Location                             IPSpace                        Interface                            MaxActiveLimit
--------                             -------                        ---------                            --------------
10.238.49.52                         Default                        cli                                             128

---

### Parameters
#### **Interface**
The interface (cli or ontapi) for this application limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Location**
A textual identifier indicating the client location.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **MaxActiveLimit**
The maximum number of concurrent sessions allowed for this location.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |3       |true (ByPropertyName)|

#### **Ipspace**
The IPspace from which the client location is seen.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.SecuritySession.SessionLocationLimitsInfo

---

### Notes
Category: security session
API: security-session-limit-location-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcSecuritySessionLocLimit [-Interface] <String> [-Location] <String> [-MaxActiveLimit] <Int32> [-Ipspace <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
