Remove-NetRoute
---------------

### Synopsis
Removes IP routes from the IP routing table.

---

### Description

The Remove-NetRoute cmdlet removes IP routes from the IP routing table. Run this cmdlet without any parameters to remove all IP routes from the routing table, including default routes. You can also specify routes to remove by specifying parameters, or by using the Get-NetRoute cmdlet.

For more information about routing, see Chapter 5 - IP Routing (http://technet.microsoft.com/library/bb727001.aspx) in the TechNet library.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkID=288400)

* [Find-NetRoute](Find-NetRoute)

* [Get-NetRoute](Get-NetRoute)

* [New-NetRoute](New-NetRoute)

* [Set-NetRoute](Set-NetRoute)

* [Get-NetIPInterface](Get-NetIPInterface)

---

### Examples
> Example 1: Remove all routes

```PowerShell
PS C:\>Remove-NetRoute
This command removes all of the IP routes on the computer, including default routes.
```
> Example 2: Remove routes for a specified next hop

```PowerShell
PS C:\>Remove-NetRoute –NextHop "192.168.0.1"
This command removes all of the IP routes that have a next hop of 192.168.0.1.
```

---

### Parameters
#### **AddressFamily**
Specifies an array of IP address families of IP routes. The cmdlet removes IP routes that belong to the families that you specify. The acceptable values for this parameter are:
-- IPv4
-- IPv6
Valid Values:

* IPv4
* IPv6

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[AddressFamily[]]`|false   |named   |false        |

#### **AssociatedIPInterface**
Specifies an IP interface as a CIM object. The cmdlet removes IP routes that belong to the interfaces that you specify. To obtain an IP interface, use the Get-NetIPInterface cmdlet.

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[CimInstance]`|false   |named   |True (ByValue)|

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **CompartmentId**
Specifies an array of identifiers for network compartments in the protocol stack. By default, the cmdlet only removes Net routes in the default compartment. If you specify a value, the cmdlet removes any matching Net routes in all compartments in this field.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **DestinationPrefix**
Specifies an array of destination prefixes of IP routes. The cmdlet removes IP routes that use the prefixes that you specify. A destination prefix contains an IP address prefix and a prefix length, separated by a slash (/). A value of 0.0.0.0/0 for IPv4 or ::/0 for IPv6 indicates that the value of the NextHop parameter is a default gateway.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **IncludeAllCompartments**
Indicates that the cmdlet includes routes from all configured network compartments. If you do not specify this parameter, the cmdlet removes only routes in the default network compartment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InterfaceAlias**
Specifies an array of aliases of network interfaces. The cmdlet removes IP routes for the interfaces that have the aliases that you specify.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies an array of indexes of network interfaces. The cmdlet removes IP routes for the interfaces located at the indexes that you specify.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[UInt32[]]`|false   |named   |True (ByPropertyName)|ifIndex|

#### **InterfaceMetric**
Specifies an array of integer interface metrics for network interfaces. The cmdlet removes IP routes for the interfaces that have the metric that you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **NextHop**
Specifies an array of next hop values. The cmdlet removes routes that have the next hop values that you specify. A value of 0.0.0.0 for IPv4 or :: for IPv6 indicates that the route is on the local subnet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **PassThru**
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PolicyStore**
Specifies a PolicyStore value. The cmdlet removes IP routes that have the PolicyStore value that you specify. The acceptable values for this parameter are:
-- ActiveStore. The IP address information is valid. 
-- PersistentStore. The computer saves IP address information across restarts. When the computer restarts, it copies the saved settings to the ActiveStore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PreferredLifetime**
Specifies an array of values for preferred lifetime, as TimeSpan objects, of IP routes. The cmdlet removes IP routes that have the lifetimes that you specify. To obtain a TimeSpan object, use the New-TimeSpan cmdlet. For more information, type Get-Help New-TimeSpan.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[TimeSpan[]]`|false   |named   |false        |

#### **Protocol**
Specifies an array of types of routing protocols. The cmdlet removes IP routes that use the protocols that you specify. The acceptable values for this parameter are:
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
Specifies an array of publish settings of IP routes. The cmdlet removes IP routes that have the publish settings that you specify. The acceptable values for this parameter are:
-- No. Do not publish or advertise IP route information in router advertisements. 
-- Yes. Publish and advertise IP route information that includes an infinite valid lifetime in router advertisements 
-- Age. Publish and advertise IP route information with a finite valid lifetime in router advertisements.
Valid Values:

* No
* Age
* Yes

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Publish[]]`|false   |named   |false        |

#### **RouteMetric**
Specifies an array of integer route metrics for IP routes. The cmdlet removes IP routes that have the metrics that you specify. To choose among multiple routes, the computer adds this value to the interface metric value. The computer selects the route with the lowest combined value. To modify the interface metric, use the Set-NetIPInterface cmdlet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |named   |false        |

#### **State**
Specifies an array of state values for IP routes. The cmdlet gets entries that have the state values that you specify.
The acceptable values for this parameter are:
-- Alive
-- Dead
-- Probe
Valid Values:

* Alive
* Dead
* Probe

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[State[]]`|false   |named   |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **ValidLifetime**
Specifies an array of values for valid lifetime, as a TimeSpan object, for IP routes. The cmdlet removes IP routes that have the lifetime that you specify. To obtain a TimeSpan object, use the New-TimeSpan cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[TimeSpan[]]`|false   |named   |false        |

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
Microsoft.Management.Infrastructure.CimInstance#rootStandardCimv2MSFT_NetRoute

The Microsoft.Management.Infrastructure.CimInstance object is a wrapper class that displays Windows Management Instrumentation (WMI) objects. The path after the pound sign (#) provides the namespace and class name for the underlying WMI object.

---

### Outputs
* None

---

### Syntax
```PowerShell
Remove-NetRoute [[-DestinationPrefix] <String[]>] [-AddressFamily <AddressFamily[]>] [-AssociatedIPInterface <CimInstance>] [-CimSession <CimSession[]>] [-CompartmentId <UInt32[]>] [-IncludeAllCompartments] [-InterfaceAlias <String[]>] [-InterfaceIndex <UInt32[]>] [-InterfaceMetric <UInt32[]>] [-NextHop <String[]>] [-PassThru] [-PolicyStore <String>] [-PreferredLifetime <TimeSpan[]>] [-Protocol <Protocol[]>] [-Publish <Publish[]>] [-RouteMetric <UInt16[]>] [-State <State[]>] [-ThrottleLimit <Int32>] [-ValidLifetime <TimeSpan[]>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-NetRoute [-CimSession <CimSession[]>] [-PassThru] [-ThrottleLimit <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
