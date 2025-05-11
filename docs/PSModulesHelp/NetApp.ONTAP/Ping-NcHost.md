Ping-NcHost
-----------

### Synopsis
Ping an IP address to verify whether the interface is alive.

---

### Description

Ping an IP address to verify whether the interface is alive.

---

### Related Links
* [Get-NcNetInterface](Get-NcNetInterface)

* [Get-NcNode](Get-NcNode)

---

### Examples
> Example 1

```PowerShell
Ping-NcHost -Host 10.61.167.22 -Node Cerebus-03 -Raw
Ping a host by IP address and write the raw boolean to the pipeline.

True

```
> Example 2

Get-NcNode | Ping-NcHost 10.61.167.22 -Count 1
Ensure each node can ping a host.

Host                      Success Node
----                      ------- ----
10.61.167.22               True   Cerebus-03
10.61.167.22               True   Cerebus-04
10.61.167.22               True   Cerebus-05
10.61.167.22               True   Cerebus-06

> Example 3

```PowerShell
Ping-NcHost -Host 10.61.167.22 -InterfaceOwner Lionetti01 -Interface Lionetti01_mgmt
Ping a host from a specific interface defined on a vserver.

NcController   : cerebus
Host           : 10.61.167.22
Success        : True
Node           :
InterfaceOwner : Lionetti01
Interface      : Lionetti01_mgmt

```

---

### Parameters
#### **Host**
The address of the destination.

|Type      |Required|Position|PipelineInput        |Aliases                       |
|----------|--------|--------|---------------------|------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Address<br/>DestinationAddress|

#### **Node**
Specifies the node from which the ping request is to be sent.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Count**
The number of pings to try before giving up.  Default is 20.

|Type     |Required|Position|PipelineInput        |Aliases             |
|---------|--------|--------|---------------------|--------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|Retry<br/>RetryCount|

#### **WaitSeconds**
The number of seconds to wait between pings.  Default is 1.

|Type     |Required|Position|PipelineInput        |Aliases          |
|---------|--------|--------|---------------------|-----------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|Wait<br/>Interval|

#### **Raw**
Specify to get an unwrapped boolean value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WaitResponse**
Specifies the maximum number of milliseconds to wait for each ping response. Default: 10000 (10 seconds)
This parameter is applicable only when pinging an IPv4 address.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **PacketSize**
The size of the ping packet in bytes. This parameter is applicable for pinging of IPv6 addresses only.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **BufferSize**
The socket buffer size in bytes. This parameter is applicable for pinging of IPv6 addresses only.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **DisableFragmentation**
Specify to fragment packets to fit into the minimum IPv6 MTU size for both unicast and multicast addresses.. This parameter is applicable for pinging of IPv6 addresses only.

|Type      |Required|Position|PipelineInput|Aliases                |
|----------|--------|--------|-------------|-----------------------|
|`[Switch]`|false   |named   |false        |DisableFragmentationAll|

#### **DisableFragmentationUnicastOnly**
Specify to fragment packets to fit into the minimum IPv6 MTU size for unicast addresses only. This parameter is applicable for pinging of IPv6 addresses only.

|Type      |Required|Position|PipelineInput|Aliases                    |
|----------|--------|--------|-------------|---------------------------|
|`[Switch]`|false   |named   |false        |DisableFragmentationUnicast|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **InterfaceOwner**
Specifies the name of an interface owner.  It may be a node or Vserver name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Interface**
Specifies the interface from which the ping request is to be sent.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **UseSourcePort**
If true, send out ping via the port which is hosting the lif.  Only applicable when interface parameter when specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.PingHostResult

---

### Notes
Category: net
API: net-cluster-ping, net-cluster-ping6
Family: cluster, vserver

---

### Syntax
```PowerShell
Ping-NcHost [-Host] <String> [-Node] <String> [-Count <Int32>] [-WaitSeconds <Int32>] [-Raw] [-WaitResponse <Int32>] [-PacketSize <Int32>] [-BufferSize <Int32>] [-DisableFragmentation] 
```
```PowerShell
[-DisableFragmentationUnicastOnly] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Ping-NcHost [-Host] <String> -InterfaceOwner <String> -Interface <String> [-Count <Int32>] [-WaitSeconds <Int32>] [-Raw] [-UseSourcePort] [-WaitResponse <Int32>] [-PacketSize <Int32>] 
```
```PowerShell
[-BufferSize <Int32>] [-DisableFragmentation] [-DisableFragmentationUnicastOnly] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
