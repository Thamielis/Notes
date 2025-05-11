Get-NcRole
----------

### Synopsis
Returns a list of user role objects.

---

### Description

Returns a list of user role objects.

---

### Related Links
* [New-NcRole](New-NcRole)

* [Remove-NcRole](Remove-NcRole)

* [Set-NcRole](Set-NcRole)

---

### Examples
> Example 1

Get-NcRole rcu
List the capabilities of the 'rcu' role.

RoleName Vserver    AccessLevel CommandDirectoryName
-------- -------    ----------- --------------------
rcu      dlamotta02    none     DEFAULT
rcu      dlamotta02     all     job
rcu      dlamotta02     all     lun
rcu      dlamotta02     all     network connections
rcu      dlamotta02     all     network interface
rcu      dlamotta02     all     security login password
rcu      dlamotta02     all     security login publickey
rcu      dlamotta02     all     security login role show-ontapi
rcu      dlamotta02     all     set
rcu      dlamotta02     all     version
rcu      dlamotta02     all     volume
rcu      dlamotta02     all     volume efficiency
rcu      dlamotta02     all     volume move
rcu      dlamotta02     all     vserver
rcu      dlamotta02     all     vserver cifs
rcu      dlamotta02     all     vserver export-policy
rcu      dlamotta02     all     vserver locks
rcu      dlamotta02     all     vserver name-mapping
rcu      dlamotta02     all     vserver services

> Example 2

$query = Get-NcRole -Template
$query.Vserver = "costea*"
$query.RoleName = "kamino"
$query.CommandDirectoryName = "vol*"
Get-NcRole -Query $query
Use an advanced query to get the roles matching several criteria.

RoleName Vserver  AccessLevel CommandDirectoryName
-------- -------  ----------- --------------------
kamino   costea01     all     volume
kamino   costea01     all     volume efficiency
kamino   costea01     all     volume move
kamino   costea02     all     volume
kamino   costea02     all     volume efficiency
kamino   costea02     all     volume move

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

#### **CommandDirectory**
Restrict results to the specified command(s) or command directories.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases             |
|------------|--------|--------|---------------------|--------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|CommandDirectoryName|

#### **AccessLevel**
Restrict results to the specified access level(s).  Possible values: 'none', 'readonly', 'all'.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SecurityLoginRoleInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "GetNcRole -Template" to get the initially empty SecurityLoginRoleInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[SecurityLoginRoleInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty SecurityLoginRoleInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SecurityLoginRoleInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcRole -Template" to get the initially empty SecurityLoginRoleInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[SecurityLoginRoleInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityLoginRoleInfo

---

### Notes
Category: security
API: security-login-role-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcRole [[-Role] <String[]>] [-Vserver <String[]>] [-CommandDirectory <String[]>] [-AccessLevel <String[]>] [-Attributes <SecurityLoginRoleInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcRole -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcRole -Query <SecurityLoginRoleInfo> [-Attributes <SecurityLoginRoleInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
