Get-NcSecurityLoginCurrentUser
------------------------------

### Synopsis
Show the current user and role of this session.

---

### Description

Show the current user and role of this session.

---

### Examples
> Example 1

Get-NcSecurityLoginCurrentUser
Gives The details of the user and its role of the session

UserName        Application     AuthMethod      RoleName        IsLocked Vserver
--------        -----------     ----------      --------        -------- -------
admin                                           admin

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP.

|Type                        |Required|Position|PipelineInput|Aliases          |
|----------------------------|--------|--------|-------------|-----------------|
|`[SecurityLoginAccountInfo]`|false   |1       |false        |DesiredAttributes|

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
* DataONTAP.C.Types.Security.SecurityLoginAccountInfo

---

### Notes
Category: security
API: security-login-whoami
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcSecurityLoginCurrentUser [[-Attributes] <SecurityLoginAccountInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
