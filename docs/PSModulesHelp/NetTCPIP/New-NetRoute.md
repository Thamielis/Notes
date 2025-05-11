New-NetRoute
------------

### Synopsis
Creates a route in the IP routing table.

---

### Description

The New-NetRoute cmdlet creates an IP route in the IP routing table. Specify the destination prefix, and specify an interface by using the interface alias or the interface index.

IP routing is the process of forwarding a packet based on the destination IP address. Routing occurs at TCP/IP hosts and at IP routers. The sending host or router determines where to forward the packet. To determine where to forward a packet, the host or router consults a routing table that is stored in memory. When TCP/IP starts, it creates entries in the routing table. You can add entries either manually or automatically.

For more information about routing, see Chapter 5 - IP Routing (http://technet.microsoft.com/library/bb727001.aspx) in the TechNet library.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkID=288396)

* [Find-NetRoute](Find-NetRoute)

* [Get-NetRoute](Get-NetRoute)

* [Remove-NetRoute](Remove-NetRoute)

* [Set-NetRoute](Set-NetRoute)

* [Set-NetIPInterface](Set-NetIPInterface)

---

### Examples
> Example 1: Add an IP route to the routing table

```PowerShell
PS C:\>New-NetRoute –DestinationPrefix "10.0.0.0/24" –InterfaceIndex 12 –NextHop 192.168.0.1
PS C:\> Get-NetRoute | Format-List -Property *
This example adds a routing table entry, and then displays the properties of all the entries in the routing table.

The first command creates a route for the destination prefix 10.0.0.0/24 for the interface that has the index of 12. The command specifies 192.168.0.1 as the next hop.

The second command uses the Get-NetRoute cmdlet to get all the routes for the computer, and then passes them to the Format-List cmdlet by using the pipeline operator. The Format-List cmdlet can display all the properties of an object. For more information, type Get-Help Format-List.
```

---

### Parameters
#### **AddressFamily**
Specifies the IP address family. The cmdlet uses the family that you specify for the IP route.  The acceptable values for this parameter are:
-- IPv4
-- IPv6
If you do not specify this parameter, the cmdlet selects a value based on the other input that you provide.
Valid Values:

* IPv4
* IPv6

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[AddressFamily]`|false   |named   |false        |

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **DestinationPrefix**
Specifies a destination prefix of an IP route. A destination prefix consists of an IP address prefix and a prefix length, separated by a slash (/). A value of 0.0.0.0/0 for IPv4 or ::/0 for IPv6 indicates that the value of the NextHop parameter is a default gateway. The prefix length of the local host must match the prefix specified in this parameter, with all remaining address fields set to zero.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **InterfaceAlias**
Specifies the alias of a network interface. The cmdlet adds a route for the interface that has the alias that you specify.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies the index of a network interface. The cmdlet adds a route for the interface located at the index that you specify.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[UInt32]`|true    |named   |True (ByPropertyName)|ifIndex|

#### **NextHop**
Specifies the next hop for the IP route. The cmdlet assigns the next hop that you specify to the IP route. A value of 0.0.0.0 for IPv4 or :: for IPv6 indicates that the route is on the local subnet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PolicyStore**
Specifies the PolicyStore value. The cmdlet assigns the PolicyStore value that you specify to the IP route. The acceptable values for this parameter are:
-- ActiveStore. The IP address information is valid. 
-- PersistentStore. The computer saves IP address information across restarts. When the computer restarts, it copies the saved settings to the ActiveStore. 
The default value is ActiveStore. Specify ActiveStore only.
If you do not specify this parameter, the default entries are created in both the ActiveStore and the PersistentStore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PreferredLifetime**
Specifies a preferred lifetime, as a TimeSpan object, of an IP route.The cmdlet assigns the lifetime that you specify to the IP route. To obtain a TimeSpan object, use the New-TimeSpan cmdlet. For more information, type Get-Help New-TimeSpan. The default value for a lifetime is infinite.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **Protocol**
Specifies the type of routing protocol. The cmdlet assigns the protocol that you specify to the IP route. The acceptable values for this parameter are:
-- Bbn
-- Bgp
-- Dhcp
-- Dvmrp
-- Egp
-- Eigrp
-- EsIs
-- Ggp
-- Hello
-- Icmp
-- Idpr
-- Igrp
-- IsIs
-- Local
-- NetMgmt
-- Ospf
-- Rip
-- Rpl
-- Other
The default value is NetMgmt.
Valid Values:

* Other
* Local
* NetMgmt
* Icmp
* Egp
* Ggp
* Hello
* Rip
* IsIs
* EsIs
* Igrp
* Bbn
* Ospf
* Bgp
* Idpr
* Eigrp
* Dvmrp
* Rpl
* Dhcp

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Protocol]`|false   |named   |false        |

#### **Publish**
Specifies the publish setting of an IP route. The cmdlet assigns the publish setting that you specify to the IP route. The acceptable values for this parameter are:
-- No. Do not publish or advertise IP route information in router advertisements. 
-- Yes. Publish and advertise IP route information with an infinite valid lifetime in router advertisements. 
-- Age. Publish and advertise IP route information with a finite valid lifetime in router advertisements. Specify a valid lifetime by using the ValidLifetime parameter. 
The default value is No.
Valid Values:

* No
* Age
* Yes

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Publish]`|false   |named   |false        |

#### **RouteMetric**
Specifies an integer route metric for an IP route. The cmdlet assigns the metric that you specify to the IP route. The default value is 256. To choose among multiple routes, the computer adds this value. The computer selects the route with the lowest combined value. To modify the interface metric, use the Set-NetIPInterface cmdlet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **ValidLifetime**
Specifies a valid lifetime, as a TimeSpan object, for an IP route. The cmdlet assigns the lifetime setting that you specify to the IP route. To obtain a TimeSpan object, use the New-TimeSpan cmdlet. The default value is infinite.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
None

---

### Outputs
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetRoute

---

### Syntax
```PowerShell
New-NetRoute [-DestinationPrefix] <String> [-AddressFamily {IPv4 | IPv6}] [-CimSession <CimSession[]>] [-NextHop <String>] [-PolicyStore <String>] [-PreferredLifetime <TimeSpan>] [-Protocol {Other | Local | NetMgmt | Icmp | Egp | Ggp | Hello | Rip | IsIs | EsIs | Igrp | Bbn | Ospf | Bgp | Idpr | Eigrp | Dvmrp | Rpl | Dhcp}] [-Publish {No | Age | Yes}] [-RouteMetric <UInt16>] [-ThrottleLimit <Int32>] [-ValidLifetime <TimeSpan>] -InterfaceAlias <String> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
New-NetRoute [-DestinationPrefix] <String> [-AddressFamily {IPv4 | IPv6}] [-CimSession <CimSession[]>] [-NextHop <String>] [-PolicyStore <String>] [-PreferredLifetime <TimeSpan>] [-Protocol {Other | Local | NetMgmt | Icmp | Egp | Ggp | Hello | Rip | IsIs | EsIs | Igrp | Bbn | Ospf | Bgp | Idpr | Eigrp | Dvmrp | Rpl | Dhcp}] [-Publish {No | Age | Yes}] [-RouteMetric <UInt16>] [-ThrottleLimit <Int32>] [-ValidLifetime <TimeSpan>] -InterfaceIndex <UInt32> [-Confirm] [-WhatIf] [<CommonParameters>]
```
