Get-NetIPv6Protocol
-------------------

### Synopsis
Gets IPv6 protocol configurations.

---

### Description

The Get-NetIPv6Protocol cmdlet gets the global IPv6 protocol configurations for the computer. The cmdlet returns IPv6 Protocol settings, such as the Internet Control Message Protocol (ICMP) setting, the default hop limit, the neighbor cache limit, and the multicast configuration. If you do not specify any parameters, the cmdlet gets all the IPv6 Protocol configuration settings.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=288384)

* [Set-NetIPv6Protocol](Set-NetIPv6Protocol)

* [Get-NetIPv4Protocol](Get-NetIPv4Protocol)

---

### Examples
> Example 1: Get all IPv6 protocol configurations

```PowerShell
PS C:\>Get-NetIPv6Protocol
This command gets all IPv6 protocol configurations for the IP interface. The default output for the cmdlet does not include all properties of the NetIPv6Protocol object.
```
> Example 2: Output all properties of IPv6 protocol configurations

```PowerShell
PS C:\>Get-NetIPv6Protocol | Format-List –Property *
This command gets all IPv6 protocol configurations for the IP interface. The command uses the Format-List cmdlet to display all the properties in the output in the form of a table. For more information, type Get-Help Format-Table. The command default output omits some properties.
```

---

### Parameters
#### **AddressMaskReply**
Specifies an array of values for address mask reply. The cmdlet gets the IPv6 protocol configurations that have these values. Address mask reply specifies how the computer responds to ICMP address mask packets. The acceptable values for this parameter are:
-- Enabled. The computer responds to ICMP address mask packets. 
-- Disabled. The computer does not respond to ICMP address mask packets.
Valid Values:

* Disabled
* Enabled

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[AddressMaskReply[]]`|false   |named   |false        |

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **DeadGatewayDetection**
Specifies an array of values for dead gateway detection. The cmdlet gets IPv4 protocol configurations that have these values.
Dead gateway detection is a feature that identifies gateways that are not operating properly and switches the computer to a new default gateway if available.
The acceptable values for this parameter are:
-- Enabled
-- Disabled
Valid Values:

* Disabled
* Enabled

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[DeadGatewayDetection[]]`|false   |named   |false        |

#### **DefaultHopLimit**
Specifies an array of values for the default hop limit. The cmdlet gets the IPv6 protocol configurations that have these values. The default hop limit is the default value for the CurrentHopLimit property in the IP interface. The current hop limit is the value that the IP interface writes in the time-to-live (TTL) field in all outbound traffic. When routers forward a packet, they decrement the hop limit by 1 and discard the packet when the hop limit is 0.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **DhcpMediaSense**
Specifies an array of values for Media Sense. The cmdlet gets IPv6 protocol configurations that have these values.
Media Sense provides a mechanism for the network adapter to notify the protocol stack of media connect and disconnect events. These events trigger the DHCP client to take an action, such as attempting to renew a DHCP lease or removing routes that are related to a disconnected network. When Media Sense is enabled, the network parameters on the laptop of a roaming user are automatically and transparently updated without requiring a restart when the user moves from one location to another. The acceptable values for this parameter are:
-- Enabled
-- Disabled
Valid Values:

* Disabled
* Enabled

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[DhcpMediaSense[]]`|false   |named   |false        |

#### **GroupForwardedFragments**
Specifies an array of values for group forwarded fragments. The cmdlet gets IPv6 protocol configurations that have these values. Group forwarded fragments specifies whether the IP interface collects fragments into groups before it forwards the fragments. The acceptable values for this parameter are:
-- Enabled. The IP interface collects IPv4 protocol fragments into groups before it forwards the fragments. 
-- Disabled. The IP interface does not collect IPv4 protocol fragments into groups before it forwards the fragments.
Valid Values:

* Disabled
* Enabled

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[GroupForwardedFragments[]]`|false   |named   |false        |

#### **IcmpRedirects**
Specifies an array of values for ICMP redirects. The cmdlet gets IPv4 protocol configurations that have these values. ICMP redirects specifies whether to update the path cache in response to ICMP redirect packets. The acceptable values for this parameter are:
-- Enabled. The IP interface updates the path cache in response to ICMP redirect packets. 
-- Disabled. The IP interface does not update the path cache in response to ICMP redirect packets.
Valid Values:

* Disabled
* Enabled

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[IcmpRedirects[]]`|false   |named   |false        |

#### **MaxTemporaryDadAttempts**
Specifies an array of values for the maximum number of duplicate address detection attempts for temporary addresses. The cmdlet gets IPv6 protocol configurations that have these values.

|Type        |Required|Position|PipelineInput|Aliases       |
|------------|--------|--------|-------------|--------------|
|`[UInt32[]]`|false   |named   |false        |MaxDadAttempts|

#### **MaxTemporaryDesyncTime**
Specifies an array of values for the maximum time to desynchronize temporary address preferred lifetimes. The cmdlet gets IPv6 protocol configurations that have these values.

|Type          |Required|Position|PipelineInput|Aliases      |
|--------------|--------|--------|-------------|-------------|
|`[TimeSpan[]]`|false   |named   |false        |MaxRandomTime|

#### **MaxTemporaryPreferredLifetime**
Specifies an array of values, as TimeSpan objects, for the maximum preferred lifetime over which to prefer a temporary address. The cmdlet gets IPv6 protocol configurations that have these values.

|Type          |Required|Position|PipelineInput|Aliases             |
|--------------|--------|--------|-------------|--------------------|
|`[TimeSpan[]]`|false   |named   |false        |MaxPreferredLifetime|

#### **MaxTemporaryValidLifetime**
Specifies an array of values, as TimeSpan objects, for the maximum lifetime over which a temporary address is valid. The cmdlet gets IPv6 protocol configurations that have these values.

|Type          |Required|Position|PipelineInput|Aliases         |
|--------------|--------|--------|-------------|----------------|
|`[TimeSpan[]]`|false   |named   |false        |MaxValidLifetime|

#### **MediaSenseEventLog**
Specifies an array of values for Media Sense event log. The cmdlet gets IPv6 protocol configurations that have these values. Media Sense event log specifies whether the computer logs DHCP Media Sense events. The acceptable values for this parameter are:
-- Enabled. The IP interface logs DHCP Media Sense events in the event log for troubleshooting purposes.
-- Disabled. The IP interface does not log DHCP Media Sense events in the event log.
Valid Values:

* Disabled
* Enabled

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[MediaSenseEventLog[]]`|false   |named   |false        |

#### **MldLevel**
Specifies an array of values for the level of Multicast Listener Discovery (MLD) support. The cmdlet gets IPv6 protocol configurations that have these values. The acceptable values for this parameter are:
-- All. The computer can send and receive multicast packets. 
-- None. The computer cannot send or receive multicast packets. 
-- SendOnly. The computer can send but not receive multicast packets.
Valid Values:

* None
* SendOnly
* All

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[MldLevel[]]`|false   |named   |false        |

#### **MldVersion**
Specifies an array of values for the maximum version of Multicast Listener Discovery that the host supports. The cmdlet gets IPv6 protocol configurations that have these values.
Valid Values:

* Version1
* Version2

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[MldVersion[]]`|false   |named   |false        |

#### **MulticastForwarding**
Specifies an array of values for multicast forwarding. The cmdlet gets IPv6 protocol configurations that have these values. The acceptable values for this parameter are:
-- Enabled. The computer can forward multicast packets.
-- Disabled. The computer cannot forward multicast packets.
Valid Values:

* Disabled
* Enabled

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[MulticastForwarding[]]`|false   |named   |false        |

#### **NeighborCacheLimitEntries**
Specifies an array of values for the maximum number of neighbor cache entries. The cmdlet gets IPv6 protocol configurations that have these values.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[UInt32[]]`|false   |named   |false        |NeighborCacheLimit|

#### **RandomizeIdentifiers**
Specifies an array of values for the randomization of identifiers. The cmdlet gets IPv6 protocol configurations that have these values. The acceptable values for this parameter are:
-- Enabled. The IP interface randomizes identifiers when it creates an IP address. 
-- Disabled: The IP interface does not randomize identifiers when it creates an IP address.
Valid Values:

* Disabled
* Enabled

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[RandomizeIdentifiers[]]`|false   |named   |false        |

#### **ReassemblyLimitBytes**
Specifies an array of values for the maximum size of the reassembly buffer. The cmdlet gets IPv6 protocol configurations that have these values.

|Type        |Required|Position|PipelineInput|Aliases        |
|------------|--------|--------|-------------|---------------|
|`[UInt32[]]`|false   |named   |false        |ReassemblyLimit|

#### **RouteCacheLimitEntries**
Specifies an array of values for the maximum number of route cache entries. The cmdlet gets IPv6 protocol configurations that have these values.

|Type        |Required|Position|PipelineInput|Aliases        |
|------------|--------|--------|-------------|---------------|
|`[UInt32[]]`|false   |named   |false        |RouteCacheLimit|

#### **SourceRoutingBehavior**
Specifies an array of values for the behavior for source-routed packets. The cmdlet gets IPv6 protocol configurations that have these values. The acceptable values for this parameter are:
-- DontForward. The computer can receive but not forward source-routed packets. 
-- Drop. The computer drops source-routed packets.
Valid Values:

* Forward
* DontForward
* Drop

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[SourceRoutingBehavior[]]`|false   |named   |false        |

#### **TemporaryRegenerateTime**
Specifies an array of values, as TimeSpan objects, for the time before deprecating a temporary address when a new address is generated.
The cmdlet gets IPv6 protocol configurations that have these values.

|Type          |Required|Position|PipelineInput|Aliases       |
|--------------|--------|--------|-------------|--------------|
|`[TimeSpan[]]`|false   |named   |false        |RegenerateTime|

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **UseTemporaryAddresses**
Specifies an array of values for temporary addresses. The cmdlet gets IPv6 protocol configurations that have these values. The acceptable values for this parameter are:
-- Always. The computer always generates temporary addresses by using random numbers. 
-- Counter. The computer generates temporary addresses by using the interface identifier. You typically use this identifier for test purposes. 
-- Disabled. The computer does not use temporary addresses. 
-- Enabled. The computer uses temporary addresses.
Valid Values:

* Disabled
* Enabled
* Always

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[UseTemporaryAddresses[]]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetIPv6Protocol

---

### Syntax
```PowerShell
Get-NetIPv6Protocol [-AddressMaskReply <AddressMaskReply[]>] [-CimSession <CimSession[]>] [-DeadGatewayDetection <DeadGatewayDetection[]>] [-DefaultHopLimit <UInt32[]>] [-DhcpMediaSense <DhcpMediaSense[]>] [-GroupForwardedFragments <GroupForwardedFragments[]>] [-IcmpRedirects <IcmpRedirects[]>] [-MaxTemporaryDadAttempts <UInt32[]>] [-MaxTemporaryDesyncTime <TimeSpan[]>] [-MaxTemporaryPreferredLifetime <TimeSpan[]>] [-MaxTemporaryValidLifetime <TimeSpan[]>] [-MediaSenseEventLog <MediaSenseEventLog[]>] [-MldLevel <MldLevel[]>] [-MldVersion <MldVersion[]>] [-MulticastForwarding <MulticastForwarding[]>] [-NeighborCacheLimitEntries <UInt32[]>] [-RandomizeIdentifiers <RandomizeIdentifiers[]>] [-ReassemblyLimitBytes <UInt32[]>] [-RouteCacheLimitEntries <UInt32[]>] [-SourceRoutingBehavior <SourceRoutingBehavior[]>] [-TemporaryRegenerateTime <TimeSpan[]>] [-ThrottleLimit <Int32>] [-UseTemporaryAddresses <UseTemporaryAddresses[]>] [<CommonParameters>]
```
