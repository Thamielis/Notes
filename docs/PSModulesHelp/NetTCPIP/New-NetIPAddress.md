New-NetIPAddress
----------------

### Synopsis
Creates and configures an IP address.

---

### Description

The New-NetIPAddress cmdlet creates and configures an IP address. To create a specific IP address object, specify either an IPv4 address or an IPv6 address, and an interface index or interface alias. We recommend that you define the prefix length, also known as a subnet mask, and a default gateway.

If you run this cmdlet to add an IP address to an interface on which DHCP is already enabled, then DHCP is automatically disabled. If Duplicate Address Detection (DAD) is enabled on the interface, the new IP address is not usable until DAD successfully finishes, which confirms the uniqueness of the IP address on the link.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=288394)

* [Get-NetIPAddress](Get-NetIPAddress)

* [Remove-NetIPAddress](Remove-NetIPAddress)

* [Remove-NetRoute](Remove-NetRoute)

* [Set-NetIPAddress](Set-NetIPAddress)

---

### Examples
> Example 1: Add an IPv4 address

```PowerShell
PS C:\>New-NetIPAddress –InterfaceIndex 12 –IPAddress 192.168.0.1 -PrefixLength 24 -DefaultGateway 192.168.0.5

The second command removes the IPv4 address. To remove the IPv4 address, use the Remove-NetIPAddress cmdlet.
PS C:\>Remove-NetIPAddress –IPAddress 192.168.0.1 -DefaultGateway 192.168.0.5
The first command adds a new IPv4 address to the network interface at index 12. The PrefixLength parameter specifies the subnet mask for the IP address. In this example, the PrefixLength of 24 equals a subnet mask of 255.255.255.0.  When you add an IPv4 address, the address specified for the Default Gateway must be in the same subnet as the IPv4 address that you add.
```

---

### Parameters
#### **AddressFamily**
Specifies an IP address family. The cmdlet creates an IP address for the family. If you do not specify this parameter, the property is automatically generated. The acceptable values for this parameter are:
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

#### **DefaultGateway**
Specifies the IPv4 address or IPv6 address of the default gateway for the host. Default gateways provide a default route for TCP/IP hosts to use when communicating with other hosts on remote networks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InterfaceAlias**
Specifies an alias of a network interface. The cmdlet creates an IP address for the alias.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies an index of a network interface. The cmdlet creates an IP address for the index.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[UInt32]`|true    |named   |True (ByPropertyName)|ifIndex|

#### **IPAddress**
Specifies the IPv4 or IPv6 address to create.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|true    |1       |True (ByPropertyName)|LocalAddress|

#### **PolicyStore**
Specifies a PolicyStore value. The acceptable values for this parameter are:
 -- ActiveStore. The IP address information is valid. 
 -- PersistentStore. The computer saves IP address information across restarts. When the computer restarts, it copies the saved settings to the ActiveStore. 
The default value is ActiveStore. Specify ActiveStore only.
If you do not specify this parameter, the default entries are created in both the ActiveStore and the PersistentStore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PreferredLifetime**
Specifies a preferred lifetime, as a TimeSpan object, for an IP address. To obtain a TimeSpan object, use the New-TimeSpan cmdlet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **PrefixLength**
Specifies a prefix length. This parameter defines the local subnet size, and is also known as a subnet mask.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Byte]`|false   |named   |false        |

#### **SkipAsSource**
Indicates whether an address is a primary IP address. This parameter identifies the primary IP address for outgoing traffic in a multiple IP address scenario. If this parameter is set to True, the addresses are not used for outgoing traffic and are not registered in DNS.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Type**
Specifies an IP address type. The acceptable values for this parameter are:
 -- Unicast
 -- Anycast
The default value is Unicast.
Valid Values:

* Unicast
* Anycast

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Type]`|false   |named   |false        |

#### **ValidLifetime**
Specifies a valid lifetime value, as a TimeSpan object, for an IP address. To obtain a TimeSpan object, use the New-TimeSpan cmdlet.

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
None

---

### Outputs
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetIPAddress

---

### Syntax
```PowerShell
New-NetIPAddress [-IPAddress] <String> [-AddressFamily {IPv4 | IPv6}] [-CimSession <CimSession[]>] [-DefaultGateway <String>] [-PolicyStore <String>] [-PreferredLifetime <TimeSpan>] [-PrefixLength <Byte>] [-SkipAsSource <Boolean>] [-ThrottleLimit <Int32>] [-Type {Unicast | Anycast}] [-ValidLifetime <TimeSpan>] -InterfaceAlias <String> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
New-NetIPAddress [-IPAddress] <String> [-AddressFamily {IPv4 | IPv6}] [-CimSession <CimSession[]>] [-DefaultGateway <String>] [-PolicyStore <String>] [-PreferredLifetime <TimeSpan>] [-PrefixLength <Byte>] [-SkipAsSource <Boolean>] [-ThrottleLimit <Int32>] [-Type {Unicast | Anycast}] [-ValidLifetime <TimeSpan>] -InterfaceIndex <UInt32> [-Confirm] [-WhatIf] [<CommonParameters>]
```
