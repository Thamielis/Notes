Get-NetOffloadGlobalSetting
---------------------------

### Synopsis
Gets the global TCP/IP offload settings.

---

### Description

The Get-NetOffloadGlobalSetting cmdlet gets the global TCP/IP offload settings. These settings include Receive Side Scaling, Receive Segment Coalescing, task offload, and NetworkDirect.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=288386)

* [Set-NetOffloadGlobalSetting](Set-NetOffloadGlobalSetting)

---

### Examples
> Example 1: Get global TCP/IP offload settings

```PowerShell
PS C:\>Get-NetOffloadGlobalSetting
This command gets the global TCP/IP offload settings on the computer.
```

---

### Parameters
#### **Chimney**
Specifies an array of values of TCP Chimney global state on the computer. The acceptable values for this parameter are:
-- Enabled
-- Disabled
-- Automatic
The default value is Disabled.
In Automatic mode, TCP Chimney Offload offloads the processing for a connection only if certain following criteria are met. In enabled mode, TCP Chimney Offload offloads the processing for connections on a first-come, first-served basis. For more information, see Using TCP Chimney Offload in the TechNet library.
Valid Values:

* Disabled
* Enabled
* Automatic

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ChimneyEnum[]]`|false   |named   |false        |

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **NetworkDirect**
Specifies an array of NetworkDirect Remote Direct Memory Access (RDMA) values on the computer. Use this parameter only on servers. The acceptable values for this parameter are:
-- Enabled
-- Disabled
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[EnabledDisabledEnum[]]`|false   |named   |false        |

#### **NetworkDirectAcrossIPSubnets**
Specifies an array of NetworkDirect connectivity values from outside a local IP network. The acceptable values for this parameter are:
-- Allowed
-- Blocked
Valid Values:

* Blocked
* Allowed

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[AllowedBlockedEnum[]]`|false   |named   |false        |

#### **PacketCoalescingFilter**
Specifies the values for a packet-coalescing filter on the computer. To reduce the number of interrupts that a computer processes, the packet-coalescing filter combines random broadcast and multicast packets, such as Address Resolution Protocol (ARP) requests, Neighbor Discovery messages, and Simple Service Discovery Protocol (SSDP) requests, into a single packet. Use this parameter only on client computers. The acceptable values for this parameter are:
-- Enabled 
-- Disabled 
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[EnabledDisabledEnum[]]`|false   |named   |false        |

#### **ReceiveSegmentCoalescing**
Specifies the Receive Segment Coalescing settings on the network adapter. Receive Segment Coalescing parses small packets of data and combines the data into a single packet. Coalescing small packets into a single packet reduces the overhead that is required to process packets. The acceptable values for this parameter are:
-- Enabled
-- Disabled
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[EnabledDisabledEnum[]]`|false   |named   |false        |

#### **ReceiveSideScaling**
Specifies the Receive Side Scaling settings on the computer. Receive Side Scaling distributes the network processing load across multiple processor cores. The acceptable values for this parameter are:
-- Enabled
-- Disabled
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[EnabledDisabledEnum[]]`|false   |named   |false        |

#### **TaskOffload**
Specifies the global TCP/IP task offload settings on the computer. Task offload settings include IP checksum offload, Internet Protocol security (IPsec) task offload, and Large Send Offload. These features reduce the overhead of per-packet processing by distributing packet processing tasks, such as checksum calculation, to a network adapter. The acceptable values for this parameter are:
-- Enabled 
-- Disabled 
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[EnabledDisabledEnum[]]`|false   |named   |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetOffloadGlobalSetting

---

### Syntax
```PowerShell
Get-NetOffloadGlobalSetting [-Chimney <ChimneyEnum[]>] [-CimSession <CimSession[]>] [-NetworkDirect <EnabledDisabledEnum[]>] [-NetworkDirectAcrossIPSubnets <AllowedBlockedEnum[]>] [-PacketCoalescingFilter <EnabledDisabledEnum[]>] [-ReceiveSegmentCoalescing <EnabledDisabledEnum[]>] [-ReceiveSideScaling <EnabledDisabledEnum[]>] [-TaskOffload <EnabledDisabledEnum[]>] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
