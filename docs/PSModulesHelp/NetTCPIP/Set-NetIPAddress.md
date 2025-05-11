Set-NetIPAddress
----------------

### Synopsis
Modifies the configuration of an IP address.

---

### Description

The Set-NetIPAddress cmdlet modifies IP address configuration properties of an existing IP address.

To create an IPv4 address or IPv6 address, use the New-NetIPAddress cmdlet.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=289165)

* [New-TimeSpan](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/New-TimeSpan)

* [Get-NetIPAddress](Get-NetIPAddress)

* [New-NetIPAddress](New-NetIPAddress)

* [Remove-NetIPAddress](Remove-NetIPAddress)

---

### Examples
> Example 1: Modify an IP address

```PowerShell
PS C:\> Set-NetIPAddress –InterfaceIndex 12 –IPAddress 192.168.0.1
PS C:\> Set-NetIPAddress –InterfaceIndex 12 –IPAddress 192.168.0.1 –PrefixLength 24
This command adds the IP address 192.168.0.1 to the interface located at index 12.

The PrefixLength parameter may also be specified as part of the Set-NetIPAddress cmdlet.
```
> Example 2: Modify an IP address and set the valid lifetime

```PowerShell
PS C:\> $Timesp = ( New-TimeSpan –Days 1 )
PS C:\> Set-NetIPAddress –InterfaceIndex 12 –IPAddress 192.168.0.1 –PreferredLifetime $Timesp
The first command creates a new TimeSpan object of one day, and stores it in the variable named $Timesp.

The second command then uses the TimeSpan object to set the preferred lifetime of the IP address located at interface 12 to one day.
```

---

### Parameters
#### **AddressFamily**
Specifies an array of IP address families. The cmdlet modifies the IP address configuration that matches the families. The acceptable values for this parameter are:
 -- IPv4 
 -- IPv6
Valid Values:

* IPv4
* IPv6

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[AddressFamily[]]`|false   |named   |false        |

#### **AddressState**
Specifies an array of duplicate address detection (DAD) state values for the IP address. The acceptable values for this parameter are:
-- Invalid. IP address configuration information for addresses that are not valid and will not be used. 
-- Tentative. IP address configuration information for addresses that are not used for communication, as the uniqueness of those IP addresses is being verified. 
-- Duplicate. IP address configuration information for addresses for which a duplicate IP address has been detected and the current IP address will not be used. 
-- Deprecated. IP address configuration information for addresses that will no longer be used to establish new connections, but will continue to be used with existing connections. 
-- Preferred. IP address configuration information for addresses that are valid and available for use.
Valid Values:

* Invalid
* Tentative
* Duplicate
* Deprecated
* Preferred

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[AddressState[]]`|false   |named   |false        |

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **IncludeAllCompartments**
Indicates that the cmdlet includes addresses from all configured network compartments. If you do not specify this parameter, the cmdlet modifies only addresses in the default network compartment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InterfaceAlias**
Specifies an array of aliases of network interfaces. The cmdlet modifies IP addresses that match the aliases.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies an array of indexes of network interfaces. The cmdlet modifies IP addresses that match the indexes.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[UInt32[]]`|false   |named   |True (ByPropertyName)|ifIndex|

#### **IPAddress**
Specifies an array of IPv4 or IPv6 addresses.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |1       |True (ByPropertyName)|LocalAddress|

#### **PassThru**
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **PrefixOrigin**
ps_deprecate_para
Valid Values:

* Other
* Manual
* WellKnown
* Dhcp
* RouterAdvertisement

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[PrefixOrigin[]]`|false   |named   |false        |

#### **SkipAsSource**
Indicates whether an address is a primary IP address. This parameter identifies the primary IP address for outgoing traffic in a multiple IP address scenario. If this parameter is set to True, the address is not used for outgoing traffic and is not registered in DNS.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **SuffixOrigin**
Specifies an array of origins for address suffixes. IP addresses are divided into two parts, the prefix and the suffix. The address prefix identifies the network portion of an IP address, and the address suffix identifies the host portion. The acceptable values for this parameter are:
 -- Manual. The IP address suffix was manually specified. 
 -- WellKnown. The IP address suffix is from a well-known source. 
 -- DHCP. The IP address suffix was provided by DHCP settings. 
 -- Link. The IP address suffix was obtained from the link-layer address. 
 -- Random. The IP address suffix was obtained from a random source.
Valid Values:

* Other
* Manual
* WellKnown
* Dhcp
* Link
* Random

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[SuffixOrigin[]]`|false   |named   |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Type**
Specifies an array of IP address types. The acceptable values for this parameter are:
 -- Unicast 
 -- Anycast 
The default value is Unicast.
Valid Values:

* Unicast
* Anycast

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Type[]]`|false   |named   |false        |

#### **ValidLifetime**
Specifies a valid lifetime, as a TimeSpan object, for an IP address. To obtain a TimeSpan object, use the New-TimeSpan cmdlet.

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
Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetIPAddress

The Microsoft.Management.Infrastructure.CimInstance object is a wrapper class that displays Windows Management Instrumentation (WMI) objects. The path after the pound sign (#) provides the namespace and class name for the underlying WMI object.

---

### Outputs
* None

---

### Syntax
```PowerShell
Set-NetIPAddress [[-IPAddress] <String[]>] [-AddressFamily <AddressFamily[]>] [-AddressState <AddressState[]>] [-CimSession <CimSession[]>] [-IncludeAllCompartments] [-InterfaceAlias <String[]>] [-InterfaceIndex <UInt32[]>] [-PassThru] [-PolicyStore <String>] [-PreferredLifetime <TimeSpan>] [-PrefixLength <Byte>] [-PrefixOrigin <PrefixOrigin[]>] [-SkipAsSource <Boolean>] [-SuffixOrigin <SuffixOrigin[]>] [-ThrottleLimit <Int32>] [-Type <Type[]>] [-ValidLifetime <TimeSpan>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-NetIPAddress [-CimSession <CimSession[]>] [-PassThru] [-PreferredLifetime <TimeSpan>] [-PrefixLength <Byte>] [-SkipAsSource <Boolean>] [-ThrottleLimit <Int32>] [-ValidLifetime <TimeSpan>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
