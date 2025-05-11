Set-NcSecuritySessionAppLimit
-----------------------------

### Synopsis
Modifies a per-application session limit.

---

### Description

Modifies a per-application session limit.

---

### Related Links
* [Remove-NcSecuritySessionAppLimit](Remove-NcSecuritySessionAppLimit)

* [Get-NcSecuritySessionAppLimit](Get-NcSecuritySessionAppLimit)

* [New-NcSecuritySessionAppLimit](New-NcSecuritySessionAppLimit)

---

### Examples
> Example 1

Set-NcSecuritySessionAppLimit -Application telnet -Interface cli -MaxActiveLimit 64
Modifies the limit of maximum active telnet clients for the CLI to 64

Application                                                         Interface                            MaxActiveLimit
-----------                                                         ---------                            --------------
telnet                                                              cli                                              64

---

### Parameters
#### **Application**
The name of the application for this limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Interface**
The interface (cli or ontapi) for this application limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **MaxActiveLimit**
The maximum number of concurrent sessions allowed for this application on this interface

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
* DataONTAP.C.Types.SecuritySession.SessionApplicationLimitsInfo

---

### Notes
Category: security session
API: security-session-limit-application-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcSecuritySessionAppLimit [-Application] <String> [-Interface] <String> [-MaxActiveLimit] <Int32> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
