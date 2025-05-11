Get-NcRoleConfig
----------------

### Synopsis
Returns a list of role configuration objects.

---

### Description

Returns a list of role configuration objects.

---

### Related Links
* [Get-NcRole](Get-NcRole)

* [Set-NcRoleConfig](Set-NcRoleConfig)

---

### Examples
> Example 1

```PowerShell
Get-NcRoleConfig -Vserver costea01 -Role kamino
List the role config parameters for role 'kamino' on vserver 'costea01'.

RoleName                     : kamino
Vserver                      : costea01
MinUsernameSize              : 3
RequireUsernameAlphaNumeric  : False
MinPasswordSize              : 8
RequirePasswordAlphaNumeric  : True
ChangePasswordDurationInDays : 0
LastPasswordsDisallowedCount : 6
NcController                 : VxeRubble

```
> Example 2

```PowerShell
$query = Get-NcRoleConfig -Template
$query.ChangePasswordDurationInDays = ">0"
Get-NcRoleConfig -Query $query
Use an advanced query to find all role configurations with a password duration value greater than zero.

RoleName                     : vsadmin-volume
Vserver                      : costea01
MinUsernameSize              : 3
RequireUsernameAlphaNumeric  :
MinPasswordSize              : 8
RequirePasswordAlphaNumeric  :
ChangePasswordDurationInDays : 30
LastPasswordsDisallowedCount : 6
NcController                 : VxeRubble

```

---

### Parameters
#### **Role**
Restrict results to the specified role(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|RoleName|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SecurityLoginRoleConfigInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "GetNcRoleConfig -Template" to get the initially empty SecurityLoginRoleConfigInfo object.  If not specified, all data is returned for each object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[SecurityLoginRoleConfigInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty SecurityLoginRoleConfigInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SecurityLoginRoleConfigInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcRoleConfig -Template" to get the initially empty SecurityLoginRoleConfigInfo object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[SecurityLoginRoleConfigInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityLoginRoleConfigInfo

---

### Notes
Category: security
API: security-login-role-config-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcRoleConfig [[-Role] <String[]>] [-Vserver <String[]>] [-Attributes <SecurityLoginRoleConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcRoleConfig -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcRoleConfig -Query <SecurityLoginRoleConfigInfo> [-Attributes <SecurityLoginRoleConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
