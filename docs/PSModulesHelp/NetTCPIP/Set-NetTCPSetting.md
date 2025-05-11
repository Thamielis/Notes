Set-NetTCPSetting
-----------------

### Synopsis
Modifies a TCP setting.

---

### Description

The Set-NetTCPSetting cmdlet modifies a TCP setting. TCP settings are optimized for different network conditions including latency and congestion. To apply a TCP setting to a port number or destination IP address range, create a transport filter by using the New-NetTransportFilter cmdlet.

You can only modify the Custom TCP setting.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkID=289172)

* [Get-NetTCPSetting](Get-NetTCPSetting)

* [Get-NetTransportFilter](Get-NetTransportFilter)

* [Get-NetUDPSetting](Get-NetUDPSetting)

* [New-NetTransportFilter](New-NetTransportFilter)

* [Remove-NetTransportFilter](Remove-NetTransportFilter)

* [Set-NetUDPSetting](Set-NetUDPSetting)

---

### Examples
> Example 1: Change the custom TCP setting

```PowerShell
PS C:\>Set-NetTCPSetting –SettingName "Custom" –CongestionProvider CTCP –InitialCongestionWindowMss 6
This command changes the custom TCP setting to have a value of 6 for the initial congestion window and use compound TCP.
```

---

### Parameters
#### **AutomaticUseCustom**
Specifies whether the automatic profile assigns a custom template, either Datacenter Custom or Internet Custom, to a connection. The acceptable values for this parameter are:
-- True 
-- False
Valid Values:

* Disabled
* Enabled

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[AutomaticUseCustom]`|false   |named   |false        |

#### **AutoReusePortRangeNumberOfPorts**
Specifies the number of ports for the auto-reuse port range, which is a port range used for local ephemeral port selection by outbound TCP connections for which either SO_REUSE_UNICASTPORT has been set on the socket, or for which connect() has been called without calling bind() on the socket.
If you specify 0, the auto-reuse feature is disabled and ephemeral ports are drawn instead from the dynamic port range as specified by DynamicPortRangeStartPort and DynamicPortRangeNumberOfPorts, even if SO_REUSE_UNICASTPORT is set on a socket.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **AutoReusePortRangeStartPort**
Specifies the number of ports for the auto-reuse port range, which is a port range used for local ephemeral port selection by outbound TCP connections for which either SO_REUSE_UNICASTPORT has been set on the socket, or for which connect() has been called without calling bind() on the socket.
If you specify 0, the auto-reuse feature is disabled and ephemeral ports are drawn instead from the dynamic port range as specified by DynamicPortRangeStartPort and DynamicPortRangeNumberOfPorts, even if SO_REUSE_UNICASTPORT is set on a socket.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **AutoTuningLevelLocal**
Specifies a TCP auto-tuning level for the host computer. TCP auto-tuning can improve throughput on high throughput, high latency networks. The acceptable values for this parameter are:
-- Disabled. Sets the TCP receive window to the default value. 
-- HighlyRestricted. Sets the TCP receive window to grow beyond the default value, but very conservatively. 
-- Restricted. Sets the TCP receive window to grow beyond the default value, but less conservatively than HighlyRestricted. 
-- Normal. Sets the TCP receive window to grow to accommodate almost all scenarios. 
-- Experimental. Sets the TCP receive window to grow to accommodate extreme scenarios.
Valid Values:

* Disabled
* HighlyRestricted
* Restricted
* Normal
* Experimental

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[AutoTuningLevelLocal]`|false   |named   |false        |

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **CongestionProvider**
Specifies the congestion provider property that TCP uses. The acceptable values for this parameter are:
-- CTCP. Compound TCP increases the receive window and amount of data sent. CTCP can improve throughput on higher latency connections. 
-- DCTCP. Data Center TCP adjusts the TCP window based on network congestion feedback based on Explicit Congestion Notification (ECN) signaling. DCTCP may improve throughput on low latency links. 
-- Default. Servers use DCTCP by default. Client computers use NewReno. For information about NewReno, see RFC 3782 (http://www.ietf.org/rfc/rfc3782.txt).
Valid Values:

* Default
* NewReno
* CTCP
* DCTCP
* LEDBAT
* CUBIC
* BBR2

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[CongestionProvider]`|false   |named   |false        |

#### **CwndRestart**
Specifies whether to enable congestion window restart. Congestion window restart can avoid slow start to optimize throughput on low latency networks. For more information about congestion window restart, see RFC 2581 (http://www.ietf.org/rfc/rfc2581.txt). The acceptable values for this parameter are:
-- True. TCP uses congestion window restart. 
-- False. TCP uses the default setting of the connection.
Valid Values:

* False
* True

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CwndRestart]`|false   |named   |false        |

#### **DelayedAckFrequency**
Specifies the number of acknowledgments (ACKs) received before the computer sends a response.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Byte]`|false   |named   |false        |

#### **DelayedAckTimeoutMs**
Specifies the time to wait, in milliseconds, before the computer sends an ACK if the computer receives fewer than delayed acknowledgment frequency of packets. Use the DelayedAckFrequency parameter to specify the delayed ACK frequency value. Reducing the time to wait can increase throughput on low latency networks by accelerating growth in TCP window size. The acceptable values for this parameter are: increments of 10, from 10 through 600.

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[UInt32]`|false   |named   |false        |DelayedAckTimeout|

#### **DynamicPortRangeNumberOfPorts**
Specifies the number of ports for the dynamic port range that starts from the port that you specify for the DynamicPortRangeStartPort parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **DynamicPortRangeStartPort**
Specifies the starting port for the dynamic port range. This parameter sets the starting port to send and receive TCP traffic. The acceptable values for this parameter are: 1 through 65535.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **EcnCapability**
Specifies whether to enable ECN capability. The acceptable values for this parameter are:
-- Enabled. Uses ECN capability. 
-- Disabled. Does not use ECN capability. 
If you specify a value of Disabled, UseECT0, or UseEct1 for the EcnMarking parameter of the Set-NetIPInterface cmdlet, the current parameter has no effect.
Valid Values:

* Disabled
* Enabled

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[EcnCapability]`|false   |named   |false        |

#### **ForceWS**
Specifies whether to force window scaling for retransmission. The acceptable values for this parameter are:
-- Enabled. Requires window scaling for retransmission. 
-- Disabled. Does not require window scaling for retransmission. 
The default value is Disabled.
Valid Values:

* Disabled
* Enabled

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[ForceWS]`|false   |named   |false        |

#### **InitialCongestionWindowMss**
Specifies the initial size of the congestion window. Provide a value to multiply by the maximum segment size (MSS). The acceptable values for this parameter are: even numbers from 2 through 64.

|Type      |Required|Position|PipelineInput|Aliases                |
|----------|--------|--------|-------------|-----------------------|
|`[UInt32]`|false   |named   |false        |InitialCongestionWindow|

#### **InitialRtoMs**
Specifies the period, in milliseconds, before connect, or SYN, retransmit. The acceptable values for this parameter are: increments of 10, from 300 ms through 3000 ms.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[UInt32]`|false   |named   |false        |InitialRto|

#### **MaxSynRetransmissions**
Specifies the maximum number of times the computer sends SYN packets without receiving a response.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Byte]`|false   |named   |false        |

#### **MemoryPressureProtection**
Specifies whether to use memory pressure protection. TCP memory pressure protection helps ensure that a computer continues normal operation when low on memory due to denial of service attacks. The acceptable values for this parameter are:
-- Enabled. When low on memory, during an attack, close existing TCP connections and drop incoming SYN requests. 
-- Disabled. Do not use memory pressure protection. 
-- Default. Use the computer default value for memory pressure protection.
Valid Values:

* Disabled
* Enabled
* Default

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[MemoryPressureProtection]`|false   |named   |false        |

#### **MinRtoMs**
Specifies a value, in milliseconds, for the TCP retransmission to time out. The acceptable values for this parameter are: increments of 10, from 20 ms through 300 ms.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[UInt32]`|false   |named   |false        |MinRto |

#### **NonSackRttResiliency**
Specifies whether to enable round trip time resiliency for clients that do not support selective acknowledgment. The acceptable values for this parameter are:
-- Enabled 
-- Disabled
Valid Values:

* Disabled
* Enabled

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[NonSackRttResiliency]`|false   |named   |false        |

#### **PassThru**
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ScalingHeuristics**
Specifies whether to enable scaling heuristics. The acceptable values for this parameter are:
-- Enabled 
-- Disabled
Valid Values:

* Disabled
* Enabled

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[ScalingHeuristics]`|false   |named   |false        |

#### **SettingName**
Specifies an array of setting names. You can specify only Custom for this parameter.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Timestamps**
Specifies whether to enable timestamps. Timestamps facilitate round trip measurement, and can help protect against wrapped sequence numbers on high throughput links. For more information about TCP timestamps, see RFC 1323 (http://www.ietf.org/rfc/rfc1323.txt). The acceptable values for this parameter are:
-- Enabled 
-- Disabled
Valid Values:

* Disabled
* Enabled
* Allowed

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Timestamps]`|false   |named   |false        |

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
Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetTCPSetting

The Microsoft.Management.Infrastructure.CimInstance object is a wrapper class that displays Windows Management Instrumentation (WMI) objects. The path after the pound sign (#) provides the namespace and class name for the underlying WMI object.

---

### Outputs
* None

---

### Syntax
```PowerShell
Set-NetTCPSetting [[-SettingName] <String[]>] [-AutomaticUseCustom {Disabled | Enabled}] [-AutoReusePortRangeNumberOfPorts <UInt16>] [-AutoReusePortRangeStartPort <UInt16>] [-AutoTuningLevelLocal {Disabled | HighlyRestricted | Restricted | Normal | Experimental}] [-CimSession <CimSession[]>] [-CongestionProvider {Default | CTCP | DCTCP}] [-CwndRestart {False | True}] [-DelayedAckFrequency <Byte>] [-DelayedAckTimeoutMs <UInt32>] [-DynamicPortRangeNumberOfPorts <UInt16>] [-DynamicPortRangeStartPort <UInt16>] [-EcnCapability {Disabled | Enabled}] [-ForceWS {Disabled | Enabled}] [-InitialCongestionWindowMss <UInt32>] [-InitialRtoMs <UInt32>] [-MaxSynRetransmissions <Byte>] [-MemoryPressureProtection {Disabled | Enabled | Default}] [-MinRtoMs <UInt32>] [-NonSackRttResiliency {Disabled | Enabled}] [-PassThru] [-ScalingHeuristics {Disabled | Enabled}] [-ThrottleLimit <Int32>] [-Timestamps {Disabled | Enabled}] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-NetTCPSetting [-AutomaticUseCustom {Disabled | Enabled}] [-AutoReusePortRangeNumberOfPorts <UInt16>] [-AutoReusePortRangeStartPort <UInt16>] [-AutoTuningLevelLocal {Disabled | HighlyRestricted | Restricted | Normal | Experimental}] [-CimSession <CimSession[]>] [-CongestionProvider {Default | CTCP | DCTCP}] [-CwndRestart {False | True}] [-DelayedAckFrequency <Byte>] [-DelayedAckTimeoutMs <UInt32>] [-DynamicPortRangeNumberOfPorts <UInt16>] [-DynamicPortRangeStartPort <UInt16>] [-EcnCapability {Disabled | Enabled}] [-ForceWS {Disabled | Enabled}] [-InitialCongestionWindowMss <UInt32>] [-InitialRtoMs <UInt32>] [-MaxSynRetransmissions <Byte>] [-MemoryPressureProtection {Disabled | Enabled | Default}] [-MinRtoMs <UInt32>] [-NonSackRttResiliency {Disabled | Enabled}] [-PassThru] [-ScalingHeuristics {Disabled | Enabled}] [-ThrottleLimit <Int32>] [-Timestamps {Disabled | Enabled}] [-Confirm] [-WhatIf] [<CommonParameters>]
```
