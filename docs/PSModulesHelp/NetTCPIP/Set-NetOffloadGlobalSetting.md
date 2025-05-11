Set-NetOffloadGlobalSetting
---------------------------

### Synopsis
Modifies the global TCP/IP offload settings.

---

### Description

The Set-NetOffloadGlobalSetting cmdlet modifies the global TCP/IP offload settings. The global settings include Receive Side Scaling, Receive Segment Coalescing, task offload, and NetworkDirect properties.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=289170)

* [Get-NetOffloadGlobalSetting](Get-NetOffloadGlobalSetting)

---

### Examples
> Example 1: Enable Receive Segment Coalescing

```PowerShell
PS C:\>Set-NetOffloadGlobalSetting –ReceiveSegmentCoalescing Enabled
This command enables Receive Segment Coalescing on the computer.
```

---

### Parameters
#### **Chimney**
Specifies the TCP Chimney global state on the computer. The acceptable values for this parameter are:
-- Enabled
-- Disabled
-- Automatic
The default value is Disabled.
Valid Values:

* Disabled
* Enabled
* Automatic

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ChimneyEnum]`|false   |named   |false        |

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **NetworkDirect**
Specifies the NetworkDirect Remote Direct Memory Access (RDMA) value on the computer. Use this parameter only on servers. The acceptable values for this parameter are:
-- Enabled
-- Disabled
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[EnabledDisabledEnum]`|false   |named   |false        |

#### **NetworkDirectAcrossIPSubnets**
Specifies a value for NetworkDirect connectivity from outside a local IP network. The acceptable values for this parameter are:
-- Allowed
-- Blocked
Valid Values:

* Blocked
* Allowed

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[AllowedBlockedEnum]`|false   |named   |false        |

#### **PacketCoalescingFilter**
Specifies the values for the packet-coalescing filter on the computer. To reduce the number of interrupts that a computer processes, the packet-coalescing filter combines random broadcast and multicast packets, such as Address Resolution Protocol (ARP) requests, Neighbor Discovery messages, and Simple Service Discovery Protocol (SSDP) requests, into a single packet. Use this parameter only on client computers. The acceptable values for this parameter are:
-- Enabled 
-- Disabled 
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[EnabledDisabledEnum]`|false   |named   |false        |

#### **PassThru**
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ReceiveSegmentCoalescing**
Specifies the Receive Segment Coalescing settings on the computer. Receive Segment Coalescing parses small packets of data and combines the data into a single packet. Coalescing small packets into a single packet reduces the overhead that is required to process packets. The acceptable values for this parameter are:
-- Enabled
-- Disabled
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[EnabledDisabledEnum]`|false   |named   |false        |

#### **ReceiveSideScaling**
Specifies the Receive Side Scaling settings on the computer. Receive Side Scaling distributes the network processing load across multiple processor cores. The acceptable values for this parameter are:
-- Enabled
-- Disabled
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[EnabledDisabledEnum]`|false   |named   |false        |

#### **TaskOffload**
Specifies the global TCP/IP task offload settings. Task offload settings include IP checksum offload, Internet Protocol security (IPsec) task offload, and Large Send Offload. These features reduce the overhead of per-packet processing by distributing packet processing tasks, such as checksum calculation, to a network adapter. A modification takes effect after a computer restarts or a network adapter restarts. The acceptable values for this parameter are:
-- Enabled 
-- Disabled 
The default value is Enabled.
Valid Values:

* Disabled
* Enabled

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[EnabledDisabledEnum]`|false   |named   |false        |

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
Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetOffloadGlobalSetting

The Microsoft.Management.Infrastructure.CimInstance object is a wrapper class that displays Windows Management Instrumentation (WMI) objects. The path after the pound sign (#) provides the namespace and class name for the underlying WMI object.

---

### Outputs
* None

---

### Syntax
```PowerShell
Set-NetOffloadGlobalSetting [-Chimney {Disabled | Enabled | Automatic}] [-CimSession <CimSession[]>] [-NetworkDirect {Disabled | Enabled}] [-NetworkDirectAcrossIPSubnets {Blocked | Allowed}] [-PacketCoalescingFilter {Disabled | Enabled}] [-PassThru] [-ReceiveSegmentCoalescing {Disabled | Enabled}] [-ReceiveSideScaling {Disabled | Enabled}] [-TaskOffload {Disabled | Enabled}] [-ThrottleLimit <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
