Get-NetIPAddress
----------------

### Synopsis
Gets the IP address configuration.

---

### Description

The Get-NetIPAddress cmdlet gets the IP address configuration, such as IPv4 addresses, IPv6 addresses and the IP interfaces with which addresses are associated. Without parameters, this cmdlet gets the entire IP address configuration for the computer.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=288380)

* [Get-NetRoute](Get-NetRoute)

* [New-NetIPAddress](New-NetIPAddress)

* [Remove-NetIPAddress](Remove-NetIPAddress)

* [Set-NetIPAddress](Set-NetIPAddress)

---

### Examples
> Example 1: Get IPv6 address configuration

```PowerShell
PS C:\>Get-NetIPAddress –AddressFamily IPv6
This command gets information about IP address configuration for all IPv6 addresses on the computer.
```
> Example 2: Get IP address information and format the output

```PowerShell
PS C:\>Get-NetIPAddress | Format-Table
This command gets information about IP address configuration, and displays that information in a table. The table format provides a convenient overview for computers with many IP addresses.
```
> Example 3: Get IP address information by the interface index

```PowerShell
PS C:\>Get-NetIPAddress –InterfaceIndex 12
This command gets information about IP address configuration for a specific interface index.
```
> Example 4: Get IP address information and sort the output

```PowerShell
PS C:\>Get-NetIPAddress | Sort-Object -Property InterfaceIndex | Format-Table
This command gets information about IP address configuration, sorts them numerically by the interface index in the cmdlet name, and then displays them in a table format. This display can help you find IP address information by interface index.
```
> Example 5: Get IP address information and filter the output

PS C:\>Get-NetIPAddress | Where-Object -FilterScript { $_.ValidLifetime -Lt ([TimeSpan]::FromDays(1)) }

Similarly, this cmdlet can be used to get information about IP address configuration for IP addresses that have an Infinite ValidLifetime.
PS C:\>Get-NetIPAddress | Where-Object -FilterScript { $_.ValidLifetime -Eq ([TimeSpan]::MaxValue) }
This command gets IP address configuration for IP addresses that have a ValidLifetime of less than one day.

---

### Parameters
#### **AddressFamily**
Specifies an array of IP address families. The cmdlet gets the IP address configuration that matches the address families. The acceptable values for this parameter are:
 -- IPv4
 -- IPv6
Valid Values:

* IPv4
* IPv6

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[AddressFamily[]]`|false   |named   |false        |

#### **AddressState**
Specifies an array of duplicate address detection (DAD) state values for the IP address. Use this parameter to filter the output based on addresses that are valid and available for use. The acceptable values for this parameter are:
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

#### **AssociatedIPInterface**
Specifies an IP interface as a CIM object. To obtain an IP interface, use the Get-NetIPInterface cmdlet.

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[CimInstance]`|false   |named   |True (ByValue)|

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **IncludeAllCompartments**
Indicates that the cmdlet includes addresses from all configured network compartments. If you do not specify this parameter, the cmdlet gets only addresses in the default network compartment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InterfaceAlias**
Specifies an array of aliases of network interfaces. The cmdlet gets IP addresses that match the aliases.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies an array of indexes of network interfaces. The cmdlet gets IP addresses that match the indexes.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[UInt32[]]`|false   |named   |True (ByPropertyName)|ifIndex|

#### **IPAddress**
Specifies an array of IPv4 or IPv6 addresses.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |1       |True (ByPropertyName)|LocalAddress|

#### **PolicyStore**
Specifies a PolicyStore value.  The acceptable values for this parameter are:
 -- ActiveStore. The IP address information is valid. 
                         
 -- PersistentStore. The computer saves IP address information across restarts. When the computer restarts, it copies the saved settings to the ActiveStore. 
                         
The default value is ActiveStore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PreferredLifetime**
Specifies an array of values of preferred lifetimes, as TimeSpan objects, for an IP address. To obtain a TimeSpan object, use the New-TimeSpan cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[TimeSpan[]]`|false   |named   |false        |

#### **PrefixLength**
Specifies an array of prefix lengths. This parameter defines the local subnet size, and is also known as a subnet mask.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Byte[]]`|false   |named   |false        |

#### **PrefixOrigin**
Specifies an array of origins for address prefixes. IP addresses are divided into two parts, the prefix and the suffix. The address prefix identifies the network portion of an IP address, and the address suffix identifies the host portion. The acceptable values for this parameter are:
 -- Manual. The IP address prefix was manually specified. 
                         
 -- WellKnown. The IP address prefix is from a well-known source. 
                         
 -- DHCP. The IP address prefix was provided by DHCP settings. 
                         
 -- RouterAdvertisement. The IP address prefix was obtained through a router advertisement (RA).
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
Indicates whether an address is a primary IP address. This parameter identifies the primary IP address for outgoing traffic in a multiple IP address scenario. If this parameter is set to True, the addresses are not used for outgoing traffic and are not registered in DNS.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Boolean[]]`|false   |named   |false        |

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
Specifies an array of values for valid lifetimes, as TimeSpan objects, for an IP address. To obtain a TimeSpan object, use the New-TimeSpan cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[TimeSpan[]]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetIPAddress

---

### Syntax
```PowerShell
Get-NetIPAddress [[-IPAddress] <String[]>] [-AddressFamily <AddressFamily[]>] [-AddressState <AddressState[]>] [-AssociatedIPInterface <CimInstance>] [-CimSession <CimSession[]>] [-IncludeAllCompartments] [-InterfaceAlias <String[]>] [-InterfaceIndex <UInt32[]>] [-PolicyStore <String>] [-PreferredLifetime <TimeSpan[]>] [-PrefixLength <Byte[]>] [-PrefixOrigin <PrefixOrigin[]>] [-SkipAsSource <Boolean[]>] [-SuffixOrigin <SuffixOrigin[]>] [-ThrottleLimit <Int32>] [-Type <Type[]>] [-ValidLifetime <TimeSpan[]>] [<CommonParameters>]
```
