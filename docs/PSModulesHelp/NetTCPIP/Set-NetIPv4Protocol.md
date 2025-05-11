Set-NetIPv4Protocol
-------------------

### Synopsis
Modifies information about the IPv4 Protocol configuration.

---

### Description

The Set-NetIPv4Protocol cmdlet modifies the global IPv4 protocol configuration for a computer. If you do not specify any parameters for the cmdlet, the cmdlet sets the default values for the global IPv6 protocol configuration.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=289167)

* [Architectural Overview of the TCP/IP Protocol Suite on TechNet](Architectural Overview of the TCP/IP Protocol Suite on TechNet)

* [Get-NetIPv4Protocol](Get-NetIPv4Protocol)

---

### Examples
> Example 1: Enable the DHCP Media Sense event log

```PowerShell
PS C:\>Set-NetIPv4Protocol –MediaSenseEventLog Enabled
This command enables the DHCP Media Sense event log.
```
> Example 2: Increase the number of neighbors

```PowerShell
PS C:\>Set-NetIPv4Protocol –NeighborCacheLimitEntries 1000
This command increases the size of the cache of on-link neighbors on the subnet to 1,000. The default value is 256.
```

---

### Parameters
#### **AddressMaskReply**
Specifies a value for address mask reply. The cmdlet modifies the value for this setting. Address mask reply specifies how the computer responds to ICMP address mask packets. The acceptable values for this parameter are:
-- Enabled. The computer responds to ICMP address mask packets. 
-- Disabled. The computer does not respond to ICMP address mask packets.
Valid Values:

* Disabled
* Enabled

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[AddressMaskReply]`|false   |named   |false        |

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **DeadGatewayDetection**
Specifies a value for dead gateway detection. The cmdlet modifies the value for this setting.
Dead gateway detection is a feature that identifies gateways that are not operating properly and switches the computer to a new default gateway if available. The acceptable values for this parameter are:
-- Enabled
-- Disabled
Valid Values:

* Disabled
* Enabled

|Type                                                                                      |Required|Position|PipelineInput|
|------------------------------------------------------------------------------------------|--------|--------|-------------|
|`[Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPv4Protocol.DeadGatewayDetection]`|false   |named   |false        |

#### **DefaultHopLimit**
Specifies a value for the default hop limit. The cmdlet modifies the value for this setting. This parameter sets the default value for the CurrentHopLimit property in the IP interface. The current hop limit is the value that the IP interface writes in the hop limit field in all outbound IPv4 traffic. When routers forward a packet, they decrement the hop limit by 1 and discard the packet when the hop limit is 0. The default value is 128.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **DhcpMediaSense**
Specifies a value for Media Sense. The cmdlet modifies the value for this setting.
Media Sense provides a mechanism for the network adapter to notify the protocol stack of media connect and disconnect events. These events trigger the DHCP client to take an action, such as attempting to renew a DHCP lease or removing routes that are related to a disconnected network. When Media Sense is enabled, the network parameters on the laptop of a roaming user are automatically and transparently updated without requiring a restart when the user moves from one location to another. The acceptable values for this parameter are:
-- Enabled
-- Disabled
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DhcpMediaSense]`|false   |named   |false        |

#### **GroupForwardedFragments**
Specifies a value for group forwarded fragments. The cmdlet modifies the value for this setting. Group forwarded fragments specifies whether the IP interface collects fragments into groups before it forwards the fragments. This parameter sets the GroupForwardedFragments property in the IP interface. The acceptable values for this parameter are:
-- Enabled. The IP interface collects IPv6 protocol fragments into groups before it forwards the fragments. 
-- Disabled. The IP interface does not collect IPv6 protocol fragments into groups before it forwards the fragments. 
The default value is Disabled.
Valid Values:

* Disabled
* Enabled

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[GroupForwardedFragments]`|false   |named   |false        |

#### **IGMPLevel**
Specifies a value for Internet Group Management Protocol (IGMP) level. The cmdlet modifies the value for this setting. The IGMP level specifies the level of multicast support. The acceptable values for this parameter are:
-- None
-- SendOnly
-- All
The default value is All.
Valid Values:

* None
* SendOnly
* All

|Type        |Required|Position|PipelineInput|Aliases |
|------------|--------|--------|-------------|--------|
|`[MldLevel]`|false   |named   |false        |MldLevel|

#### **IGMPVersion**
Specifies a value for the IGMP version number. The cmdlet modifies the value for this setting. The IGMP version is the maximum IGMP version supported by the host.
Valid Values:

* Version1
* Version2
* Version3

|Type          |Required|Position|PipelineInput|Aliases   |
|--------------|--------|--------|-------------|----------|
|`[MldVersion]`|false   |named   |false        |MldVersion|

#### **IcmpRedirects**
Specifies a value for Internet Control Message Protocol (ICMP) redirect. The cmdlet modifies the value for this setting. ICMP redirect specifies whether to update the path cache in response to ICMP redirect packets. This parameter sets the IcmpRedirects property in the IP interface. The acceptable values for this parameter are:
-- Enabled. The IP interface updates the path cache in response to ICMP redirect packets. 
-- Disabled. The IP interface does not update the path cache in response to ICMP redirect packets. 
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[IcmpRedirects]`|false   |named   |false        |

#### **MediaSenseEventLog**
Specifies a value for Media Sense event log. The cmdlet modifies the value for this setting. The acceptable values for this parameter are:
-- Enabled. The IP interface logs DHCP Media Sense events in the event log for troubleshooting purposes.
-- Disabled. The IP interface does not log DHCP Media Sense events in the event log. 
The default value is Disabled.
Valid Values:

* Disabled
* Enabled

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[MediaSenseEventLog]`|false   |named   |false        |

#### **MinimumMtu**
Specifies a value, in bytes, for the network layer Maximum Transmission Unit (MTU). For IPv4 the minimum value is 576 bytes. For IPv6 the minimum is value is 1280 bytes. For both IPv4 and IPv6, the maximum value is 2^32-1 (4294967295). You cannot set values outside these ranges.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **MulticastForwarding**
Specifies a value for multicast forwarding. The cmdlet modifies the value for this setting. The acceptable values for this parameter are:
-- Enabled. The computer can forward multicast packets.
-- Disabled. The computer cannot forward multicast packets. 
The default value is Disabled.
Valid Values:

* Disabled
* Enabled

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[MulticastForwarding]`|false   |named   |false        |

#### **NeighborCacheLimitEntries**
Specifies the maximum number of neighbor cache entries. The cmdlet modifies the value for this setting. 
The default value is 256.

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[UInt32]`|false   |named   |false        |NeighborCacheLimit|

#### **PassThru**
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RandomizeIdentifiers**
Specifies a value for the randomization of identifiers. The cmdlet modifies the value for this setting. The acceptable values for this parameter are:
-- Enabled. The IP interface randomizes identifiers when it creates an IP address. 
-- Disabled. The IP interface does not randomize identifiers when it creates an IP address. 
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[RandomizeIdentifiers]`|false   |named   |false        |

#### **ReassemblyLimitBytes**
Specifies a value for the maximum size of the reassembly buffer. The cmdlet modifies the value for this setting.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[UInt32]`|false   |named   |false        |ReassemblyLimit|

#### **RouteCacheLimitEntries**
Specifies a value for the maximum number of route cache entries. The cmdlet modifies the value for this setting.
The default value is 128.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[UInt32]`|false   |named   |false        |RouteCacheLimit|

#### **SourceRoutingBehavior**
Specifies a value for source routing behavior. The cmdlet modifies the value for this setting. The acceptable values for this parameter are:
-- DontForward. The computer can receive but not forward source-routed packets. 
-- Drop. The computer drops source-routed packets. 
The default value is DontForward.
Valid Values:

* Forward
* DontForward
* Drop

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[SourceRoutingBehavior]`|false   |named   |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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
Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetIPv4Protocol

The Microsoft.Management.Infrastructure.CimInstance object is a wrapper class that displays Windows Management Instrumentation (WMI) objects. The path after the pound sign (#) provides the namespace and class name for the underlying WMI object.

---

### Outputs
* None

---

### Syntax
```PowerShell
Set-NetIPv4Protocol [-AddressMaskReply {Disabled | Enabled}] [-CimSession <CimSession[]>] [-DeadGatewayDetection {Disabled | Enabled}] [-DefaultHopLimit <UInt32>] [-DhcpMediaSense {Disabled | Enabled}] [-GroupForwardedFragments {Disabled | Enabled}] [-IcmpRedirects {Disabled | Enabled}] [-IGMPLevel {None | SendOnly | All}] [-IGMPVersion {Version1 | Version2 | Version3}] [-MediaSenseEventLog {Disabled | Enabled}] [-MinimumMtu <UInt32>] [-MulticastForwarding {Disabled | Enabled}] [-NeighborCacheLimitEntries <UInt32>] [-PassThru] [-RandomizeIdentifiers {Disabled | Enabled}] [-ReassemblyLimitBytes <UInt32>] [-RouteCacheLimitEntries <UInt32>] [-SourceRoutingBehavior {Forward | DontForward | Drop}] [-ThrottleLimit <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
