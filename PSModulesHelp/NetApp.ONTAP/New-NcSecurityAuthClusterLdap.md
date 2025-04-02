New-NcSecurityAuthClusterLdap
-----------------------------

### Synopsis
A cluster can have only one LDAP configuration. IPv6 must be enabled if IPv6 family addresses are specified.This cmdlet is supported with Rest

---

### Description

A cluster can have only one LDAP configuration. IPv6 must be enabled if IPv6 family addresses are specified.This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcSecurityAuthClusterLdap](Get-NcSecurityAuthClusterLdap)

---

### Examples
> Example 1

```PowerShell
New-NcSecurityAuthClusterLdap -BaseDn "dc=domainA" -BindDn "cn=Administrators" -Servers "10.10.10.10" -BaseScope subtree -BindAsCifsServer $true -IsNetgroupByhostEnabled $false
A cluster can have only one LDAP configuration. IPv6 must be enabled if IPv6 family addresses are specified.

NcController            : 10.236.69.71
BaseDn                  : dc=domainA
BaseScope               : subtree
BindAsCifsServer        : True
BindDn                  : cn=Administrators
BindPassword            :
GroupDn                 :
GroupMembershipFilter   :
GroupScope              :
IsNetgroupByhostEnabled : False
IsOwner                 :
LdapsEnabled            :
MinBindLevel            : anonymous
NetgroupByhostDn        :
NetgroupByhostScope     :
NetgroupDn              :
NetgroupScope           :
Port                    : 389
QueryTimeout            :
Schema                  : ad_idmu
Servers                 : {10.10.10.10}
SessionSecurity         : none
SkipConfigValidation    :
Status                  :
TryChannelBinding       :
UseStartTls             :
UserDn                  :
UserScope               :

```

---

### Parameters
#### **BaseDn**
Specifies the default base DN for all searches.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **BindDn**
Specifies the user that binds to the LDAP servers.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Servers**
List of LDAP servers used for this client configuration. This parameter takes both FQDNs and IP addresses

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

#### **BaseScope**
Specifies the default search scope for LDAP queries.
Valid Values:

* base
* onelevel
* subtree

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BindAsCifsServer**
Specifies whether or not CIFS server's credentials are used to bind to the LDAP server.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **BindPassword**
Specifies the bind password for the LDAP servers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GroupDn**
Specifies the group Distinguished Name (DN) that is used as the starting point in the LDAP directory tree for group lookups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GroupMembershipFilter**
Specifies the custom filter used for group membership lookups from an LDAP server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GroupScope**
Specifies the default search scope for LDAP for group lookups.
Valid Values:

* base
* onelevel
* subtree

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IsNetgroupByhostEnabled**
Specifies whether or not netgroup by host querying is enabled.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **LdapsEnabled**
Specifies whether or not LDAPS is enabled.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **MinBindLevel**
The minimum bind authentication level
Valid Values:

* anonymous
* simple
* sasl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NetgroupByhostDn**
Specifies the netgroup Distinguished Name (DN) that is used as the starting point in the LDAP directory tree for netgroup by host lookups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NetgroupByhostScope**
Specifies the default search scope for LDAP for netgroup by host lookups.
Valid Values:

* base
* onelevel
* subtree

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NetgroupDn**
Specifies the netgroup Distinguished Name (DN) that is used as the starting point in the LDAP directory tree for netgroup lookups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NetgroupScope**
Specifies the default search scope for LDAP for netgroup lookups.
Valid Values:

* base
* onelevel
* subtree

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Port**
The port used to connect to the LDAP Servers.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Long]`|false   |named   |false        |

#### **Schema**
The name of the Schema.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SessionSecurity**
Specifies the level of security to be used for LDAP communications.
Valid Values:

* none
* sign
* seal

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SkipConfigValidation**
Indicates whether or not the validation for the specified LDAP configuration is disabled

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **TryChannelBinding**
Specifies whether or not channel binding is attempted in the case of TLS/LDAPS.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **UseStartTls**
Specifies whether or not to use Start TLS over LDAP connections.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **UserDn**
Specifies the user Distinguished Name (DN) that is used as the starting point in the LDAP directory tree for user lookups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UserScope**
Specifies the default search scope for LDAP for user lookups.
Valid Values:

* base
* onelevel
* subtree

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityAuthClusterLdap

---

### Notes
Category: Security
API: /security/authentication/cluster/ldap
Family: cluster

---

### Syntax
```PowerShell
New-NcSecurityAuthClusterLdap [-BaseDn] <String> [-BindDn] <String> [-Servers] <String[]> [-BaseScope <String>] [-BindAsCifsServer <Boolean>] [-BindPassword <String>] [-GroupDn <String>] 
```
```PowerShell
[-GroupMembershipFilter <String>] [-GroupScope <String>] [-IsNetgroupByhostEnabled <Boolean>] [-LdapsEnabled <Boolean>] [-MinBindLevel <String>] [-NetgroupByhostDn <String>] 
```
```PowerShell
[-NetgroupByhostScope <String>] [-NetgroupDn <String>] [-NetgroupScope <String>] [-Port <Long>] [-QueryTimeout <Long>] [-Schema <String>] [-SessionSecurity <String>] [-SkipConfigValidation 
```
```PowerShell
<Boolean>] [-TryChannelBinding <Boolean>] [-UseStartTls <Boolean>] [-UserDn <String>] [-UserScope <String>] [<CommonParameters>]
```
