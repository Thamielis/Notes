Test-NetConnection
------------------

### Synopsis
Displays diagnostic information for a connection.

---

### Description

The Test-NetConnection cmdlet displays diagnostic information for a connection. It supports ping test, TCP test, route tracing, and route selection diagnostics. Depending on the input parameters, the output can include the DNS lookup results, a list of IP interfaces, IPsec rules, route/source address selection results, and/or confirmation of connection establishment.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=313146)

---

### Examples
> Example 1: Test ping connectivity

```PowerShell
PS C:\> Test-NetConnection
ComputerName           : internetbeacon.msedge.net

RemoteAddress          : 2a01:111:2003::52

InterfaceAlias         : Ethernet

SourceAddress          : 2001:4898:d8:33:81e8:7b49:8bf5:8710

PingSucceeded          : True

PingReplyDetails (RTT) : 5 ms
This command tests ping connectivity to a default server.
```
> Example 2: Test ping connectivity with detailed results

```PowerShell
PS C:\> Test-NetConnection -InformationLevel "Detailed"
ComputerName           : internetbeacon.msedge.net

RemoteAddress          : 2a01:111:2003::52

NameResolutionResults  : 2a01:111:2003::52

                         13.107.4.52

InterfaceAlias         : Ethernet

SourceAddress          : 2001:4898:d8:33:81e8:7b49:8bf5:8710

NetRoute (NextHop)     : fe80::200:5eff:fe00:203

PingSucceeded          : True

PingReplyDetails (RTT) : 6 ms
This command tests ping connectivity to a default server and sets the InformationLevel parameter to Detailed.
```
> Example 3: Test TCP connectivity and display detailed results

```PowerShell
PS C:\> Test-NetConnection -Port 80 -InformationLevel "Detailed"
ComputerName            : internetbeacon.msedge.net

RemoteAddress           : 2a01:111:2003::52

RemotePort              : 80

NameResolutionResults   : 2a01:111:2003::52

                          13.107.4.52

MatchingIPsecRules      : Ipsec/Domain-TrafficFromInternet-v6 

NetworkIsolationContext : Internet

IsAdmin                 : False

InterfaceAlias          : Ethernet

SourceAddress           : 2001:4898:d8:33:81e8:7b49:8bf5:8710

NetRoute (NextHop)      : fe80::200:5eff:fe00:203

TcpTestSucceeded        : True
This command tests TCP connectivity to a default server and sets the InformationLevel parameter to Detailed.
```
> Example 4: Test a connection to a remote host

```PowerShell
PS C:\> Test-NetConnection -ComputerName "www.contoso.com" -InformationLevel "Detailed"
PingReplyDetails (RTT) : 164 ms

ComputerName           : www.contoso.com

RemoteAddress          : 65.55.39.10

NameResolutionResults  : 65.55.39.10

                         64.4.6.100

InterfaceAlias         : Ethernet

SourceAddress          : 10.137.193.122

NetRoute (NextHop)     : 10.137.192.1

PingSucceeded          : True

PingReplyDetails (RTT) : 164 ms
This command tests ping connectivity to a remote host named www.contoso.com.
```
> Example 5: Perform route diagnostics to connect to a remote host

```PowerShell
PS C:\> Test-NetConnection -ComputerName www.contoso.com -DiagnoseRouting -InformationLevel Detailed
ComputerName : www.contoso.com

RemoteAddress : 2001:428:3805:187::2768

SelectedSourceAddress : 2001:4898:e0:79:f17c:d212:8743:43c2

OutgoingInterfaceIndex : 4

SelectedNetRoute : DestinationPrefix: ::/0 NextHop: fe80::200:5eff:fe00:202

RouteSelectionEvents : IP: Route [DestinationPrefix: ::/0 NextHop: fe80::200:5eff:fe00:202 InterfaceIndex: 4 InterfaceMetric: 10 RouteMetric: 256] is preferred over 

Route [DestinationPrefix: ::/0 NextHop: fe80::200:5eff:fe00:202 InterfaceIndex: 5 InterfaceMetric: 10 RouteMetric: 256] for
Destination: 2001:428:3805:187::2768 in Compartment: 1, Reason: RouteOrder. 

SourceAddressSelectionEvents : IP: Source address 2001:4898:e0:79:f17c:d212:8743:43c2 is preferred over fe80::f17c:d212:8743:43c2 for destination 2001:428:3805:187::2768 Rule = 2.0. 

RouteDiagnosticsSucceeded : True
This command performs route diagnostics to reach a remote host named www.contoso.com.
```
> Example 6: Perform route diagnostics to connect to a remote host with routing constraints

```PowerShell
PS C:\> Test-NetConnection -ComputerName "www.contoso.com" -ConstrainInterface 5 -DiagnoseRouting -InformationLevel "Detailed"
ComputerName : www.contoso.com

RemoteAddress : 2600:1409:a:185::2768

ConstrainInterfaceIndex : 5

SelectedSourceAddress : 2001:4898:e0:79:75dd:64cf:d9ff:f86

OutgoingInterfaceIndex : 5

SelectedNetRoute : DestinationPrefix: ::/0

NextHop: fe80::200:5eff:fe00:202

RouteSelectionEvents : IP: Route [DestinationPrefix: ::/0 NextHop: fe80::200:5eff:fe00:202 InterfaceIndex: 4

RouteMetric: 256] is blocked for Destination: 2600:1409:a:185::2768 ConstrainInterfaceIndex: 5 ConstrainScopeZone: 1 in Compartment: 1, Reason: InterfaceConstraint. 

SourceAddressSelectionEvents : IP: Source address 2001:4898:e0:79:75dd:64cf:d9ff:f86 is preferred over fe80::75dd:64cf:d9ff:f86 for destination 2600:1409:a:185::2768 Rule = 2.0. 

IP: Source address 2001:4898:e0:79:75dd:64cf:d9ff:f86 is preferred over fe80::75dd:64cf:d9ff:f86 for destination 2600:1409:a:185::2768 Rule = 2.0. 

RouteDiagnosticsSucceeded : True
This command performs route diagnostics to reach a remote host named www.contoso.com with routing constraints.
```

---

### Parameters
#### **CommonTCPPort**
Specifies the common service TCP port number. The acceptable values for this parameter are:
-- SMB 
-- HTTP 
-- RDP
-- WINRM
Valid Values:

* HTTP
* RDP
* SMB
* WINRM

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **ComputerName**
Specifies the Domain Name System (DNS) name or IP address of the target computer that runs the Dynamic Host Configuration Protocol (DHCP) server service.

|Type      |Required|Position|PipelineInput                 |Aliases             |
|----------|--------|--------|------------------------------|--------------------|
|`[String]`|false   |1       |True (ByValue, ByPropertyName)|RemoteAddress<br/>cn|

#### **ConstrainInterface**
Specifies the interface constraint to use for route diagnostics.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **ConstrainSourceAddress**
Specifies the source address constraint to use for route diagnostics.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DiagnoseRouting**
Indicates that route diagnostics runs to output the route and source address selection information for the remote host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Hops**
Specifies the number of hops to traverse in a trace route command.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **InformationLevel**
Specifies the information level. The acceptable values for this parameter are:
-- Detailed
-- Quiet 
If you set this parameter to Quiet, the cmdlet returns basic information. For example, for a ping test, this cmdlet returns a Boolean value that indicates whether the attempt to ping a host or port is successful.
Valid Values:

* Quiet
* Detailed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Port**
Specifies the TCP port number on the remote computer. The cmdlet uses this port number to test connectivity to the remote computer.

|Type     |Required|Position|PipelineInput        |Aliases   |
|---------|--------|--------|---------------------|----------|
|`[Int32]`|true    |named   |True (ByPropertyName)|RemotePort|

#### **TraceRoute**
Indicates that Tracert runs to test connectivity to the remote host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* NetRouteDiagnostics

* NetConnectionResults

---

### Syntax
```PowerShell
Test-NetConnection [[-ComputerName] <String>] [-CommonTCPPort] {HTTP | RDP | SMB | WINRM} [-InformationLevel {Quiet | Detailed}] [<CommonParameters>]
```
```PowerShell
Test-NetConnection [[-ComputerName] <String>] [-Hops <Int32>] [-InformationLevel {Quiet | Detailed}] [-TraceRoute] [<CommonParameters>]
```
```PowerShell
Test-NetConnection [[-ComputerName] <String>] [-InformationLevel {Quiet | Detailed}] -Port <Int32> [<CommonParameters>]
```
```PowerShell
Test-NetConnection [-ConstrainInterface <UInt32>] [-ConstrainSourceAddress <String>] -DiagnoseRouting [<CommonParameters>]
```
