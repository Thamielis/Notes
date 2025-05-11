Remove-NetTransportFilter
-------------------------

### Synopsis
Removes transport filters.

---

### Description

The Remove-NetTransportFilter cmdlet removes transport filters.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkID=288401)

* [Get-NetTCPSetting](Get-NetTCPSetting)

* [Get-NetTransportFilter](Get-NetTransportFilter)

* [New-NetTransportFilter](New-NetTransportFilter)

---

### Examples
> Example 1: Remove transport filters for a setting name

```PowerShell
PS C:\>Remove-NetTransportFilter –SettingName Custom
This command removes all of the transport filters on the server that have the setting name of Custom.
```
> Example 2: Remove transit filters for objects with a specified congestion window

```PowerShell
PS C:\>Get-NetTCPSetting –InitialCongestionWindowMss 4 | Remove-NetTransportFilter
This command uses the Get-NetTCPSetting cmdlet to get all of the NetTcpSetting objects that have an initial congestion window of 4 maximum segment size (MSS) units, and then passes them to the current cmdlet by using the pipeline operator. The command removes transport filters for these settings.
```

---

### Parameters
#### **AssociatedTCPSetting**
Specifies a NetTCPSetting object. The cmdlet removes transport filters associated with the setting that you specify. To obtain a NetTCPSetting object, use the Get-NetTCPSetting cmdlet.

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[CimInstance]`|false   |named   |True (ByValue)|

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **DestinationPrefix**
Specifies an array of destination prefixes of IP routes. The cmdlet removes transport filters that have the prefixes that you specify. A destination prefix consists of an IP address prefix and a prefix length, separated by a slash (/).

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

#### **PassThru**
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Protocol**
Specifies an array of types of routing protocols. The cmdlet removes transport filters based on the protocols that you specify. The acceptable values for this parameter are:
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
Specifies an array of upper bounds of ranges of remote TCP ports.  The cmdlet removes transport filters that have the upper bounds that you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |named   |false        |

#### **RemotePortStart**
Specifies an array of lower bounds of ranges of remote TCP ports. The cmdlet removes transport filters that have the lower bounds that you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |named   |false        |

#### **SettingName**
Specifies an array of setting names. The cmdlet removes transport filters that have the settings that you specify. The acceptable values for this parameter are:
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
Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetTransportFilter

The Microsoft.Management.Infrastructure.CimInstance object is a wrapper class that displays Windows Management Instrumentation (WMI) objects. The path after the pound sign (#) provides the namespace and class name for the underlying WMI object.

---

### Outputs
* None

---

### Syntax
```PowerShell
Remove-NetTransportFilter [-AssociatedTCPSetting <CimInstance>] [-CimSession <CimSession[]>] [-DestinationPrefix <String[]>] [-LocalPortEnd <UInt16[]>] [-LocalPortStart <UInt16[]>] [-PassThru] [-Protocol <Protocol[]>] [-RemotePortEnd <UInt16[]>] [-RemotePortStart <UInt16[]>] [-SettingName <String[]>] [-ThrottleLimit <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-NetTransportFilter [-CimSession <CimSession[]>] [-PassThru] [-ThrottleLimit <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
