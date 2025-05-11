Get-NcLdapClientSchema
----------------------

### Synopsis
Get the list of Lightweight Directory Access Protocol (LDAP) client schema configurations that are defined for the cluster.

---

### Description

Get the list of Lightweight Directory Access Protocol (LDAP) client schema configurations that are defined for the cluster.

---

### Related Links
* [Set-NcLdapClientSchema](Set-NcLdapClientSchema)

* [Remove-NcLdapClientSchema](Remove-NcLdapClientSchema)

* [Copy-NcLdapClientSchema](Copy-NcLdapClientSchema)

---

### Examples
> Example 1

```PowerShell
Get-NcLdapClientSchema AD-SFU
Get the LDAP client schema named AD-SFU.

Schema                     : AD-SFU
NcController               : 192.168.182.144
CnGroupAttribute           : cn
CnNetgroupAttribute        : name
Comment                    : Schema based on Active Directory Services for UNIX (read-only)
GecosAttribute             : name
GidNumberAttribute         : gidNumber
HomeDirectoryAttribute     : unixHomeDirectory
LoginShellAttribute        : loginShell
MemberNisNetgroupAttribute : memberNisNetgroup
MemberUidAttribute         : primaryGroupID
NisNetgroupObjectClass     : nisNetgroup
NisNetgroupTripleAttribute : nisNetgroupTriple
PosixAccountObjectClass    : User
PosixGroupObjectClass      : Group
UidAttribute               : uid
UidNumberAttribute         : uidNumber
UserPasswordAttribute      : unixUserPassword
WindowsAccountAttribute    : windowsAccount

```
> Example 2

```PowerShell
$q = Get-NcLdapClientSchema -Template
$q.Comment = "*read-only*"
Get-NcLdapClientSchema -Query $q
Get the LDAP client schema(s) that mention "read-only" in the comment.

Schema                     : AD-SFU
NcController               : 192.168.182.144
CnGroupAttribute           : cn
CnNetgroupAttribute        : name
Comment                    : Schema based on Active Directory Services for UNIX (read-only)
GecosAttribute             : name
GidNumberAttribute         : gidNumber
HomeDirectoryAttribute     : unixHomeDirectory
LoginShellAttribute        : loginShell
MemberNisNetgroupAttribute : memberNisNetgroup
MemberUidAttribute         : primaryGroupID
NisNetgroupObjectClass     : nisNetgroup
NisNetgroupTripleAttribute : nisNetgroupTriple
PosixAccountObjectClass    : User
PosixGroupObjectClass      : Group
UidAttribute               : uid
UidNumberAttribute         : uidNumber
UserPasswordAttribute      : unixUserPassword
WindowsAccountAttribute    : windowsAccount

Schema                     : RFC-2307
NcController               : 192.168.182.144
CnGroupAttribute           : cn
CnNetgroupAttribute        : cn
Comment                    : Schema based on RFC 2307 (read-only)
GecosAttribute             : gecos
GidNumberAttribute         : gidNumber
HomeDirectoryAttribute     : homeDirectory
LoginShellAttribute        : loginShell
MemberNisNetgroupAttribute : memberNisNetgroup
MemberUidAttribute         : memberUid
NisNetgroupObjectClass     : nisNetgroup
NisNetgroupTripleAttribute : nisNetgroupTriple
PosixAccountObjectClass    : posixAccount
PosixGroupObjectClass      : posixGroup
UidAttribute               : uid
UidNumberAttribute         : uidNumber
UserPasswordAttribute      : userPassword
WindowsAccountAttribute    : windowsAccount

```

---

### Parameters
#### **Name**
One or more names of LDAP schemas.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Schema |

#### **Attributes**
For improved scalability in large clusters, provide a LdapClientSchema object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcLdapClientSchema -Template" to get the initially empty LdapClientSchema object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[LdapClientSchema]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
Specify to get an empty LdapClientSchema object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a LdapClientSchema object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcLdapClientSchema -Template" to get the initially empty LdapClientSchema object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[LdapClientSchema]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ldap.LdapClientSchema

---

### Notes
Category: ldap
API: ldap-client-schema-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcLdapClientSchema [[-Name] <String[]>] [-Attributes <LdapClientSchema>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLdapClientSchema -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLdapClientSchema -Query <LdapClientSchema> [-Attributes <LdapClientSchema>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
