Set-NcRole
----------

### Synopsis
Modify the attributes of user role object.

---

### Description

Modify the attributes of user role object.  Omitted (optional) fields will not be changed.

---

### Related Links
* [Get-NcRole](Get-NcRole)

* [New-NcRole](New-NcRole)

* [Remove-NcRole](Remove-NcRole)

---

### Examples
> Example 1

Get-NcRole kamino -Vserver costea01,costea02 -CommandDirectory "volume clone","volume member" | Set-NcRole -AccessLevel all
Set the access level for the 'volume clone' and 'volume member' commands on the 'kamino' role on vservers 'costea01' and 'costea02'.

RoleName Vserver  AccessLevel CommandDirectoryName
-------- -------  ----------- --------------------
kamino   costea01     all     volume clone
kamino   costea01     all     volume member
kamino   costea02     all     volume clone
kamino   costea02     all     volume member

---

### Parameters
#### **Role**
Name of the role to modify.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|RoleName|

#### **Vserver**
Vserver that owns the role.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **CommandDirectory**
The command or command directory to which the role has access.

|Type        |Required|Position|PipelineInput        |Aliases             |
|------------|--------|--------|---------------------|--------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|CommandDirectoryName|

#### **AccessLevel**
Access level for the role.  Possible values: 'none', 'readonly', 'all'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **RoleQuery**
A query for the role.  The query must apply to the specified command or directory name.
Example: The command is 'volume show' and the query is '-volume vol1'. The query is applied to the command resulting in populating only the volumes with name vol1.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityLoginRoleInfo

---

### Notes
Category: security
API: security-login-role-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcRole [-Role] <String> -Vserver <String[]> -CommandDirectory <String[]> [-AccessLevel <String>] [-RoleQuery <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
