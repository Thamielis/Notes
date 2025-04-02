Unlock-NcUser
-------------

### Synopsis
Unlock a user account that uses password as the authentication method.

---

### Description

Unlock a user account that uses password as the authentication method.  Returns an error if the user account does not use password authentication.

---

### Related Links
* [Get-NcUser](Get-NcUser)

* [Lock-NcUser](Lock-NcUser)

---

### Examples
> Example 1

Unlock-NcUser rcuuser -Vserver dlamotta02
Unlock user 'rcuuser' on vserver 'dlamotta02'.

UserName Application AuthMethod RoleName IsLocked Vserver
-------- ----------- ---------- -------- -------- -------
rcuuser  http        password   rcu       False   dlamotta02
rcuuser  ontapi      password   rcu       False   dlamotta02
rcuuser  ssh         password   rcu       False   dlamotta02

---

### Parameters
#### **UserName**
Name of the user account to be unlocked.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **Vserver**
Vserver that owns the user account.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

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
API: security-login-unlock
Family: cluster

---

### Syntax
```PowerShell
Unlock-NcUser [-UserName] <String> -Vserver <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
