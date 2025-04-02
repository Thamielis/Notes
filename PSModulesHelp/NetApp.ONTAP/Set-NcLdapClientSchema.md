Set-NcLdapClientSchema
----------------------

### Synopsis
Modify an existing Lightweight Directory Access Protocol (LDAP) schema configuration.

---

### Description

Modify an existing Lightweight Directory Access Protocol (LDAP) schema configuration. If the LDAP server that the storage system needs to query does not support any of the default read-only schemas,  Copy-NcLdapClientSchema can be used to create a editable copy of an existing read-only schema.

The cmdlet works in the cluster context in ONTAP versions prior to 8.2.  in ONTAP 8.2 and later, the cmdlet works in the vserver context.

---

### Related Links
* [Get-NcLdapClientSchema](Get-NcLdapClientSchema)

* [Copy-NcLdapClientSchema](Copy-NcLdapClientSchema)

* [Remove-NcLdapClientSchema](Remove-NcLdapClientSchema)

---

### Examples
> Example 1

```PowerShell
Set-NcLdapClientSchema AD-SFU-copy -Comment "This is a (read-write) copy of AD-SFU."
Set the comment for the LDAP client schema AD-SFU-copy.

Schema                     : AD-SFU-copy
NcController               : 192.168.182.144
CnGroupAttribute           : cn
CnNetgroupAttribute        : name
Comment                    : This is a (read-write) copy of AD-SFU.
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

---

### Parameters
#### **Name**
A name for the schema.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Schema |

#### **Comment**
A comment that can be associated with the schema.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PosixAccount**
Name that represents the RFC 2307 posixAccount object class.

|Type      |Required|Position|PipelineInput        |Aliases                |
|----------|--------|--------|---------------------|-----------------------|
|`[String]`|false   |named   |true (ByPropertyName)|PosixAccountObjectClass|

#### **PosixGroup**
Name that represents the RFC 2307 posixGroup object class.

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|PosixGroupObjectClass|

#### **NisNetgroup**
Name that represents the RFC 2307 nisNetgroup object class.

|Type      |Required|Position|PipelineInput        |Aliases               |
|----------|--------|--------|---------------------|----------------------|
|`[String]`|false   |named   |true (ByPropertyName)|NisNetgroupObjectClass|

#### **Uid**
Name that represents the RFC 1274 userid attribute used by RFC 2307 as uid.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|false   |named   |true (ByPropertyName)|UidAttribute|

#### **UidNumber**
Name that represents the RFC 2307 uidNumber attribute.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|false   |named   |true (ByPropertyName)|UidNumberAttribute|

#### **GidNumber**
Name that represents the RFC 2307 gidNumber attribute.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|false   |named   |true (ByPropertyName)|GidNumberAttribute|

#### **GroupCn**
Name that represents the RFC 2256 cn attribute used by RFC 2307 when working with groups.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|false   |named   |true (ByPropertyName)|CnGroupAttribute|

#### **NetGroupCn**
Name that represents the RFC 2256 cn attribute used by RFC 2307 when working with netgroups.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|false   |named   |true (ByPropertyName)|CnNetgroupAttribute|

#### **UserPassword**
Name that represents the RFC 2256 userPassword attribute used by RFC 2307.

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|UserPasswordAttribute|

#### **Gecos**
Name that represents the RFC 2307 gecos attribute.

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|false   |named   |true (ByPropertyName)|GecosAttribute|

#### **HomeDirectory**
Name that represents the RFC 2307 homeDirectory attribute.

|Type      |Required|Position|PipelineInput        |Aliases               |
|----------|--------|--------|---------------------|----------------------|
|`[String]`|false   |named   |true (ByPropertyName)|HomeDirectoryAttribute|

#### **LoginShell**
Name that represents the RFC 2307 loginShell attribute.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|false   |named   |true (ByPropertyName)|LoginShellAttribute|

#### **MemberUid**
Name that represents the RFC 2307 memberUid attribute.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|false   |named   |true (ByPropertyName)|MemberUidAttribute|

#### **MemberNisNetgroup**
Name that represents the RFC 2307 memberNisNetgroup attribute.

|Type      |Required|Position|PipelineInput        |Aliases                   |
|----------|--------|--------|---------------------|--------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|MemberNisNetgroupAttribute|

#### **NisNetgroupTriple**
Name that represents the RFC 2307 nisNetgroupTriple attribute.

|Type      |Required|Position|PipelineInput        |Aliases                   |
|----------|--------|--------|---------------------|--------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|NisNetgroupTripleAttribute|

#### **WindowsAccount**
Attribute name to be used to get the windows account information for a unix user account.

|Type      |Required|Position|PipelineInput        |Aliases                |
|----------|--------|--------|---------------------|-----------------------|
|`[String]`|false   |named   |true (ByPropertyName)|WindowsAccountAttribute|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **EnableRfc2307bis**
Indicates whether RFC 2307bis is enabled for client schema.

|Type       |Required|Position|PipelineInput        |Aliases            |
|-----------|--------|--------|---------------------|-------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|IsRfc2307bisEnabled|

#### **GroupOfUniqueNamesObjectClass**
Name that represents the RFC 2307bis groupOfUniqueNames object class.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **UniqueMemberAttribute**
Name that represents the RFC 2307bis uniqueMember attribute.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NisMapEntryAttribute**
Name that represents the  RFC 2307 nisMapEntry Attribute.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NisMapNameAttribute**
Name that represents the  RFC 2307 nisMapName Attribute

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NisObjectClass**
Name that represents the  RFC 2307 nisObject Object Class.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **WindowsToUnixObjectClass**
Name that represents the windowsToUnix object class.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **WindowsToUnixAttribute**
Attribute name to be used to get the unix account information for a windows user account.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NoDomainPrefixForWindowsToUnix**
Specify if the name for windows to unix name mapping should have no domain prefix

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ldap.LdapClientSchema

---

### Notes
Category: ldap
API: ldap-client-schema-modify
Family: cluster,vserver

---

### Syntax
```PowerShell
Set-NcLdapClientSchema [-Name] <String> [-Comment <String>] [-PosixAccount <String>] [-PosixGroup <String>] [-NisNetgroup <String>] [-Uid <String>] [-UidNumber <String>] [-GidNumber <String>] 
```
```PowerShell
[-GroupCn <String>] [-NetGroupCn <String>] [-UserPassword <String>] [-Gecos <String>] [-HomeDirectory <String>] [-LoginShell <String>] [-MemberUid <String>] [-MemberNisNetgroup <String>] 
```
```PowerShell
[-NisNetgroupTriple <String>] [-WindowsAccount <String>] [-VserverContext <String>] [-EnableRfc2307bis <Boolean>] [-GroupOfUniqueNamesObjectClass <String>] [-UniqueMemberAttribute <String>] 
```
```PowerShell
[-NisMapEntryAttribute <String>] [-NisMapNameAttribute <String>] [-NisObjectClass <String>] [-WindowsToUnixObjectClass <String>] [-WindowsToUnixAttribute <String>] 
```
```PowerShell
[-NoDomainPrefixForWindowsToUnix] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
