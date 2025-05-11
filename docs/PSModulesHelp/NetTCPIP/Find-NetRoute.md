Find-NetRoute
-------------

### Synopsis
Finds the best local IP address and the best route to reach a remote address.

---

### Description

The Find-NetRoute cmdlet finds the best local IP address and the best route to reach a remote address. Specify the remote address to reach. You can also specify an interface and a local address to use to reach the remote address.

For more information about routing, see Chapter 5 - IP Routing (http://technet.microsoft.com/library/bb727001.aspx) in the TechNet library.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkID=313144)

* [Get-NetRoute](Get-NetRoute)

* [New-NetRoute](New-NetRoute)

* [Remove-NetRoute](Remove-NetRoute)

* [Set-NetRoute](Set-NetRoute)

---

### Examples
> Example 1: Find a local address and route

PS C:\>Find-NetRoute -RemoteIPAddress "10.79.197.200"
IPAddress         : 172.31.234.140
InterfaceIndex    : 3
InterfaceAlias    : Ethernet
AddressFamily     : IPv4
Type              : Unicast
PrefixLength      : 21
PrefixOrigin      : Dhcp
SuffixOrigin      : Dhcp
AddressState      : Preferred
ValidLifetime     : 6.00:10:40
PreferredLifetime : 6.00:10:40
SkipAsSource      : False
PolicyStore       : ActiveStore

Caption            : 
Description        : 
ElementName        : 
InstanceID         : :8:8:8:9:55=55;A<8=;8<=<8;55; 
AdminDistance      : 
DestinationAddress :
IsStatic           : 
RouteMetric        : 0
TypeOfRoute        : 3
AddressFamily      : IPv4
DestinationPrefix  : 0.0.0.0/0
InterfaceAlias     : Ethernet
InterfaceIndex     : 3
NextHop            : 172.31.232.1
PreferredLifetime  : 8.00:00:00
Protocol           : NetMgmt
Publish            : No
Store              : ActiveStore
ValidLifetime      : 8.00:00:00
PSComputerName     : 
ifIndex            : 3
This command finds a NetIPAddress object and NetRoute object to use to access the IP address 10.79.197.200. The command returns two objects. The first object is the local IP address. The second object is the local route that includes the selected connectivity path and next hop.

---

### Parameters
#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **InterfaceIndex**
Specifies an index of a network interface. The cmdlet finds a route for this interface.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **LocalIPAddress**
Specifies a local IP address from which to find a route. You can specify a host address or a subnet address. You can also use a wildcard address, such as 0.0.0.0/0 for all IPv4 addresses, ::/0 for all IPv6 addresses, or ANY for all addresses.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RemoteIPAddress**
Specifies a remote IP address to which to find a route. You can specify a host address or a subnet address. You can also use a wildcard address, such as 0.0.0.0/0 for all IPv4 addresses, ::/0 for all IPv6 addresses, or ANY for all addresses

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

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
* NetIPAddress, NetRoute

---

### Syntax
```PowerShell
Find-NetRoute [-CimSession <CimSession[]>] [-InterfaceIndex <UInt32>] [-LocalIPAddress <String>] [-ThrottleLimit <Int32>] -RemoteIPAddress <String> [<CommonParameters>]
```
