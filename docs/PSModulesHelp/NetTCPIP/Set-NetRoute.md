Set-NetRoute
------------

### Synopsis
Modifies an entry or entries in the IP routing table.

---

### Description

The Set-NetRoute cmdlet modifies entries in the IP routing table. Specify routes to modify by using the DestinationPrefix parameter or the NextHop parameter. You can also specify routes by using the Get-NetRoute cmdlet. If you do not specify which routes to modify, the cmdlets modifies all of the routes on the computer.

IP routing is the process of forwarding a packet based on the destination IP address. Routing occurs at TCP/IP hosts and at IP routers. The sending host or router determines where to forward the packet. To determine where to forward a packet, the host or router consults a routing table that is stored in memory. When TCP/IP starts, it creates entries in the routing table. You can add entries either manually or automatically.

For more information about routing, see Chapter 5 - IP Routing (http://technet.microsoft.com/library/bb727001.aspx) in the TechNet library.

After you create an entry in the routing table, you cannot modify the destination prefix or the next hop value. If necessary, use the Remove-NetRoute cmdlet to remove the entry, and then recreate it with the desired values by using the New-NetRoute cmdlet.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkID=289171)

* [New-TimeSpan](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/New-TimeSpan)

* [Find-NetRoute](Find-NetRoute)

* [Get-NetRoute](Get-NetRoute)

* [New-NetRoute](New-NetRoute)

* [Remove-NetRoute](Remove-NetRoute)

* [Set-NetIPInterface](Set-NetIPInterface)

---

### Examples
> Example 1: Change the route metric

```PowerShell
PS C:\>Set-NetRoute –RouteMetric 257
This command changes the route metric to 257. This route is less preferred than routes that have the default value of 256.
```
> Example 2: Modify the preferred lifetime

```PowerShell
PS C:\> $TimeSpan = New-TimeSpan –Days 1
PS C:\> Set-NetRoute –DestinationPrefix "192.168.0.0/24" –PreferredLifetime $TimeSpan
The first command uses the New-TimeSpan cmdlet to create a time span of one day, and then stores it in the $TimeSpan variable. For more information, type Get-Help New-TimeSpan.

The second command changes the lifetime of the IP route that has the destination prefix 192.168.0.0/24. The command specifies the object stored in the $TimeSpan variable as the new preferred lifetime.
```

---

### Parameters
#### **AddressFamily**
Specifies an array of IP address families of IP routes. The cmdlet modifies the family that you specify for the IP route. The acceptable values for this parameter are:
-- IPv4 
-- IPv6
Valid Values:

* IPv4
* IPv6

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[AddressFamily[]]`|false   |named   |false        |

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **DestinationPrefix**
Specifies an array of destination prefixes of IP routes. The cmdlet modifies settings for this IP route. A destination prefix contains an IP address prefix and a prefix length, separated by a slash (/). A value of 0.0.0.0/0 for IPv4 or ::/0 for IPv6 indicates that the value of the NextHop parameter is a default gateway.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **IncludeAllCompartments**
Indicates that the cmdlet includes routes from all configured network compartments. If you do not specify this parameter, the cmdlet modifies only routes in the default network compartment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InterfaceAlias**
Specifies an array of aliases of network interfaces. The cmdlet modifies IP routes for the interfaces that have the aliases that you specify.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies an array of indexes of network interfaces. The cmdlet modifies IP routes for the interfaces located at the indexes that you specify.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[UInt32[]]`|false   |named   |True (ByPropertyName)|ifIndex|

#### **NextHop**
Specifies an array of next hop values. The cmdlet modifies the routes that have these values. A value of 0.0.0.0 for IPv4 or :: for IPv6 indicates that the route is on the local subnet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **PassThru**
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PolicyStore**
Specifies a PolicyStore value. The cmdlet changes the PolicyStore value to the value that you specify. The acceptable values for this parameter are:
-- ActiveStore. The IP address information is valid. 
-- PersistentStore. The computer saves IP address information across restarts. When the computer restarts, it copies the saved settings to the ActiveStore. 
Specify ActiveStore only.
If you do not specify this parameter, the default entries are created in both the ActiveStore and the PersistentStore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PreferredLifetime**
Specifies a preferred lifetime, as a TimeSpan object, of an IP route. The cmdlet changes the lifetime to the value that you specify. To obtain a TimeSpan object, use the New-TimeSpan cmdlet. For more information, type Get-Help New-TimeSpan.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **Protocol**
Specifies an array of types of routing protocols. The cmdlet changes the protocol to the value you specify. The acceptable values for this parameter are:
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

* Other
* Local
* NetMgmt
* Icmp
* Egp
* Ggp
* Hello
* Rip
* IsIs
* EsIs
* Igrp
* Bbn
* Ospf
* Bgp
* Idpr
* Eigrp
* Dvmrp
* Rpl
* Dhcp

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Protocol[]]`|false   |named   |false        |

#### **Publish**
Specifies the publish setting of an IP route. The cmdlet changes the publish value to the value that you specify. The acceptable values for this parameter are:
-- No. Do not publish or advertise IP route information in router advertisements. 
-- Yes. Publish and advertise IP route information with an infinite valid lifetime in router advertisements. 
-- Age. Publish and advertise IP route information with a finite valid lifetime, in router advertisements. Specify a valid lifetime by using the ValidLifetime parameter.
Valid Values:

* No
* Age
* Yes

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Publish]`|false   |named   |false        |

#### **RouteMetric**
Specifies an integer route metric for an IP route. The cmdlet changes the metric to the value that you specify. To choose among multiple routes, the computer adds this value to the interface metric value. The computer selects the route with the lowest combined value. To modify the interface metric, use the Set-NetIPInterface cmdlet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **ValidLifetime**
Specifies a valid lifetime, as a TimeSpan object, for an IP route. The cmdlet changes the lifetime to the value that you specify. To obtain a TimeSpan object, use the New-TimeSpan cmdlet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

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
Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetPrefixPolicy

The Microsoft.Management.Infrastructure.CimInstance object is a wrapper class that displays Windows Management Instrumentation (WMI) objects. The path after the pound sign (#) provides the namespace and class name for the underlying WMI object.

---

### Outputs
* None

---

### Syntax
```PowerShell
Set-NetRoute [[-DestinationPrefix] <String[]>] [-AddressFamily <AddressFamily[]>] [-CimSession <CimSession[]>] [-IncludeAllCompartments] [-InterfaceAlias <String[]>] [-InterfaceIndex <UInt32[]>] [-NextHop <String[]>] [-PassThru] [-PolicyStore <String>] [-PreferredLifetime <TimeSpan>] [-Protocol <Protocol[]>] [-Publish {No | Age | Yes}] [-RouteMetric <UInt16>] [-ThrottleLimit <Int32>] [-ValidLifetime <TimeSpan>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-NetRoute [-CimSession <CimSession[]>] [-PassThru] [-PreferredLifetime <TimeSpan>] [-Publish {No | Age | Yes}] [-RouteMetric <UInt16>] [-ThrottleLimit <Int32>] [-ValidLifetime <TimeSpan>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
