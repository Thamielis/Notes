New-NetTransportFilter
----------------------

### Synopsis
Creates a transport filter.

---

### Description

The New-NetTransportFilter cmdlet creates a transport filter. A transport filter specifies the TCP settings, as a NetTcpSetting object, to apply to an IP address prefix or a TCP port range. Specify the setting to apply by name. You can use the Set-NetTCPSetting cmdlet to modify a setting.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkID=288397)

* [Get-NetTransportFilter](Get-NetTransportFilter)

* [Remove-NetTransportFilter](Remove-NetTransportFilter)

* [Set-NetTCPSetting](Set-NetTCPSetting)

---

### Examples
> Example 1: Create a transport filter

```PowerShell
PS C:\>New-NetTransportFilter –SettingName Datacenter –DestinationPrefix 192.168.0.0/16
This command creates a transport filter for the 192.168.0.0/16 network. The data center TCP settings applies to all TCP connections between the computer and other computers in this network.
```
> Example 2: Create a transport filter for an app

```PowerShell
PS C:\>Get-NetTransportFilter –SettingName Compat –LocalPortStart 5000 –LocalPortEnd 5000 –RemotePortStart 6000 –RemotePortEnd 6000
This command creates a transport filter for a compatibility setting. The command specifies port ranges for both local and remote computers.
```

---

### Parameters
#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **DestinationPrefix**
Specifies a destination prefix of an IP route. The cmdlet associates the transport filter that to the prefix that you specify. A destination prefix consists of an IP address prefix and a prefix length, separated by a slash (/).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LocalPortEnd**
Specifies the upper bound of a range of local TCP ports. The cmdlet assigns the upper bound that you specify to the transport filter. If you do not specify this parameter, the cmdlet uses the lower range value of 1025.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **LocalPortStart**
Specifies the lower bound of a range of local TCP ports. The cmdlet assigns the lower bound that you specify to the transport filter. If you do not specify this parameter, the cmdlet uses the lower range value of 65535.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **Protocol**
Specifies the type of routing protocol. The cmdlet assigns the protocol that you specify to the routing filter. The acceptable values for this parameter are:
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
Valid Values:

* TCP
* UDP

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Protocol]`|false   |named   |false        |

#### **RemotePortEnd**
Specifies the upper bound of a range of remote TCP ports. The cmdlet assigns the upper bound that you specify to the transport filter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **RemotePortStart**
Specifies the lower bound of a range of remote TCP ports. The cmdlet assigns the lower bound that you specify to the transport filter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **SettingName**
Specifies a setting name. The cmdlet associates the setting that you specify to the transport filter. The acceptable values for this parameter are:
-- Internet
-- Datacenter
-- Compat
-- Custom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

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
None

---

### Outputs
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetTransportFilter

---

### Syntax
```PowerShell
New-NetTransportFilter [-CimSession <CimSession[]>] [-DestinationPrefix <String>] [-LocalPortEnd <UInt16>] [-LocalPortStart <UInt16>] [-Protocol {TCP | UDP}] [-RemotePortEnd <UInt16>] [-RemotePortStart <UInt16>] [-ThrottleLimit <Int32>] -SettingName <String> [-Confirm] [-WhatIf] [<CommonParameters>]
```
