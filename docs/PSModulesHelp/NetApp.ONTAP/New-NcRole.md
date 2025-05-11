New-NcRole
----------

### Synopsis
Create a new user role.

---

### Description

Create a new user role.

---

### Related Links
* [Get-NcRole](Get-NcRole)

* [Remove-NcRole](Remove-NcRole)

* [Set-NcRole](Set-NcRole)

---

### Examples
> Example 1

Get-NcRole kamino -Vserver costea01 | New-NcRole -Vserver costea02
Copy the role definitions from vserver 'costea01' to vserver 'costea02'.

RoleName Vserver  AccessLevel CommandDirectoryName
-------- -------  ----------- --------------------
kamino   costea02     all     dashboard health vserver
kamino   costea02     all     job
kamino   costea02     all     job schedule
kamino   costea02     all     lun
kamino   costea02     all     network
kamino   costea02     all     network connections
kamino   costea02    none     network connections active show-clients
kamino   costea02    none     network connections active show-protocols
kamino   costea02    none     network connections active show-services
kamino   costea02     all     network interface
kamino   costea02    none     network interface failover-groups
kamino   costea02     all     network routing-groups
kamino   costea02     all     security
kamino   costea02     all     security login password
kamino   costea02     all     security login publickey
kamino   costea02     all     security login role show-ontapi
kamino   costea02     all     set
kamino   costea02     all     version
kamino   costea02     all     volume
kamino   costea02     all     volume efficiency
kamino   costea02     all     volume move
kamino   costea02     all     vserver
kamino   costea02     all     vserver cifs
kamino   costea02     all     vserver export-policy
kamino   costea02     all     vserver fcp
kamino   costea02     all     vserver iscsi
kamino   costea02     all     vserver locks
kamino   costea02     all     vserver name-mapping
kamino   costea02     all     vserver nfs
kamino   costea02     all     vserver services
kamino   costea02    none     vserver services kerberos-realm
kamino   costea02     all     vserver services ldap client
kamino   costea02    none     vserver services web

> Example 2

```PowerShell
New-NcRole kamino -Vserver costea01 -AccessLevel readonly -CommandDirectory "volume clone"
Add "volume clone" read-only access to role 'kamino' on vserver 'costea01'.
```
> Example 3

New-NcRole kamino -Vserver costea01,costea02 -AccessLevel all -CommandDirectory "volume clone","volume member"
Add permissions for 'volume clone' and 'volume member' commands to the 'kamino' role on vservers 'costea01' and 'costea02'.

RoleName Vserver  AccessLevel CommandDirectoryName
-------- -------  ----------- --------------------
kamino   costea01     all     volume clone
kamino   costea01     all     volume member
kamino   costea02     all     volume clone
kamino   costea02     all     volume member

---

### Parameters
#### **Role**
Name of the new role.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|RoleName|

#### **Vserver**
Vserver that will own the new role.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **CommandDirectory**
The command or command directory to which the role has an access.

|Type        |Required|Position|PipelineInput        |Aliases             |
|------------|--------|--------|---------------------|--------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|CommandDirectoryName|

#### **AccessLevel**
Access level for the role. Possible values: 'none', 'readonly', 'all'.  The default value is 'all'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **RoleQuery**
A query for the role.  The query must apply to the specified command or directory name.
Example: The command is 'volume show' and the query is '-volume vol1'.  The query is applied to the command resulting in populating only the volumes with name vol1.

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
API: security-login-role-create
Family: cluster

---

### Syntax
```PowerShell
New-NcRole [-Role] <String> -Vserver <String[]> -CommandDirectory <String[]> [-AccessLevel <String>] [-RoleQuery <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
