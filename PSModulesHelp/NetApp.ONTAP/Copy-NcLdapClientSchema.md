Copy-NcLdapClientSchema
-----------------------

### Synopsis
Copy an existing LDAP schema.

---

### Description

Copy an existing LDAP schema. If the LDAP server that the storage system needs to query does not support any of the default read-only schemas, this cmdlet can be used to create an editable copy of an existing read-only schema. After copying the schema, the copy can be modified using the Set-NcLdapClientSchema cmdlet.

The cmdlet works in the cluster context in ONTAP versions prior to 8.2.  in ONTAP 8.2 and later, the cmdlet works in the vserver context.

---

### Related Links
* [Get-NcLdapClientSchema](Get-NcLdapClientSchema)

* [Set-NcLdapClientSchema](Set-NcLdapClientSchema)

* [Remove-NcLdapClientSchema](Remove-NcLdapClientSchema)

---

### Examples
> Example 1

```PowerShell
Copy-NcLdapClientSchema -Name AD-SFU -NewName AD-SFU-copy
Make a copy of the read-only schema "AD-SFU" and name if "AD-SFU-copy".

Schema                     : AD-SFU-copy
NcController               : 192.168.182.144
CnGroupAttribute           : cn
CnNetgroupAttribute        : name
Comment                    :
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
The name of the schema to copy.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Schema |

#### **NewName**
The name to give the new schema.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |2       |true (ByPropertyName)|NewSchemaName|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ldap.LdapClientSchema

---

### Notes
Category: ldap
API: ldap-client-schema-copy
Family: cluster,vserver

---

### Syntax
```PowerShell
Copy-NcLdapClientSchema [-Name] <String> [-NewName] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
