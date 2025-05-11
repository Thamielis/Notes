Set-NetIPInterface
------------------

### Synopsis
Modifies an IP interface.

---

### Description

The Set-NetIPInterface cmdlet modifies an IP interface, including Dynamic Host Configuration Protocol (DHCP), IPv6 neighbor discovery settings, router settings and Wake On LAN (WOL) settings.

If you do not specify any parameters, this cmdlet sets all of the IP interface properties on the computer, including virtual interfaces and loopback interfaces.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=289166)

* [Get-NetAdapter](Get-NetAdapter)

* [Get-NetIPInterface](Get-NetIPInterface)

---

### Examples
> Example 1: Modify an interface by the index value

```PowerShell
PS C:\>Set-NetIPInterface –InterfaceIndex 12 –Dhcp Disabled
This command modifies an IP interface object by using the interface index value of 12. The command also disables DHCP on the interface.
```
> Example 2: Modify the interface metrics

```PowerShell
PS C:\>Get-NetAdapter | Where-Object –FilterScript {$_.LinkSpeed –Eq "100 Mbps"} | Set-NetIPInterface –InterfaceMetric 21
This command modifies all of the network adapters on the computer with a link speed of 100 Mbps and sets the interface metric on them to 21.
```

---

### Parameters
#### **AddressFamily**
Specifies an array of IP address families. The cmdlet modifies the IP interface that matches the families.  The acceptable values for this parameter are:
 -- IPv4
 -- IPv6
Valid Values:

* IPv4
* IPv6

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[AddressFamily[]]`|false   |named   |false        |

#### **AdvertiseDefaultRoute**
Specifies the default router advertisement for an interface. This parameter value indicates whether the IP interface should advertise itself as a default router regardless of whether the node has a default route itself. This parameter is valid only for advertising interfaces. The acceptable values for this parameter are:
 -- Enabled 
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[AdvertiseDefaultRoute]`|false   |named   |false        |

#### **AdvertisedRouterLifetime**
Specifies a lifetime, as a TimeSpan object, for a default route. This parameter value indicates the lifetime of default routes when advertising routes on the IP interface. The default value is 1800. This parameter is valid only for advertising interfaces. To obtain a TimeSpan object, use the New-TimeSpan cmdlet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **Advertising**
Specifies the router advertisement value for the IP interface. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
 The default value is Disabled.
Valid Values:

* Disabled
* Enabled

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[Advertising]`|false   |named   |false        |

#### **AutomaticMetric**
Specifies the value for automatic metric calculation. Automatic metric determines whether TCP/IP automatically calculates a value for an interface metric that is based on the speed of the interface. The fastest interface has the lowest interface metric value. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[AutomaticMetric]`|false   |named   |false        |

#### **BaseReachableTimeMs**
Specifies the base value for random reachable time, in milliseconds. For more information, see RFC 2461. 
                         
The default value is 30.

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[UInt32]`|false   |named   |false        |BaseReachableTime|

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **ClampMss**
Specifies the MSS clamping value for the IP interface. This value determines if this IP interface clamps MSS on the forwarded TCP packets that are sent out of this interface. The acceptable values for this parameter are:
-- Enabled
-- Disabled
Valid Values:

* Disabled
* Enabled

|Type                                                                         |Required|Position|PipelineInput|
|-----------------------------------------------------------------------------|--------|--------|-------------|
|`[Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.ClampMss]`|false   |named   |false        |

#### **CompartmentId**
Specifies an array of identifiers for network compartments in the protocol stack. By default, the cmdlet only sets Net IP interfaces in the default compartment. If you specify a value, the cmdlet sets any matching NetIPInterface in all compartments in this field.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **CurrentHopLimit**
Specifies a hop limit. This parameter is the value that the IP interface writes in the hop limit field for IPv6, or the Time To Live (TTL) field for IPv4, in all outbound traffic. When forwarding a packet, routers decrement the hop limit, or TTL, by 1, and discard the packet when the hop limit reaches 0. The default is defined as DefaultHopLimit in the NetIPv4Protocol and NetIPv6Protocol objects. When this parameter value is set to 0, it uses this default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **DadRetransmitTimeMs**
Specifies a value for the time interval between neighbor solicitation messages.

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[UInt32]`|false   |named   |false        |DadRetransmitTime|

#### **DadTransmits**
Specifies a value for the number of consecutive messages sent while the network driver performs duplicate address detection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **Dhcp**
Specifies the Dynamic Host Configuration Protocol (DHCP) value for an IP interface. This setting is persistent across reboots and only stored in the active policy store. 
Changes to the persistent store will have no effect.   The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Dhcp]`|false   |named   |false        |

#### **DirectedMacWolPattern**
Specifies the wake-up packet value for an IP interface. This parameter value determines if an IP interface is configured to wake up a computer with directed MAC packet patterns. The acceptable values for this parameter are:
 -- Enabled
                         
 -- Disabled
The default value is Disabled.
Valid Values:

* Disabled
* Enabled

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[DirectedMacWolPattern]`|false   |named   |false        |

#### **EcnMarking**
Specifies the value for Explicit Congestion Notification (ECN) marking.  This parameter value controls the specific ECN marking in the ECN field of the IP header. The acceptable values for this parameter are:
 -- AppDecide. Allow an application or higher layer protocol, such as TCP, to decide how to apply ECN marking. In order for an application to fully control ECN capability value in the Network TCP setting must also be set to Enabled. 
 -- Disabled. Disable the ECN marking on the IP interface. 
 -- UseEct0. Mark all of the egress IP packets on the IP interface with the Ect0 bit set. 
 -- UseEct1. Mark all of the egress IP packets on the IP interface with the Ect1 bit set. 
The default value is AppDecide.
Valid Values:

* Disabled
* UseEct1
* UseEct0
* AppDecide

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[EcnMarking]`|false   |named   |false        |

#### **ForceArpNdWolPattern**
Specifies the Wake On LAN (WOL) value for the IP interface. This parameter value determines if an IP interface is configured to wake up a computer with Address Resolution Protocol (ARP) or Neighbor Discovery (ND) packet patterns. The default value is Disabled. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[ForceArpNdWolPattern]`|false   |named   |false        |

#### **Forwarding**
Specifies the packet forwarding value for the IP interface. This value determines if this IP interface forwards packets that arrive on this interface to other interfaces. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Forwarding]`|false   |named   |false        |

#### **IgnoreDefaultRoutes**
Specifies a value for Default Route advertisements. If you enable this setting, default routes will not be dynamically added to the routing table. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
The default value is Disabled.
Valid Values:

* Disabled
* Enabled

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[IgnoreDefaultRoutes]`|false   |named   |false        |

#### **IncludeAllCompartments**
Indicates that the cmdlet includes all non-default compartments.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InterfaceAlias**
Specifies an array of aliases of network interfaces. The cmdlet modifies IP interfaces that match the aliases.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies an array of indexes of network interfaces. The cmdlet modifies IP interfaces that match the indexes.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[UInt32[]]`|false   |named   |True (ByPropertyName)|ifIndex|

#### **InterfaceMetric**
Specifies a metric for an IP interface. When routes are chosen, the overall metric used to determine the preference is the sum of the route metric and the interface metric. Typically, the interface metric gives preference to a particular interface, such as using wired if both wired and wireless are available. This parameter value uses the value generated by AutomaticMetric by default. If this parameter value is set, then the AutomaticMetric parameter is automatically disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **ManagedAddressConfiguration**
Specifies the value for managed address configuration. This parameter determines if an IP interface uses a stateful protocol, such as DHCP, to obtain an address. Setting this parameter has no effect on an interface that has router discovery enabled and advertising disabled. In that case, the parameter is controlled by router discovery. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[ManagedAddressConfiguration]`|false   |named   |false        |

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
Specifies the value for Neighbor Unreachability Detection (NUD). Use this parameter to determine when a neighbor is no longer reachable. For more information, see RFC 2461. For ActiveStore, you can modify the NUD from Disabled to Enabled, but modifying NUD from Enabled to Disabled for ActiveStore fails with an invalid parameter. For the PersistentStore, you can modify the NUD to either Enabled or Disabled, but you will have to restart the interface for the setting to take effect. 
The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[NeighborUnreachabilityDetection]`|false   |named   |false        |

#### **NlMtuBytes**
Specifies the network layer Maximum Transmission Unit (MTU) value, in bytes, for an IP interface. For IPv4 the minimum value is 576 bytes. For IPv6 the minimum is value is 1280 bytes. For both IPv4 and IPv6, the maximum value is 2^32-1 (4294967295). You cannot set values outside these ranges. If this parameter is set to 0, then it will remain unchanged and maintain its current value. The IP interface will not transmit packets larger than the maximum value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **OtherStatefulConfiguration**
Specifies the value for configuration other than addresses. This parameter determines if an IP interface uses a stateful protocol, such as DHCP, to obtain configuration information other than addresses. This parameter setting has no effect on an interface that has router discovery enabled and advertising disabled. In that case, the parameter is controlled by router discovery. The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[OtherStatefulConfiguration]`|false   |named   |false        |

#### **PassThru**
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PolicyStore**
Specifies a PolicyStore value. The acceptable values for this parameter are:
 -- ActiveStore. The IP address information is valid. 
 -- PersistentStore. The computer saves IP address information across restarts. When the computer restarts, it copies the saved settings to the ActiveStore. 
The default value is ActiveStore. Specify ActiveStore only.
If you do not specify this parameter, the default entries are created in both the ActiveStore and the PersistentStore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ReachableTime**
Specifies an array of reachable time values. This parameter is the time, in milliseconds, that a node assumes that a neighbor is reachable after having received a reachability confirmation. This parameter works with the NeighborUnreachabilityDetection parameter.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **RetransmitTimeMs**
Specifies a value for timeout and retransmission, in milliseconds, for Neighbor Solicitation messages. For more information, see RetransTimer in RFC 2461. By default, the value is set to 1000.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[UInt32]`|false   |named   |false        |RetransmitTime|

#### **RouterDiscovery**
Specifies the value for router discovery for an IP interface,  The acceptable values for this parameter are:
 -- ControlledByDHCP. DHCP determines if the IP Interface can be used by the computer to locate routers that reside on an attached link. 
 -- Disabled: IP Interface will not be used by the computer to locate routers that reside on an attached link. 
 -- Enabled. IP Interface can be used by the computer to locate routers that reside on an attached link. 
By default, the value of this parameter is ControlledByDHCP for IPv4 and Enabled for IPv6. If the value of this parameter is enabled, an IP host can locate routers that reside on an attached link.
Valid Values:

* Disabled
* Enabled
* ControlledByDHCP

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[RouterDiscovery]`|false   |named   |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **WeakHostReceive**
Specifies the receive value for a weak host model. By default, interface properties set this parameter to disabled. If this parameter is enabled, an IP host can receive IP packets on an interface that is not assigned the destination IP address of the packet being received. The acceptable values for this parameter are:
 -- Enabled 
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[WeakHostReceive]`|false   |named   |false        |

#### **WeakHostSend**
Specifies the send value for a weak host model. By default, interface properties set this parameter to disabled. If this parameter is enabled, an IP host can send IP packets on an interface that is not assigned the destination IP address of the packet being sent.The acceptable values for this parameter are:
 -- Enabled
 -- Disabled
Valid Values:

* Disabled
* Enabled

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[WeakHostSend]`|false   |named   |false        |

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
Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetIPInterface

The Microsoft.Management.Infrastructure.CimInstance object is a wrapper class that displays Windows Management Instrumentation (WMI) objects. The path after the pound sign (#) provides the namespace and class name for the underlying WMI object.

---

### Outputs
* None

---

### Syntax
```PowerShell
Set-NetIPInterface [[-InterfaceAlias] <String[]>] [-AddressFamily <AddressFamily[]>] [-AdvertiseDefaultRoute {Disabled | Enabled}] [-AdvertisedRouterLifetime <TimeSpan>] [-Advertising {Disabled | Enabled}] [-AutomaticMetric {Disabled | Enabled}] [-BaseReachableTimeMs <UInt32>] [-CimSession <CimSession[]>] [-ClampMss {Disabled | Enabled}] [-CompartmentId <UInt32[]>] [-CurrentHopLimit <UInt32>] [-DadRetransmitTimeMs <UInt32>] [-DadTransmits <UInt32>] [-Dhcp {Disabled | Enabled}] [-DirectedMacWolPattern {Disabled | Enabled}] [-EcnMarking {Disabled | UseEct1 | UseEct0 | AppDecide}] [-ForceArpNdWolPattern {Disabled | Enabled}] [-Forwarding {Disabled | Enabled}] [-IgnoreDefaultRoutes {Disabled | Enabled}] [-IncludeAllCompartments] [-InterfaceIndex <UInt32[]>] [-InterfaceMetric <UInt32>] [-ManagedAddressConfiguration {Disabled | Enabled}] [-NeighborDiscoverySupported <NeighborDiscoverySupported[]>] [-NeighborUnreachabilityDetection {Disabled | Enabled}] [-NlMtuBytes <UInt32>] [-OtherStatefulConfiguration {Disabled | Enabled}] [-PassThru] [-PolicyStore <String>] [-ReachableTime <UInt32[]>] [-RetransmitTimeMs <UInt32>] [-RouterDiscovery {Disabled | Enabled | ControlledByDHCP}] [-ThrottleLimit <Int32>] [-WeakHostReceive {Disabled | Enabled}] [-WeakHostSend {Disabled | Enabled}] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-NetIPInterface [-AdvertiseDefaultRoute {Disabled | Enabled}] [-AdvertisedRouterLifetime <TimeSpan>] [-Advertising {Disabled | Enabled}] [-AutomaticMetric {Disabled | Enabled}] [-BaseReachableTimeMs <UInt32>] [-CimSession <CimSession[]>] [-ClampMss {Disabled | Enabled}] [-CurrentHopLimit <UInt32>] [-DadRetransmitTimeMs <UInt32>] [-DadTransmits <UInt32>] [-Dhcp {Disabled | Enabled}] [-DirectedMacWolPattern {Disabled | Enabled}] [-EcnMarking {Disabled | UseEct1 | UseEct0 | AppDecide}] [-ForceArpNdWolPattern {Disabled | Enabled}] [-Forwarding {Disabled | Enabled}] [-IgnoreDefaultRoutes {Disabled | Enabled}] [-InterfaceMetric <UInt32>] [-ManagedAddressConfiguration {Disabled | Enabled}] [-NeighborUnreachabilityDetection {Disabled | Enabled}] [-NlMtuBytes <UInt32>] [-OtherStatefulConfiguration {Disabled | Enabled}] [-PassThru] [-RetransmitTimeMs <UInt32>] [-RouterDiscovery {Disabled | Enabled | ControlledByDHCP}] [-ThrottleLimit <Int32>] [-WeakHostReceive {Disabled | Enabled}] [-WeakHostSend {Disabled | Enabled}] [-Confirm] [-WhatIf] [<CommonParameters>]
```
