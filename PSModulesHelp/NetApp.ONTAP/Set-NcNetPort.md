Set-NcNetPort
-------------

### Synopsis
Modify the attributes of network port.

---

### Description

Modify the attributes of network port.

---

### Related Links
* [Get-NcNetPort](Get-NcNetPort)

* [Update-NcNetPort](Update-NcNetPort)

---

### Examples
> Example 1

```PowerShell
Get-NcNetPort e2c -Node * | Set-NcNetPort -Up
Get the 'e2c' ports on all nodes and set their administrative status to 'up'.
```

---

### Parameters
#### **Name**
Specifies the name of port.

|Type      |Required|Position|PipelineInput        |Aliases                                  |
|----------|--------|--------|---------------------|-----------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|PortName<br/>Port<br/>IfgrpName<br/>Ifgrp|

#### **Node**
Specifies the name of the node that owns the port.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |2       |true (ByPropertyName)|NodeName|

#### **Role**
Specifies the role associated with the port.  Possible values:
"undef"          - No defined role
"cluster"        - Used for communication using the private cluster network
"data"           - Used for communicating with file service clients
"node_mgmt"      - Used by administrators to configure the node
"intercluster"   - Used for communication with a different cluster
 This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Mtu**
Specifies the maximum transmission unit (MTU) of the port. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **AutoNegotiate**
Enables or disables ethernet auto-negotiation of speed, duplex and flow control. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |Aliases                      |
|-----------|--------|--------|---------------------|-----------------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|IsAdministrativeAutoNegotiate|

#### **Duplex**
Specifies the user preferred duplex setting of the port.  Possible values:
"undef"     - No defined duplex
"auto"      - Auto-negotiate duplex setting for link
"half"      - Half-duplex link usage
"full"      - Full-duplex link usage
 This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|false   |named   |true (ByPropertyName)|AdministrativeDuplex|

#### **Speed**
Specifies the user preferred speed setting of the port.  Possible values:
"undef"     - No defined speed
"auto"      - Auto-negotiate speed for link
"10"        - 10 megabits per second
"100"       - 100 megabits per second
"1000"      - 1 gigabit per second
"10000"     - 10 gigabits per second
 This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|false   |named   |true (ByPropertyName)|AdministrativeSpeed|

#### **FlowControl**
Specifies the user preferred flow control setting of the port. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases                  |
|----------|--------|--------|---------------------|-------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|AdministrativeFlowControl|

#### **Up**
If specified, set the state of the port to 'up'.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Switch]`|false   |named   |false        |AdministrativeUp|

#### **Down**
If specified, set the state of the port to 'down'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutoRevertDelay**
For a port with role 'cluster', specifies the delay in seconds before autoreverting a LIF to this port. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Ipspace**
Specifies the port's associated IPspace name. Note: the 'Cluster' ipspace is reserved for cluster ports. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|false   |named   |true (ByPropertyName)|IpspaceName|

#### **PortType**
Specifies the type of port.  Possible values:
"physical"  - Physical network interface
"if_group"  - Logical interface group (IEEE 802.3, section 43)
"vlan"      - Virtual LAN (IEEE 802.1Q)
"undef"     - No defined port type
 This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|Type   |

#### **InterfaceGroupNode**
Specifies the name of the node on which interface group (ifgrp) is created.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|false   |named   |true (ByPropertyName)|IfgrpNode|

#### **InterfaceGroupPort**
For a port of type 'ifgrp', specifies the name of the physical port on which ifgrp is created. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|false   |named   |true (ByPropertyName)|IfgrpPort|

#### **InterfaceGroupDistributionFunction**
For a port of type 'ifgrp', specifies the traffic distribution function.  Possible values:
"mac"            - Network traffic is distributed on the basis of MAC addresses
"ip"             - Network traffic is distributed on the basis of IP addresses
"sequential"     - Network traffic is distributed round-robin to each interface
"port"           - Network traffic is distributed by transport layer address 4-tuple
 This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases                  |
|----------|--------|--------|---------------------|-------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|IfgrpDistributionFunction|

#### **InterfaceGroupMode**
For a port of type 'ifgrp', specifies the link policy.  Possible values:
"multimode"      - All links are simultaneously active
"multimode_lacp" - Link state is managed by the switch using link aggregation control protocol (LACP) (IEEE 802.3ad)
"singlemode"     - Only one link is active at a time
 This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|false   |named   |true (ByPropertyName)|IfgrpMode|

#### **MtuAdmin**
The user preferred maximum transmission unit (MTU) of the port. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **IgnoreHealthStatus**
If specified, the system ignores the specified port's health status. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **BroadcastDomain**
Broadcast domain name and Ipspace name provided on input. To instantiate the object please create object using New-Object DataONTAP.C.Types.Net.BroadcastDomain. This parameter is supported with Rest only. This parameter is supported with Rest only.

|Type                                     |Required|Position|PipelineInput        |
|-----------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Net.BroadcastDomain]`|false   |named   |true (ByPropertyName)|

#### **Reachability**
Reachability status of the port. Enum value 'ok'. Only ports that have reachability as 'repairable' can be repaired. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |named   |true (ByPropertyName)|Repairable|

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
* DataONTAP.C.Types.Net.NetPortInfo

---

### Notes
Category: net
API: net-port-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcNetPort [-Name] <String> [-Node] <String> [-Role <String>] [-Mtu <Int32>] [-AutoNegotiate <Boolean>] [-Duplex <String>] [-Speed <String>] [-FlowControl <String>] [-Up] [-Down] 
```
```PowerShell
[-AutoRevertDelay <Int32>] [-Ipspace <String>] [-PortType <String>] [-InterfaceGroupNode <String>] [-InterfaceGroupPort <String>] [-InterfaceGroupDistributionFunction <String>] 
```
```PowerShell
[-InterfaceGroupMode <String>] [-MtuAdmin <Int64>] [-IgnoreHealthStatus] [-BroadcastDomain <DataONTAP.C.Types.Net.BroadcastDomain>] [-Reachability <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
