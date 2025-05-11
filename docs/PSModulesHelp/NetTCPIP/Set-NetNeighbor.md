Set-NetNeighbor
---------------

### Synopsis
Modifies a neighbor cache entry.

---

### Description

The Set-NetNeighbor cmdlet modifies a neighbor cache entry. The neighbor cache maintains information for each on-link neighbor, including the IP address and the associated link-layer address. You can modify only neighbor cache entries that are in a permanent state on interfaces that have link-layer addresses. Use this cmdlet to modify the link-layer address and policy store setting of a neighbor cache entry.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=289169)

* [Get-NetNeighbor](Get-NetNeighbor)

* [New-NetNeighbor](New-NetNeighbor)

* [Remove-NetNeighbor](Remove-NetNeighbor)

---

### Examples
> Example 1: Set the link-layer address for a neighbor cache entry

```PowerShell
PS C:\>Set-NetNeighbor –InterfaceIndex 12 –IPAddress "192.168.0.5" –LinkLayerAddress "00-00-12-00-00-ff"
This command sets the link-layer address for the neighbor cache entry that has the IP address 192.168.0.5 and the interface index value of 12.
```
> Example 2: Set the link-layer address for a neighbor cache entry by using an input object

```PowerShell
PS C:\>Get-NetNeighbor –InterfaceIndex 12 –IPAddress "192.168.0.5" | Set-NetNeighbor –LinkLayerAddress "00-00-12-00-00-ff"
This command gets the NetNeighbor object that has the IP address 192.168.0.5 and the interface index value of 12. The command passes the object to the Set-NetNeighbor cmdlet by using the pipeline operator. Set-NetNeighbor sets the link-layer address for the neighbor cache entry to 00-00-12-00-00-ff.
```

---

### Parameters
#### **AddressFamily**
Specifies an array of IP address families. The cmdlet modifies the neighbor cache entries that belong to the IP address families you specify. If you do not specify this parameter, the cmdlet automatically generates the address families of the neighbor cache entries. The acceptable values for this parameter are:
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

#### **IncludeAllCompartments**
Indicates that the cmdlet includes neighbor cache entries from all configured network compartments. If you do not specify this parameter, the cmdlet modifies only neighbor cache entries in the default network compartment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IPAddress**
Specifies an array of IP addresses. The cmdlet modifies neighbor cache entries that have the IP addresses you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **LinkLayerAddress**
Specifies the link-layer address of the neighbor cache entry. The cmdlet modifies the link-layer address of the neighbor cache entry you specify.
The link-layer address is also called the media access control (MAC) address. A link-layer address that uses IPv4 address syntax is a tunnel technology that encapsulates packets over an IPv4 tunnel, such as Intra-Site Automatic Tunnel Addressing Protocol (ISATAP) or Teredo. A link-layer address of all zeroes indicates that the neighbor is unreachable and the neighbor cache entry does not have a link-layer address entry. An empty link-layer address indicates that the link layer does not use link-layer addresses, such as on a loopback interface.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InterfaceAlias**
Specifies an array of aliases of network interfaces. The cmdlet modifies neighbor cache entries for the network interfaces that have the aliases you specify.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies an array of indexes of network interfaces. The cmdlet modifies neighbor cache entries for the network interfaces located at the indexes you specify.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[UInt32[]]`|false   |named   |True (ByPropertyName)|ifIndex|

#### **PassThru**
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PolicyStore**
Specifies a PolicyStore value. The cmdlet modifies the PolicyStore setting for the neighbor cache entry to the value you specify. The acceptable values for this parameter are:
-- ActiveStore: The IP address information is valid. 
-- PersistentStore: The computer saves IP address information across restarts. When the computer restarts, it copies the saved settings to the ActiveStore. 
Specify ActiveStore only.
If you do not specify this parameter, the default entries are created in both the ActiveStore and the PersistentStore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **State**
Specifies an array of states of the neighbor cache entry. The cmdlet modifies the neighbor cache entries that have the states you specify. You can modify only neighbor cache entries that are in a permanent state. The acceptable values for this parameter are:
-- Permanent. The neighbor is statically provisioned and will not expire unless you remove it.
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
Set-NetNeighbor [[-IPAddress] <String[]>] [-AddressFamily <AddressFamily[]>] [-CimSession <CimSession[]>] [-IncludeAllCompartments] [-InterfaceAlias <String[]>] [-InterfaceIndex <UInt32[]>] [-LinkLayerAddress <String>] [-PassThru] [-PolicyStore <String>] [-State <State[]>] [-ThrottleLimit <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-NetNeighbor [-CimSession <CimSession[]>] [-LinkLayerAddress <String>] [-PassThru] [-ThrottleLimit <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
