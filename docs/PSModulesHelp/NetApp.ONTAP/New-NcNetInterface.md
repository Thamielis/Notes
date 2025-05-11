New-NcNetInterface
------------------

### Synopsis
Create a new logical interface (LIF).

---

### Description

Create a new logical interface (LIF).

---

### Related Links
* [Get-NcNetInterface](Get-NcNetInterface)

* [Set-NcNetInterface](Set-NcNetInterface)

* [Remove-NcNetInterface](Remove-NcNetInterface)

---

### Examples
> Example 1

```PowerShell
New-NcNetInterface -Name vs1vif1 -Vserver vserver1 -Role data -Node fas3070cluster01-01 -Port e0a -DataProtocols iscsi -Address 10.61.172.160 -Netmask 255.255.255.0 -FirewallPolicy data -AdministrativeStatus down
Create a new iSCSI data LIF 'vs1vif1' on vserver 'vserver1'.

NcController             : 10.61.172.155
Address                  : 10.61.172.160
AdministrativeStatus     : down
CurrentNode              : fas3070cluster01-01
CurrentPort              : e0a
DataProtocols            : {iscsi}
DnsDomainName            : none
FailoverGroup            :
FailoverPolicy           : disabled
FirewallPolicy           : data
HomeNode                 : fas3070cluster01-01
HomePort                 : e0a
InterfaceName            : vs1vif1
IsAutoRevert             : False
IsHome                   : True
IsIpv4LinkLocal          :
Netmask                  : 255.255.255.0
NetmaskLength            : 24
OperationalStatus        : down
Role                     : data
RoutingGroupName         : d10.61.172.0/24
UseFailoverGroup         : disabled
Vserver                  : vserver1
IsAutoRevertSpecified    : True
IsHomeSpecified          : True
IsIpv4LinkLocalSpecified : False
NetmaskLengthSpecified   : True
OpStatus                 : down

```

---

### Parameters
#### **Name**
Specifies the logical interface (LIF) name.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |1       |true (ByPropertyName)|InterfaceName|

#### **Vserver**
Specifies the Vserver name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Role**
Specifies the role of the LIF.  Possible values:
"undef"          - No defined role
"cluster"        - Used for communication using the private cluster network
"data"           - Used for communicating with file service clients (default)
"node_mgmt"      - Used by administrators to configure the node
"intercluster"   - Used for communication with a different cluster
"cluster_mgmt"   - Used by administrators to configure the cluster

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Node**
Specifies the LIF's home node.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |4       |true (ByPropertyName)|HomeNode|

#### **Port**
Specifies the LIF's home port.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |5       |true (ByPropertyName)|HomePort|

#### **DataProtocols**
Specifies the list of data protocols configured on the LIF.  By default, the values in this element are nfs, cifs and fcache. Other supported protocols are iscsi and fcp.  A LIF can be configured to not support any data protocols by specifying 'none'.  Protocol values of none, iscsi or fcp can't be combined with any other data protocol(s).  Possible values:
"nfs"       - Used for NFS connections
"cifs"      - Used for CIFS connections
"iscsi"     - Used for iSCSI connections
"fcp"       - Used for Fibre Channel connections
"fcache"    - Used for FlexCache connections
"none"      - Used for management. Does not serve any file protocols.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |6       |true (ByPropertyName)|Protocol|

#### **Address**
Specifies the LIF's IP address.  This element is valid for all data protocols except FCP.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Netmask**
Specifies the LIF's netmask.  This element is valid for all data protocols except FCP.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Ipv4LinkLocal**
If true, automatically configure an interface with an IPv4 address (cluster LIFs only).  User can configure an interface by explicitly specifying Address and Netmask or by setting Ipv4LinkLocal to true. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **RoutingGroup**
Specifies the routing group, which enables multiple logical interfaces to share a set of routing table entries. For example: 
d192.168.1.0/24 ('d' stands for data LIF and 192.168.1.0/24 is subnet)
c192.168.1.0/24 ('c' stands for cluster LIF and 192.168.1.0/24 is subnet)
n192.168.1.0/24 ('n' stands for node management LIF and 192.168.1.0/24 is subnet). This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|false   |named   |true (ByPropertyName)|RoutingGroupName|

#### **DnsDomain**
Specifies the unique, fully qualified domain name of the DNS zone of this LIF.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|false   |named   |true (ByPropertyName)|DnsDomainName|

#### **FirewallPolicy**
Specifies the firewall policy for the LIF.  Default firewall policy is set as per the following table:
LIF Role     Protocols   Default policy
-------      ---------   --------------
data            none          mgmt
data            any           data
node_mgmt       any           mgmt
cluster_mgmt    any           mgmt
cluster         any          cluster
intercluster    any       intercluster

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **FailoverPolicy**
Specifies the failover policy for the LIF.  For FCP and iSCSI LIFs, the only failover policy is 'disabled'; for NFS, CIFs and fcache LIFs, the default policy is 'nextavail'.  Possible values:
"nextavail" - Next failover target selected based on next available port ID
"priority"  - Next failover target selected based on lowest available port ID
"disabled"  - Failover disabled

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **FailoverGroup**
Specifies the failover group name. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **UseFailoverGroup**
Specifies whether failover rules are automatically created, manually created by the administrator, or disabled.  For FCP and iSCSI LIFs, the default policy is 'disabled'; for NFS, CIFs and fcache LIFs, the default policy is 'system_defined'.  Possible values: 
"system_defined" - Use port roles to select failover targets
"disabled"       - Failover disabled
"enabled"        - Use a failover group to select failover targets
This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AutoRevert**
If true, data LIF will revert to its home node under certain circumstances such as startup, and load balancing migration capability is disabled automatically.  Default: false

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **AdministrativeStatus**
Specifies the administrative status of the LIF.  The administrative status can differ from the operational status; for instance, if you specify the status as up but a network problem prevents the interface from functioning, the operational status remains as down.  Possible values: 'up', 'down', 'unknown'

|Type      |Required|Position|PipelineInput        |Aliases               |
|----------|--------|--------|---------------------|----------------------|
|`[String]`|false   |named   |true (ByPropertyName)|Status<br/>AdminStatus|

#### **Comment**
Comment to give the created interface. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NetmaskLength**
The number of bits in the netmask.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **ListenForDnsQuery**
If true, this IP address will listen for DNS queries for the dns-zone specified. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Subnet**
Subnet where the interface address is allocated from.  If the option is not used, the IP address will need to be provided by the administrator during configuration.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |named   |true (ByPropertyName)|SubnetName|

#### **ForceSubnetAssociation**
If specified, force the LIF's subnet association.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Wwpn**
The LIF's WWPN.
This element is valid for FCP LIFs only.
Note: This parameter is not available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DnsUpdateEnabled**
Specifies if DNS update is enabled for this LIF

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **ServicePolicy**
The service policy of the new interface. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RdmaProtocols**
Supported RDMA offload protocols. This parameter is supported with Rest only.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Vip**
True for a VIP interface, whose location is announced via BGP. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Ipspace**
Ipspace name. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Scope**
Specify the scope to fetch records supported by REST. Possible values: 'svm', 'cluster'. This parameter is supported with Rest only.
Valid Values:

* svm
* cluster

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetInterfaceInfo

---

### Notes
Category: net
API: net-interface-create
Family: cluster

---

### Syntax
```PowerShell
New-NcNetInterface [-Name] <String> [-Vserver] <String> [-Role] <String> [-Node] <String> [-Port] <String> [[-DataProtocols] <String[]>] [-Address <String>] [-Netmask <String>] 
```
```PowerShell
[-Ipv4LinkLocal <Boolean>] [-RoutingGroup <String>] [-DnsDomain <String>] [-FirewallPolicy <String>] [-FailoverPolicy <String>] [-FailoverGroup <String>] [-UseFailoverGroup <String>] 
```
```PowerShell
[-AutoRevert <Boolean>] [-AdministrativeStatus <String>] [-Comment <String>] [-NetmaskLength <Int32>] [-ListenForDnsQuery] [-Subnet <String>] [-ForceSubnetAssociation] [-Wwpn <String>] 
```
```PowerShell
[-DnsUpdateEnabled <Boolean>] [-ServicePolicy <String>] [-RdmaProtocols <String[]>] [-Vip <Boolean>] [-Ipspace <String>] [-Scope <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
