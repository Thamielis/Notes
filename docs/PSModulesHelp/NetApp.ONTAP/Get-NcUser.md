Get-NcUser
----------

### Synopsis
Returns a list of user account objects.

---

### Description

Returns a list of user account objects.

---

### Related Links
* [New-NcUser](New-NcUser)

* [Remove-NcUser](Remove-NcUser)

* [Set-NcUser](Set-NcUser)

---

### Examples
> Example 1

Get-NcUser rcuuser
List all user entries for the user 'rcuuser'.

UserName Application AuthMethod RoleName IsLocked Vserver
-------- ----------- ---------- -------- -------- -------
rcuuser  http        password   rcu       False   dlamotta02
rcuuser  ontapi      password   rcu       False   dlamotta02
rcuuser  ssh         password   rcu       False   dlamotta02

> Example 2

Get-NcUser -Application ontapi -Locked $false
List all users with active API access.

UserName Application AuthMethod RoleName IsLocked Vserver
-------- ----------- ---------- -------- -------- -------
root     ontapi      password   kamino    False   costea01
test     ontapi      password   kamino    False   costea01
test2    ontapi      password   vsadmin   False   costea01
vsadmin  ontapi      password   vsadmin   False   costea01
rcuuser  ontapi      password   rcu       False   dlamotta02
admin    ontapi      password   admin     False   VxeRubble
root     ontapi      password   admin     False   VxeRubble

---

### Parameters
#### **Name**
Restrict results to the specified users(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|UserName|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Application**
Restrict results to the specified application(s).  Possible values: 'console', 'http', 'ontapi', 'snmp', 'sp', 'ssh'.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **AuthMethod**
Restrict results to the specified authentication method(s).  Possible values: 'community', 'password', 'publickey', 'domain', 'nsswitch' and 'usm'.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases             |
|------------|--------|--------|---------------------|--------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|AuthenticationMethod|

#### **Role**
Restrict results to the specified role(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|RoleName|

#### **Locked**
Restrict results to the specified locked status.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **RemoteSwitchIpaddress**
This optionally specifies the IP Address of the remote switch.
This parameter is available in ONTAP 9.3 and later. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SecurityLoginAccountInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcUser -Template" to get the initially empty SecurityLoginAccountInfo object.  If not specified, all data is returned for each object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SecurityLoginAccountInfo]`|false   |named   |false        |

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
Specify to get an empty SecurityLoginAccountInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SecurityLoginAccountInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcUser -Template" to get the initially empty SecurityLoginAccountInfo object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SecurityLoginAccountInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityLoginAccountInfo

---

### Notes
Category: security
API: security-login-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcUser [[-Name] <String[]>] [-Vserver <String[]>] [-Application <String[]>] [-AuthMethod <String[]>] [-Role <String[]>] [-Locked <Boolean>] [-RemoteSwitchIpaddress <String[]>] 
```
```PowerShell
[-Attributes <SecurityLoginAccountInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcUser [-RemoteSwitchIpaddress <String[]>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcUser [-RemoteSwitchIpaddress <String[]>] -Query <SecurityLoginAccountInfo> [-Attributes <SecurityLoginAccountInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
