Get-NetTransportFilter
----------------------

### Synopsis
Gets transport filters.

---

### Description

The Get-NetTransportFilter cmdlet gets transport filters. A transport filter specifies the TCP settings, as a NetTcpSetting object, to apply to an IP address prefix or a TCP port range. Use the cmdlet without parameters to get all transport filters for the computer.

Use the New-NetTransportFilter cmdlet to create transport filters, and use the Remove-NetTransportFilter cmdlet to remove filters.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkID=288391)

* [Get-NetUDPSetting](Get-NetUDPSetting)

* [New-NetTransportFilter](New-NetTransportFilter)

* [Remove-NetTransportFilter](Remove-NetTransportFilter)

* [Set-NetTCPSetting](Set-NetTCPSetting)

* [Set-NetUDPSetting](Set-NetUDPSetting)

---

### Examples
> Example 1: Get all transport filters

```PowerShell
PS C:\>Get-NetTransportFilter
This command gets all the transport filters on the computer.
```
> Example 2: Get transport filters that apply specified settings

```PowerShell
PS C:\>Get-NetTransportFilter –SettingName Internet
This command gets transport filters that apply Internet settings.
```

---

### Parameters
#### **AssociatedTCPSetting**
Specifies a NetTCPSetting object. The cmdlet gets transport filters associated with the setting that you specify. To obtain a NetTCPSetting object, use the Get-NetTCPSetting cmdlet.

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[CimInstance]`|false   |named   |true (ByValue)|

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **DestinationPrefix**
Specifies an array of destination prefixes of IP routes. The cmdlet gets transport filters that have the prefixes that you specify. A destination prefix consists of an IP address prefix and a prefix length, separated by a slash (/).

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **LocalPortEnd**
Specifies an array of upper bounds of ranges of local TCP ports. The cmdlet removes transport filters that have the upper bounds that you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |named   |false        |

#### **LocalPortStart**
Specifies an array of lower bounds of ranges of local TCP ports. The cmdlet removes transport filters that have the lower bounds that you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |named   |false        |

#### **Protocol**
Specifies an array of types of routing protocols.  The cmdlet gets transport filters based on the protocols that you specify. The acceptable values for this parameter are:
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

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Protocol[]]`|false   |named   |false        |

#### **RemotePortEnd**
Specifies an array of upper bounds of ranges of remote TCP ports. The cmdlet removes transport filters that have the upper bounds that you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |named   |false        |

#### **RemotePortStart**
Specifies an array of lower bounds of a ranges of remote TCP ports. The cmdlet removes transport filters that have the lower bounds that you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |named   |false        |

#### **SettingName**
Specifies an array of setting names. The cmdlet gets transport filters that have the settings that you specify. The acceptable values for this parameter are:
-- Internet
-- Datacenter
-- Compat
-- Custom

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

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
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetTransportFilter

---

### Syntax
```PowerShell
Get-NetTransportFilter [-AssociatedTCPSetting <CimInstance>] [-CimSession <CimSession[]>] [-DestinationPrefix <String[]>] [-LocalPortEnd <UInt16[]>] [-LocalPortStart <UInt16[]>] [-Protocol <Protocol[]>] [-RemotePortEnd <UInt16[]>] [-RemotePortStart <UInt16[]>] [-SettingName <String[]>] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
