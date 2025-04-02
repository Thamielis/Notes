Set-NcLdapClient
----------------

### Synopsis
Modify an existing Lightweight Directory Access Protocol (LDAP) client configuration.

---

### Description

Modify an existing Lightweight Directory Access Protocol (LDAP) client configuration.

The cmdlet works in the cluster context in ONTAP versions prior to 8.2.  in ONTAP 8.2 and later, the cmdlet works in the vserver context.

---

### Related Links
* [New-NcLdapClient](New-NcLdapClient)

---

### Parameters
#### **Name**
The name of the LDAP client configuration.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|true    |1       |true (ByPropertyName)|LdapClientConfig|

#### **Schema**
LDAP schema to use for this configuration. The list of possible schemas can be obtained using the Get-NcLdapClientSchema cmdlet.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Servers**
List of LDAP Server IP addresses to use for this configuration. The option is NOT applicable for configurations using Active Directory LDAP servers.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |named   |true (ByPropertyName)|LdapServers|

#### **AdDomain**
The Active Directory Domain Name for this LDAP configuration. The option is ONLY applicable for configurations using Active Directory LDAP servers.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PreferredAdServers**
Preferred Active Directory (AD) Domain controllers to use for this configuration. This option is ONLY applicable for configurations using Active Directory LDAP servers

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **BindAsCifsServer**
If true, the cluster will use the CIFS server's credentials to bind to the LDAP server. If omitted, this parameter defaults to 'true' if the configuration uses Active Directory LDAP and defaults to 'false' otherwise.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **TcpPort**
The TCP port on the LDAP server to use for this configuration. If omitted, this parameter defaults to 389.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **QueryTimeout**
Maximum time in seconds to wait for a query response from the LDAP server. The default for this parameter is 3 seconds.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MinBindLevel**
The minimum authentication level that can be used to authenticate with the LDAP server. If omitted, this parameter defaults to 'sasl' if the configuration uses Active Directory LDAP. For configurations that use LDAP servers from other vendors, this parameter defaults to 'simple' if a BindDn is specified and 'anonymous' otherwise. Possible values:
"anonymous" - Anonymous bind
"simple"    - Simple bind
"sasl"      - Simple Authentication and Security Layer (SASL) bind

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **BindDn**
The Bind Distinguished Name (DN) is the LDAP identity used during the authentication process by the clients. This is required if the LDAP server does not support anonymous binds. This field is not used if BindAsCifsServer is set to 'true'. Example : cn=username,cn=Users,dc=example,dc=com

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **BindPassword**
The password to be used with the BindDn.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **BaseDn**
Indicates the starting point for searches within the LDAP directory tree. If omitted, searches will start at the root of the directory tree.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **BaseScope**
This indicates the scope for LDAP search. If omitted, this parameter defaults to 'subtree'. Possible values:
"base"      - Search only the base directory entry
"onelevel"  - Search the base directory entry and the children of the base entry
"subtree"   - Search the base directory entry and all its descendants

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **UserDn**
The User Distinguished Name (DN), if specified, is used as the starting point in the LDAP directory tree for user lookups. If this parameter is omitted, user lookups will start at the BaseDn.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **UserScope**
This indicates the scope for LDAP search when doing user lookups. Possible values:
"base"      - Search only the base directory entry
"onelevel"  - Search the base directory entry and the children of the base entry
"subtree"   - Search the base directory entry and all its descendants

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **GroupDn**
The Group Distinguished Name (DN), if specified, is used as the starting point in the LDAP directory tree for group lookups. If not specified, group lookups will start at the BaseDn.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **GroupScope**
This indicates the scope for LDAP search when doing group lookups. Possible values:
"base"      - Search only the base directory entry
"onelevel"  - Search the base directory entry and the children of the base entry
"subtree"   - Search the base directory entry and all its descendants

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NetGroupDn**
The Netgoup Distinguished Name (DN), if specified, is used as the starting point in the LDAP directory tree for netgroup lookups. If not specified, netgroup lookups will start at the BaseDn.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NetGroupScope**
This indicates the scope for LDAP search when doing netgroup lookups. Possible values:
"base"      - Search only the base directory entry
"onelevel"  - Search the base directory entry and the children of the base entry
"subtree"   - Search the base directory entry and all its descendants

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **UseStartTls**
If true, start_tls will be used over LDAP connections.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **IsNetgroupByHostEnabled**
Indicates whether netgroup.byhost map should be queried for lookups.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **NetgroupByHostScope**
Indicates the scope for LDAP search when doing netgroup byhost lookups.. Possible values:
"base"      - Search only the base directory entry
"onelevel"  - Search the base directory entry and the children of the base entry
"subtree"   - Search the base directory entry and all its descendants

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AllowSsl**
Specify to allow the use of SSL for the TLS Handshake Protocol over the LDAP connections.

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[Switch]`|false   |named   |false        |EnableSsl|

#### **SessionSecurity**
This indicates the level of security for LDAP communications. Accepted values are 'none', 'sign' and 'seal'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ObsPassword**
Encrypted password

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SkipConfigValidation**
Specify in order to Skip validation of the the corresponding Lightweight Directory Access Protocol (LDAP) client configuration

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **GroupMembershipFilter**
This indicates the custom filter to be used while looking up group membership from an LDAP server.
This parameter is available in ONTAP 9.5 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ReferralEnabled**
If true, the corresponding Lightweight Directory Access Protocol (LDAP) configuration is enabled for LDAP referral chasing for this Vserver.
This parameter is available in ONTAP 9.5 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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

#### **DisallowSsl**
Specify to stop the use of SSL for the TLS Handshake Protocol over the LDAP connections.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|false   |named   |false        |DisableSsl|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ldap.LdapClient

---

### Notes
Category: ldap
API: ldap-client-modify
Family: cluster,vserver

---

### Syntax
```PowerShell
Set-NcLdapClient [-Name] <String> [-Schema <String>] [-Servers <String[]>] [-AdDomain <String>] [-PreferredAdServers <String[]>] [-BindAsCifsServer <Boolean>] [-TcpPort <Int32>] 
```
```PowerShell
[-QueryTimeout <Int32>] [-MinBindLevel <String>] [-BindDn <String>] [-BindPassword <String>] [-BaseDn <String>] [-BaseScope <String>] [-UserDn <String>] [-UserScope <String>] [-GroupDn 
```
```PowerShell
<String>] [-GroupScope <String>] [-NetGroupDn <String>] [-NetGroupScope <String>] [-UseStartTls <Boolean>] [-VserverContext <String>] [-IsNetgroupByHostEnabled <Boolean>] 
```
```PowerShell
[-NetgroupByHostScope <String>] [-AllowSsl] [-SessionSecurity <String>] [-ObsPassword <String>] [-SkipConfigValidation] [-GroupMembershipFilter <String>] [-ReferralEnabled <Boolean>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcLdapClient [-Name] <String> [-Schema <String>] [-Servers <String[]>] [-AdDomain <String>] [-PreferredAdServers <String[]>] [-BindAsCifsServer <Boolean>] [-TcpPort <Int32>] 
```
```PowerShell
[-QueryTimeout <Int32>] [-MinBindLevel <String>] [-BindDn <String>] [-BindPassword <String>] [-BaseDn <String>] [-BaseScope <String>] [-UserDn <String>] [-UserScope <String>] [-GroupDn 
```
```PowerShell
<String>] [-GroupScope <String>] [-NetGroupDn <String>] [-NetGroupScope <String>] [-UseStartTls <Boolean>] [-VserverContext <String>] [-IsNetgroupByHostEnabled <Boolean>] 
```
```PowerShell
[-NetgroupByHostScope <String>] [-DisallowSsl] [-SessionSecurity <String>] [-ObsPassword <String>] [-SkipConfigValidation] [-GroupMembershipFilter <String>] [-ReferralEnabled <Boolean>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
