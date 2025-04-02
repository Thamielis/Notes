Set-NcNetInterface
------------------

### Synopsis
Modify the attributes of a network interface (LIF).

---

### Description

Modify the attributes of a network interface (LIF).

---

### Related Links
* [Get-NcNetInterface](Get-NcNetInterface)

* [New-NcNetInterface](New-NcNetInterface)

* [Remove-NcNetInterface](Remove-NcNetInterface)

* [Update-NcNetInterface](Update-NcNetInterface)

---

### Examples
> Example 1

```PowerShell
Set-NcNetInterface vs1vif1 vserver1 -Address 10.61.172.162
Change the address on LIF 'vs1vif1'.

NcController             : 10.61.172.155
Address                  : 10.61.172.162
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
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Scope**
Specify the scope of the interface. Possible values are "svm" and "scope". This parameter is supported with REST only
Valid Values:

* cluster
* svm

|Type|Required|Position|PipelineInput        |
|----|--------|--------|---------------------|
|`[]`|false   |2       |true (ByPropertyName)|

#### **Node**
Specifies the LIF's home node.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |named   |true (ByPropertyName)|HomeNode|

#### **Port**
Specifies the LIF's home port.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |named   |true (ByPropertyName)|HomePort|

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
If true, automatically configure an interface with an IPv4 address (cluster LIFs only).  User can configure an interface by explicitly specifying Address and Netmask or by setting Ipv4LinkLocal to true.
Note: This parameter is not available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

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
This parameter is supported with Ontapi only.

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
If true, data LIF will revert to its home node under certain circumstances such as startup, and load balancing migration capability is disabled automatically.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **AdministrativeStatus**
Specifies the administrative status of the LIF.  The administrative status can differ from the operational status; for instance, if you specify the status as up but a network problem prevents the interface from functioning, the operational status remains as down.  Possible values: 'up', 'down', 'unknown'

|Type      |Required|Position|PipelineInput        |Aliases               |
|----------|--------|--------|---------------------|----------------------|
|`[String]`|false   |named   |true (ByPropertyName)|Status<br/>AdminStatus|

#### **Comment**
Comment to give the interface. This parameter is supported with Ontapi only.

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

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
Specifies whether DNS update is enabled for this LIF

|Type       |Required|Position|PipelineInput |
|-----------|--------|--------|--------------|
|`[Boolean]`|false   |named   |true (ByValue)|

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

#### **IsHome**
Specifies IsHome. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

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
API: net-interface-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcNetInterface [-Name] <String> [[-Vserver] <String>] [[-Scope] <String>] -Node <String> [-Port <String>] [-Address <String>] [-Netmask <String>] [-Ipv4LinkLocal <Boolean>] [-RoutingGroup 
```
```PowerShell
<String>] [-DnsDomain <String>] [-FirewallPolicy <String>] [-FailoverPolicy <String>] [-FailoverGroup <String>] [-UseFailoverGroup <String>] [-AutoRevert <Boolean>] [-AdministrativeStatus 
```
```PowerShell
<String>] [-Comment <String>] [-NetmaskLength <Int32>] [-ListenForDnsQuery <Boolean>] [-Subnet <String>] [-ForceSubnetAssociation] [-Wwpn <String>] [-DnsUpdateEnabled <Boolean>] 
```
```PowerShell
[-ServicePolicy <String>] [-RdmaProtocols <String[]>] [-IsHome <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
