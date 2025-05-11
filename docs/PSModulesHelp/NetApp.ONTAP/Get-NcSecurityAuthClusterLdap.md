Get-NcSecurityAuthClusterLdap
-----------------------------

### Synopsis
Retrieves the cluster LDAP configuration.

---

### Description

Retrieves the cluster LDAP configuration. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcSecurityAuthClusterLdap](New-NcSecurityAuthClusterLdap)

---

### Examples
> Example 1

Get-NcSecurityAuthClusterLdap
Retrieves the Ldap configuration of the cluster

NcController            : 10.236.69.71
BaseDn                  : dc=domainA,dc=example,dc=com
BaseScope               : subtree
BindAsCifsServer        :
BindDn                  : cn=Administrators,cn=users,dc=domainA,dc=example,dc=com
BindPassword            :
GroupDn                 :
GroupMembershipFilter   :
GroupScope              :
IsNetgroupByhostEnabled :
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
Servers                 : {10.10.10.10, domainB.example.com}
SessionSecurity         : none
SkipConfigValidation    :
Status                  :
TryChannelBinding       : True
UseStartTls             : True
UserDn                  :
UserScope               :

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide an SecurityAuthClusterLdap object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSecurityAuthClusterLdap -Template" to get the initially empty SecurityAuthClusterLdap object.  If not specified, all data is returned for each object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[SecurityAuthClusterLdap]`|false   |named   |false        |

#### **Template**
Specify to get an empty SecurityAuthClusterLdap object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityAuthClusterLdap

---

### Notes
Category: security
Api: /api/security/authentication/cluster/ldap
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecurityAuthClusterLdap -Template [-Attributes <SecurityAuthClusterLdap>] [<CommonParameters>]
```
