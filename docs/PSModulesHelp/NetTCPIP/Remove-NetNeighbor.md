Remove-NetNeighbor
------------------

### Synopsis
Removes neighbor cache entries.

---

### Description

The Remove-NetNeighbor cmdlet removes neighbor cache entries. The neighbor cache maintains information for each on-link neighbor, including the IP address and the associated link-layer address.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=288399)

* [Get-NetAdapter](Get-NetAdapter)

* [Get-NetNeighbor](Get-NetNeighbor)

* [New-NetNeighbor](New-NetNeighbor)

* [Set-NetNeighbor](Set-NetNeighbor)

---

### Examples
> Example 1: Remove unreachable neighbor cache entries

```PowerShell
PS C:\>Remove-NetNeighbor –State Unreachable
This command removes all neighbor cache entries that are unreachable.
```
> Example 2: Remove neighbor cache entries associated with a network adapter

```PowerShell
PS C:\>Get-NetAdapter | Where-Object –FilterScript {$_.LinkSpeed –Eq "100 Mbps"} | Remove-NetNeighbor –AddressFamily IPv4
This command gets a NetAdapter object that contains network adapters, and then passes the NetAdapter object to the Where-Object cmdlet by using the pipeline operator. The Where-Object cmdlet filters the network adapters that have a link speed of 100 Mbps, and then passes the network NetAdapter object to the Remove-NetNeighbor cmdlet. The Remove-NetNeighbor cmdlet  removes all neighbor cache entries that have IPv4 addresses and are associated with a network adapter that has a link speed of 100 Mbps.
```

---

### Parameters
#### **AddressFamily**
Specifies an array of IP address families. The cmdlet removes the neighbor cache entries that belong to the IP address families you specify. The acceptable values for this parameter are:
-- IPv4
-- IPv6
Valid Values:

* IPv4
* IPv6

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[AddressFamily[]]`|false   |named   |false        |

#### **AssociatedIPInterface**
Specifies an IP interface as a CIM object. The cmdlet removes neighbor cache entries that belong to this interface. To obtain an IP interface, use the Get-NetIPInterface cmdlet.

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[CimInstance]`|false   |named   |True (ByValue)|

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **IncludeAllCompartments**
Indicates that the cmdlet includes neighbor cache entries from all configured network compartments. If you do not specify this parameter, the cmdlet removes only neighbor cache entries in the default network compartment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IPAddress**
Specifies an array of IP addresses. The cmdlet removes neighbor cache entries that have the IP addresses you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **LinkLayerAddress**
Specifies an array of link-layer addresses of the neighbor cache entry. The cmdlet removes the neighbor cache entries that have the link-layer addresses you specify.
The link-layer address is also called the media access control (MAC) address. A link-layer address that uses IPv4 address syntax is a tunnel technology that encapsulates packets over an IPv4 tunnel, such as Intra-Site Automatic Tunnel Addressing Protocol (ISATAP) or Teredo. A link-layer address of all zeroes indicates that the neighbor is unreachable and the neighbor cache entry does not have a link-layer address entry. An empty link-layer address indicates that the link layer does not use link-layer addresses, such as on a loopback interface.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **InterfaceAlias**
Specifies an array of aliases of network interfaces. The cmdlet removes neighbor cache entries for the network interfaces that have the aliases you specify.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies an array of indexes of network interfaces. The cmdlet removes neighbor cache entries for the network interfaces located at the indexes you specify.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[UInt32[]]`|false   |named   |True (ByPropertyName)|ifIndex|

#### **PassThru**
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PolicyStore**
Specifies a PolicyStore value. The cmdlet removes the neighbor cache entries that have the PolicyStore value you specify. The acceptable values for this parameter are:
-- ActiveStore: The IP address information is valid. 
-- PersistentStore: The computer saves IP address information across restarts. When the computer restarts, it copies the saved settings to the ActiveStore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **State**
Specifies an arrary of states of neighbor cache entries. The cmdlet removes the neighbor cache entries that have the states you specify. The neighbor cache contains information maintained by Neighbor Unreachability Detection. Neighbor Unreachability Detection for IPv4 tracks the reachable state of IPv4 nodes in the IPv4 route cache. The acceptable values for this parameter are:
-- Unreachable. The IP address is unreachable. 
-- Incomplete. Address resolution is in progress and Neighbor Unreachability Detection has not determined the link-layer address of the neighbor. 
-- Probe. The neighbor is no longer known to be reachable, and Neighbor Unreachability Detection is sending unicast Neighbor Solicitation probes to verify reachability. 
-- Delay. The neighbor is no longer known to be reachable, and traffic was recently sent to the neighbor. Neighbor Unreachability Detection does not probe the neighbor immediately. Neighbor Unreachability Detection delays sending probes for a short time  so that the upper layer protocols can provide reachability confirmation. 
-- Stale. The neighbor is no longer known to be reachable. and Until traffic is sent to the neighbor, Neighbor Unreachability Detection makes no attempt to verify its reachability. 
-- Reachable. The neighbor is known to have been reachable recently, within the last minute. 
-- Permanent. The neighbor is statically provisioned and will not expire unless you remove it  through configuration. 
-- Maximum. A maximum value for testing purposes.
Valid Values:

* Unreachable
* Incomplete
* Probe
* Delay
* Stale
* Reachable
* Permanent

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[State[]]`|false   |named   |false        |

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
Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetNeighbor

The Microsoft.Management.Infrastructure.CimInstance object is a wrapper class that displays Windows Management Instrumentation (WMI) objects. The path after the pound sign (#) provides the namespace and class name for the underlying WMI object.

---

### Outputs
* None

---

### Syntax
```PowerShell
Remove-NetNeighbor [[-IPAddress] <String[]>] [-AddressFamily <AddressFamily[]>] [-AssociatedIPInterface <CimInstance>] [-CimSession <CimSession[]>] [-IncludeAllCompartments] [-InterfaceAlias <String[]>] [-InterfaceIndex <UInt32[]>] [-LinkLayerAddress <String[]>] [-PassThru] [-PolicyStore <String>] [-State <State[]>] [-ThrottleLimit <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-NetNeighbor [-CimSession <CimSession[]>] [-PassThru] [-ThrottleLimit <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
