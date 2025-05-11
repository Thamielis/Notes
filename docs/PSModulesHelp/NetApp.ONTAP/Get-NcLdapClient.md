Get-NcLdapClient
----------------

### Synopsis
Get the list of Lightweight Directory Access Protocol (LDAP) client configurations for the cluster.

---

### Description

Get the list of Lightweight Directory Access Protocol (LDAP) client configurations for the cluster.

---

### Related Links
* [Set-NcLdapClient](Set-NcLdapClient)

* [New-NcLdapClient](New-NcLdapClient)

* [Remove-NcLdapClient](Remove-NcLdapClient)

---

### Examples
> Example 1

```PowerShell
Get-NcLdapClient -Name ldap_client
Get the LDAP client with the specified name.

AdDomain                  :
BaseDn                    :
BaseScope                 : subtree
BindAsCifsServer          : False
BindDn                    :
BindPassword              :
GroupDn                   :
GroupScope                : subtree
LdapClientConfig          : ldap_client
MinBindLevel              : anonymous
NcController              : 192.168.182.144
NetgroupDn                :
NetgroupScope             : subtree
PreferredAdServers        :
QueryTimeout              : 3
Schema                    : RFC-2307
Servers                   : {192.168.182.50}
TcpPort                   : 389
UserDn                    :
UserScope                 : subtree
BindAsCifsServerSpecified : True
QueryTimeoutSpecified     : True
TcpPortSpecified          : True

```
> Example 2

```PowerShell
$q = Get-NcLdapClient -Template
$q.Servers = @("192.168.182.50|192.168.182.51")
Get-NcLdapClient -Query $q
Get the LDAP client(s) that use at least one of the given servers.

AdDomain                  :
BaseDn                    :
BaseScope                 : subtree
BindAsCifsServer          : False
BindDn                    :
BindPassword              :
GroupDn                   :
GroupScope                : subtree
LdapClientConfig          : ldap_client
MinBindLevel              : anonymous
NcController              : 192.168.182.144
NetgroupDn                :
NetgroupScope             : subtree
PreferredAdServers        :
QueryTimeout              : 3
Schema                    : RFC-2307
Servers                   : {192.168.182.50}
TcpPort                   : 389
UserDn                    :
UserScope                 : subtree
BindAsCifsServerSpecified : True
QueryTimeoutSpecified     : True
TcpPortSpecified          : True

```

---

### Parameters
#### **Name**
One or more names of LDAP client configurations.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Schema**
One or more names of LDAP schemas.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a LdapClient object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcLdapClient -Template" to get the initially empty LdapClient object.  If not specified, all data is returned for each object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[LdapClient]`|false   |named   |false        |

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
Specify to get an empty LdapClient object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a LdapClient object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcLdapClient -Template" to get the initially empty LdapClient object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[LdapClient]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ldap.LdapClient

---

### Notes
Category: ldap
API: ldap-client-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcLdapClient [[-Name] <String[]>] [[-Schema] <String[]>] [-Attributes <LdapClient>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLdapClient -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLdapClient -Query <LdapClient> [-Attributes <LdapClient>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
