New-NetNeighbor
---------------

### Synopsis
Creates a neighbor cache entry.

---

### Description

The New-NetNeighbor cmdlet creates a neighbor cache entry. The neighbor cache maintains information for each on-link neighbor, including the IP address and the associated link-layer address. The address family that you specify for the neighbor cache entry must match the address family of the IP interface.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=288395)

* [Get-NetAdapter](Get-NetAdapter)

* [Get-NetNeighbor](Get-NetNeighbor)

* [Remove-NetNeighbor](Remove-NetNeighbor)

* [Set-NetNeighbor](Set-NetNeighbor)

---

### Examples
> Example 1: Create an IPv4 neighbor cache entry

```PowerShell
PS C:\>New-NetNeighbor –InterfaceIndex 12 –IPAddress "192.168.0.5" –LinkLayerAddress "00-00-12-00-00-ff"
This command creates a neighbor cache entry that has the IP address 192.168.0.5. The command specifies that the neighbor is connected to the interface that has the index 12. The command specifies that the link-layer address of the neighbor cache entry is 00-00-12-00-00-ff.
```
> Example 2: Create an IPv6 neighbor cache entry

```PowerShell
PS C:\>New-NetNeighbor –InterfaceIndex 13 –IPAddress "fe80::5efe:192.168.0.5"
This command creates a neighbor cache entry on a virtual ISATAP interface that has the IP address fe80::5efe:192.168.0.5. The command specifies that the neighbor is connected to the interface that has the index 13.
```

---

### Parameters
#### **AddressFamily**
Specifies the IP address family. The cmdlet adds a neighbor cache entry that belongs to the IP address family you specify. If you do not specify this parameter, the cmdlet automatically generates the address families of the neighbor cache entries. The acceptable values for this parameter are:
-- IPv4
-- IPv6
Valid Values:

* IPv4
* IPv6

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[AddressFamily]`|false   |named   |false        |

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **IPAddress**
Specifies an IP address. The cmdlet adds a neighbor cache entry that has the IP address you specify.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **LinkLayerAddress**
Specifies the link-layer address of the neighbor cache entry. The cmdlet adds a neighbor cache entry that has the link-layer address you specify.
The link-layer address is also called the media access control (MAC) address. A link-layer address that uses IPv4 address syntax is a tunnel technology that encapsulates packets over an IPv4 tunnel, such as Intra-Site Automatic Tunnel Addressing Protocol (ISATAP) or Teredo. A link-layer address of all zeroes indicates that the neighbor is unreachable and the neighbor cache entry does not have a link-layer address entry. An empty link-layer address indicates that the link layer does not use link-layer addresses, such as on a loopback interface.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PolicyStore**
Specifies a PolicyStore value. The cmdlet adds a neighbor cache entry that has the PolicyStore value you specify. The acceptable values for this parameter are:
-- ActiveStore: The IP address information is valid. 
-- PersistentStore: The computer saves IP address information across restarts. When the computer restarts, it copies the saved settings to the ActiveStore. 
Specify ActiveStore only.
If you do not specify this parameter, the default entries are created in both the ActiveStore and the PersistentStore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InterfaceAlias**
Specifies the alias of a network interface. The cmdlet adds a neighbor cache entry for the network interface that has the alias you specify.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies the alias of a network interface. The cmdlet adds a neighbor cache entry for the network interface located at the index you specify.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[UInt32]`|true    |named   |True (ByPropertyName)|ifIndex|

#### **State**
Specifies the state of the neighbor cache entry. The cmdlet adds a neighbor cache entry that has the state you specify. You can create only neighbor cache entries that are in a permanent state. The acceptable values for this parameter are:
-- Permanent. The neighbor is statically provisioned and will not expire unless you remove it.
Valid Values:

* Unreachable
* Incomplete
* Probe
* Delay
* Stale
* Reachable
* Permanent

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[State]`|false   |named   |false        |

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
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetNeighbor

---

### Syntax
```PowerShell
New-NetNeighbor [-IPAddress] <String> [-AddressFamily {IPv4 | IPv6}] [-CimSession <CimSession[]>] [-LinkLayerAddress <String>] [-PolicyStore <String>] [-State {Unreachable | Incomplete | Probe | Delay | Stale | Reachable | Permanent}] [-ThrottleLimit <Int32>] -InterfaceAlias <String> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
New-NetNeighbor [-IPAddress] <String> [-AddressFamily {IPv4 | IPv6}] [-CimSession <CimSession[]>] [-LinkLayerAddress <String>] [-PolicyStore <String>] [-State {Unreachable | Incomplete | Probe | Delay | Stale | Reachable | Permanent}] [-ThrottleLimit <Int32>] -InterfaceIndex <UInt32> [-Confirm] [-WhatIf] [<CommonParameters>]
```
