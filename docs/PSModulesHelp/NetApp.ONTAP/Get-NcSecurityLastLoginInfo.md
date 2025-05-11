Get-NcSecurityLastLoginInfo
---------------------------

### Synopsis
Show the last login time, unsuccessful login attempts and role change since last login.

---

### Description

Show the last login time, unsuccessful login attempts and role change since last login.

---

### Examples
> Example 1

```PowerShell
Get-NcSecurityLastLoginInfo -Vserver C1_sti32-vsim-ucs480e_1536315819 -UserName admin
Gets the Last login info of the vserver C1_sti32-vsim-ucs480e_1536315819

NcController             : 10.236.44.243
LastLoginTime            : 1536907086
LastLoginTimeDT          : 9/14/2018 6:38:06 AM
LastRoleChange           : False
LastUnsuccessfulAttempts : 0

```

---

### Parameters
#### **Vserver**
Name of vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **UserName**
Name of user or group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
* DataONTAP.C.Types.Security.LoginInfo

---

### Notes
Category: security
API: security-last-login-info
Family: ontap-cluster

---

### Syntax
```PowerShell
Get-NcSecurityLastLoginInfo [-Vserver] <String> [-UserName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
