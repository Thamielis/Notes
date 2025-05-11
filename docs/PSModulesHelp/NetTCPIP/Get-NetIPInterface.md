Get-NetIPInterface
------------------

### Synopsis
Gets an IP interface.

---

### Description

The Get-NetIPInterface cmdlet gets an IP interface, including IPv4 and IPv6 addresses, and the associated address configuration for the IP interfaces. Without parameters, this cmdlet gets all of the IP interface properties on the computer, including virtual interfaces and loopback interfaces.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=288382)

* [Get-NetRoute](Get-NetRoute)

* [Set-NetIPInterface](Set-NetIPInterface)

---

### Examples
> Example 1: Get IP interface configuration

```PowerShell
PS C:\>Get-NetIPInterface
This command gets the IP interface configuration on the computer on which you run the cmdlet.
```
> Example 2: Get IP interface information for IPv6 addresses

```PowerShell
PS C:\>Get-NetIPInterface –AddressFamily IPv6
This command gets information about the IP interface configuration for all IP interfaces for which you have configured IPv6 addresses.
```
> Example 3: Get IP interface information and format the output

```PowerShell
PS C:\>Get-NetIPInterface | Format-Table
This command gets information about IP interface configuration, and displays that information in a table.
```
> Example 4: Get IP interface information by interface index

```PowerShell
PS C:\>Get-NetIPInterface –InterfaceIndex 12
This command gets information about the IP interface configuration for a specific interface index.
```
> Example 5: Get and sort IP interface information

```PowerShell
PS C:\>Get-NetIPInterface | Sort-Object –Property InterfaceIndex | Format-Table
This command gets information about IP address configuration, sorts them numerically by the interface index in the cmdlet name, and then displays them in a table format.
```
> Example 6: Get the IP interface by specifying the router lifetime

```PowerShell
PS C:\>Get-NetIPInterface | Where-Object -FilterScript { $_.AdvertisedRouterLifetime.TotalSeconds -Eq 1800 }
This command gets information about IP address configuration for all IP interfaces that have a default AdvertisedRouterLifetime.
```

---

### Parameters
#### **AddressFamily**
Specifies an array of IP address families. The cmdlet gets the IP interface that matches the address families. The acceptable values for this parameter are:
 -- IPv4
 -- IPv6
Valid Values:

* IPv4
* IPv6

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[AddressFamily[]]`|false   |named   |false        |

#### **AdvertiseDefaultRoute**
Specifies an array of default router advertisement values for an IP interface. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[AdvertiseDefaultRoute[]]`|false   |named   |false        |

#### **AdvertisedRouterLifetime**
Specifies an array of lifetimes, as TimeSpan objects, for default routes. This parameter indicates the lifetime of default routes when advertising routes on the IP interface. The default value is 1800. Valid only for advertising interfaces. To obtain a TimeSpan object, use the New-TimeSpan cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[TimeSpan[]]`|false   |named   |false        |

#### **Advertising**
Specifies an array of router advertisement values for the IP interface. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
 The default value is Disabled.
Valid Values:

* Disabled
* Enabled

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[Advertising[]]`|false   |named   |false        |

#### **AssociatedAdapter**
Specifies a network adapter as a CIM object.

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[CimInstance]`|false   |named   |True (ByValue)|

#### **AssociatedIPAddress**
Specifies a network IP address as a CIM object. To obtain an IP address object, use the Get-NetIPAddress cmdlet.

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[CimInstance]`|false   |named   |True (ByValue)|

#### **AssociatedNeighbor**
Specifies a network neighbor as a CIM object. To obtain a neighbor object, use the Get-NetNeighbor cmdlet.

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[CimInstance]`|false   |named   |True (ByValue)|

#### **AssociatedRoute**
Specifies a network route as a CIM object. To obtain a route object, use the Get-NetRoute cmdlet.

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[CimInstance]`|false   |named   |True (ByValue)|

#### **AutomaticMetric**
Specifies an array of values for the automatic metric calculation. Automatic metric determines whether TCP/IP automatically calculates a value for an interface metric that is based on the speed of the interface. The fastest interface has the lowest interface metric value. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[AutomaticMetric[]]`|false   |named   |false        |

#### **BaseReachableTimeMs**
Specifies an array of base values of random reachable times, in milliseconds. For more information, see RFC 2461. The default value is 30.

|Type        |Required|Position|PipelineInput|Aliases          |
|------------|--------|--------|-------------|-----------------|
|`[UInt32[]]`|false   |named   |false        |BaseReachableTime|

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **ClampMss**
Specifies an array of MSS clamping values for IP interface. This value determines if the IP interface clamps MSS on the forwarded TCP packets that are sent out of the interface. The acceptable values for this parameter are:
-- Enabled
-- Disabled
Valid Values:

* Disabled
* Enabled

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[ClampMss[]]`|false   |named   |false        |

#### **CompartmentId**
Specifies an array of identifiers for network compartments in the protocol stack. By default, the cmdlet only gets Net IP interfaces in the default compartment. If you specify a value, the cmdlet gets any matching NetIPInterface in all compartments in this field.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **ConnectionState**
Specifies an array of connection states for interfaces that are physically connected to a network.
Valid Values:

* Disconnected
* Connected

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[ConnectionState[]]`|false   |named   |false        |

#### **CurrentHopLimit**
Specifies an array of hop limits. This parameter is the value that the IP interface writes in the hop limit for IPv6, or the Time To Live (TTL) field, for IPv4, in all outbound traffic. When forwarding a packet, routers must decrement the hop limit, or TTL, by 1, and discard the packet when the hop limit reaches 0.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **DadRetransmitTimeMs**
Specifies an array of values for the time interval between neighbor solicitation messages.

|Type        |Required|Position|PipelineInput|Aliases          |
|------------|--------|--------|-------------|-----------------|
|`[UInt32[]]`|false   |named   |false        |DadRetransmitTime|

#### **DadTransmits**
Specifies an array of values for the number of consecutive messages sent while the network driver performs duplicate address detection.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **Dhcp**
Specifies the DHCP value for an IP interface. This value is persistent across reboots and only stored in the active policy store. 
The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Dhcp[]]`|false   |named   |false        |

#### **DirectedMacWolPattern**
Specifies an array of values for the wake-up packet for an IP interface. This parameter determines if an IP interface is configured to wake up a computer with directed MAC packet patterns. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
 The default value is Disabled.
Valid Values:

* Disabled
* Enabled

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[DirectedMacWolPattern[]]`|false   |named   |false        |

#### **EcnMarking**
Specifies an array of values for Explicit Congestion Notification (ECN) marking. This parameter value controls the specific ECN marking in the ECN field of the IP header. The acceptable values for this parameter are:
 -- AppDecide. Allow an application or higher layer protocol, such as TCP, to decide how to apply ECN marking. In order for an application to fully control ECN capability value in the Network TCP value must also be set to enabled. 
 -- Disabled. Disable the ECN marking on the IP interface. 
 -- UseEct0. Mark all of the egress IP packets on the IP interface with the Ect0 bit set. 
 -- UseEct1. Mark all of the egress IP packets on the IP interface with the Ect1 bit set. 
The default value is AppDecide.
Valid Values:

* Disabled
* UseEct1
* UseEct0
* AppDecide

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[EcnMarking[]]`|false   |named   |false        |

#### **ForceArpNdWolPattern**
Specifies an array of Wake On LAN (WOL) values for the IP interface. This parameter determines if an IP interface is configured to wake up a computer with Address Resolution Protocol (ARP) and Neighbor Discovery (ND) packet patterns. By default, IP interface properties have ForceArpNdWolPattern set to disabled. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[ForceArpNdWolPattern[]]`|false   |named   |false        |

#### **Forwarding**
Specifies an array of packet forwarding values for the IP interface. This value determines if this IP interface forwards packets that arrive on this interface to other interfaces. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[Forwarding[]]`|false   |named   |false        |

#### **IgnoreDefaultRoutes**
Specifies an array of values for default route advertisements. If you enable this value, default routes will not be dynamically added to the routing table. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
The default value is Disabled.
Valid Values:

* Disabled
* Enabled

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[IgnoreDefaultRoutes[]]`|false   |named   |false        |

#### **IncludeAllCompartments**
Indicates that the cmdlet includes all non-default compartments.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InterfaceAlias**
Specifies an array of aliases of network interfaces. The cmdlet gets IP interfaces that match the aliases.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies an array of indexes of network interfaces. The cmdlet gets IP interfaces that match the indexes.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[UInt32[]]`|false   |named   |True (ByPropertyName)|ifIndex|

#### **InterfaceMetric**
Specifies an array of metrics of IP interfaces. When routes are chosen, the overall metric used to determine the preference is the sum of the route metric and the interface metric. Typically, the interface metric gives preference to a particular interface, such as using wired if both wired and wireless are available. The default value is automatic.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **ManagedAddressConfiguration**
Specifies an array of values of managed address configurations. This parameter determines if an IP interface uses a stateful protocol, such as DHCP, to obtain an address. Setting this parameter will have no effect on an interface that has router discovery enabled and advertising disabled. In that case, the parameter is controlled by router discovery. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[ManagedAddressConfiguration[]]`|false   |named   |false        |

#### **NeighborDiscoverySupported**
Specifies an array of neighbor discovery values for the IP interface. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* No
* Yes

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[NeighborDiscoverySupported[]]`|false   |named   |false        |

#### **NeighborUnreachabilityDetection**
Specifies an array of values for Neighbor Unreachability Detection (NUD). Use this parameter to determine when a neighbor is no longer reachable. For more information, see RFC 2461. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[NeighborUnreachabilityDetection[]]`|false   |named   |false        |

#### **NlMtuBytes**
Specifies an array of network layer Maximum Transmission Unit (MTU) values, in bytes, for an IP interface. The IP interface will not transmit packets larger than the maximum value.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **OtherStatefulConfiguration**
Specifies an array of values for configuration other than addresses. This parameter determines if an IP interface uses a stateful protocol, such as DHCP, to obtain configuration information other than addresses. This parameter value has no effect on an interface that has router discovery enabled and advertising disabled. In that case, the parameter is controlled by router discovery. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[OtherStatefulConfiguration[]]`|false   |named   |false        |

#### **PolicyStore**
Specifies a PolicyStore value. The acceptable values for this parameter are:
 -- ActiveStore. The IP address information is valid. 
 -- PersistentStore. The computer saves IP address information across restarts. When the computer restarts, it copies the saved settings to the ActiveStore. 
The default value is ActiveStore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ReachableTimeMs**
Specifies an array of reachable time values. This parameter is the time, in milliseconds, that a node assumes that a neighbor is reachable after having received a reachability confirmation. This parameter works with the NeighborUnreachabilityDetection parameter.

|Type        |Required|Position|PipelineInput|Aliases      |
|------------|--------|--------|-------------|-------------|
|`[UInt32[]]`|false   |named   |false        |ReachableTime|

#### **RetransmitTimeMs**
Specifies an array of value for timeout and retransmission, in milliseconds, for Neighbor Solicitation messages. For more information, see RetransTimer in RFC 2461. By default, the value is 1000.

|Type        |Required|Position|PipelineInput|Aliases       |
|------------|--------|--------|-------------|--------------|
|`[UInt32[]]`|false   |named   |false        |RetransmitTime|

#### **RouterDiscovery**
Specifies the value for router discovery for an IP interface. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
 -- ControlledByDHCP. IP Interface properties for interfaces that have RouterDiscovery controlled by Dynamic Host Configuration Protocol (DHCP). 
By default, the value of this parameter is ControlledByDHCP for IPv4 and Enabled for IPv6. If the value of this parameter is enabled, an IP host can locate routers that reside on an attached link.
Valid Values:

* Disabled
* Enabled
* ControlledByDHCP

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[RouterDiscovery[]]`|false   |named   |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **WeakHostReceive**
Specifies the receive value for a weak host model. By default, an IP interface properties set this parameter to disabled. If this parameter is enabled, an IP host can receive IP packets on an interface that is not assigned the destination IP address of the packet being received. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[WeakHostReceive[]]`|false   |named   |false        |

#### **WeakHostSend**
Specifies the send value for a weak host model. By default, an IP interface set this parameter to disabled. If this parameter is enabled, an IP host can send IP packets on an interface that is not assigned the destination IP address of the packet being sent. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[WeakHostSend[]]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetIPInterface

---

### Syntax
```PowerShell
Get-NetIPInterface [[-InterfaceAlias] <String[]>] [-AddressFamily <AddressFamily[]>] [-AdvertiseDefaultRoute <AdvertiseDefaultRoute[]>] [-AdvertisedRouterLifetime <TimeSpan[]>] [-Advertising <Advertising[]>] [-AutomaticMetric <AutomaticMetric[]>] [-BaseReachableTimeMs <UInt32[]>] [-CimSession <CimSession[]>] [-ClampMss <ClampMss[]>] [-CompartmentId <UInt32[]>] [-ConnectionState <ConnectionState[]>] [-CurrentHopLimit <UInt32[]>] [-DadRetransmitTimeMs <UInt32[]>] [-DadTransmits <UInt32[]>] [-Dhcp <Dhcp[]>] [-DirectedMacWolPattern <DirectedMacWolPattern[]>] [-EcnMarking <EcnMarking[]>] [-ForceArpNdWolPattern <ForceArpNdWolPattern[]>] [-Forwarding <Forwarding[]>] [-IgnoreDefaultRoutes <IgnoreDefaultRoutes[]>] [-IncludeAllCompartments] [-InterfaceIndex <UInt32[]>] [-InterfaceMetric <UInt32[]>] [-ManagedAddressConfiguration <ManagedAddressConfiguration[]>] [-NeighborDiscoverySupported <NeighborDiscoverySupported[]>] [-NeighborUnreachabilityDetection <NeighborUnreachabilityDetection[]>] [-NlMtuBytes <UInt32[]>] [-OtherStatefulConfiguration <OtherStatefulConfiguration[]>] [-PolicyStore <String>] [-ReachableTimeMs <UInt32[]>] [-RetransmitTimeMs <UInt32[]>] [-RouterDiscovery <RouterDiscovery[]>] [-ThrottleLimit <Int32>] [-WeakHostReceive <WeakHostReceive[]>] [-WeakHostSend <WeakHostSend[]>] [<CommonParameters>]
```
```PowerShell
Get-NetIPInterface [-AssociatedAdapter <CimInstance>] [-CimSession <CimSession[]>] [-IncludeAllCompartments] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NetIPInterface [-AssociatedIPAddress <CimInstance>] [-CimSession <CimSession[]>] [-IncludeAllCompartments] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NetIPInterface [-AssociatedNeighbor <CimInstance>] [-CimSession <CimSession[]>] [-IncludeAllCompartments] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NetIPInterface [-AssociatedRoute <CimInstance>] [-CimSession <CimSession[]>] [-IncludeAllCompartments] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
