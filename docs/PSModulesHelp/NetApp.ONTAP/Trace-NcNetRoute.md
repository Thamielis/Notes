Trace-NcNetRoute
----------------

### Synopsis
Trace the route IPv6 packets take to a host.

---

### Description

Trace the route IPv6 packets take to a host. The trace may start at a particular node, or a specified lif.

---

### Related Links
* [Get-NcNameServiceIPFromHostname](Get-NcNameServiceIPFromHostname)

* [Ping-NcHost](Ping-NcHost)

---

### Examples
> Example 1

Trace-NcNetRoute "fd20:8b1e:b255:8010::32" aparajir-vvsim-01 -HopLimit 5
Find the first 5 hops to reach fd20:8b1e:b255:8010::32

traceroute6 to fd20:8b1e:b255:8010::32 (fd20:8b1e:b255:8010::32) from fd20:8b1e:b255:4071:20a3:fa40:b305:dcd4, 5 hops max, 12 byte packets
 1  fd20:8b1e:b255:4071::10  0.887 ms  0.809 ms  0.611 ms
 2  fd20:8b1e:b255:404e::61  0.466 ms
    fd20:8b1e:b255:404e::65  0.476 ms
    fd20:8b1e:b255:404e::61  0.385 ms
 3  fd20:8b1e:b255:ffff::16:1  236.941 ms
    fd20:8b1e:b255:ffff::17:1  245.703 ms  254.119 ms
 4  fd20:8b1e:b255:8001::33:1  248.347 ms  258.238 ms  260.183 ms
 5  fd20:8b1e:b255:8001::38:2  247.513 ms
    fd20:8b1e:b255:8001::2f:2  238.517 ms  240.905 ms

---

### Parameters
#### **Host**
The address of the destination.

|Type      |Required|Position|PipelineInput        |Aliases                       |
|----------|--------|--------|---------------------|------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Address<br/>DestinationAddress|

#### **Node**
The node from which traceroute is to be started.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **FirstHop**
Specifies the number of hops to skip in trace.

|Type     |Required|Position|PipelineInput        |Aliases   |
|---------|--------|--------|---------------------|----------|
|`[Int16]`|false   |named   |true (ByPropertyName)|HopsToSkip|

#### **HopLimit**
Specifies the maximum hoplimit.

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int16]`|false   |named   |true (ByPropertyName)|MaxHops|

#### **Port**
Specifies the base UDP port number used in probes.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Nqueries**
Specifies the number of probes per hop.

|Type     |Required|Position|PipelineInput        |Aliases                |
|---------|--------|--------|---------------------|-----------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|ProbesPerHop<br/>Nquery|

#### **WaitTime**
Specifies the delay time between probes in seconds.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **PacketSize**
Specifies the size of probe packets in bytes."

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **DebugMode**
Specify to enable debug-mode for socket level debugging.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseICMP6**
Specify to use ICMP6 ECHO instead of UDP datagrams for probes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PrintNumericAddressOnly**
Specify to print hop addresses only numerically rather than symbolically and numerically.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Numeric|

#### **PrintVerbose**
Specify to display all received ICMP packets.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Switch]`|false   |named   |false        |DisplayVerbose|

#### **Gateway**
Specifies the intermediate gateway.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

#### **Interface**
Specifies the LIF from where traceroute is to be started.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **InterfaceOwner**
Specifies the name of logical interface (LIF) owner. It may be a node or Vserver name. By default it is assumed to be the clusteradmin vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
Category: net
API: net-traceroute6
Family: cluster, vserver

---

### Syntax
```PowerShell
Trace-NcNetRoute [-Host] <String> [-Node] <String> [-FirstHop <Int16>] [-HopLimit <Int16>] [-Port <Int64>] [-Nqueries <Int64>] [-WaitTime <Int32>] [-PacketSize <Int64>] [-Controller 
```
```PowerShell
<NcController[]>] [-DebugMode] [-UseICMP6] [-PrintNumericAddressOnly] [-PrintVerbose] [-Gateway <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Trace-NcNetRoute [-Host] <String> -Interface <String> [-InterfaceOwner <String>] [-FirstHop <Int16>] [-HopLimit <Int16>] [-Port <Int64>] [-Nqueries <Int64>] [-WaitTime <Int32>] [-PacketSize 
```
```PowerShell
<Int64>] [-Controller <NcController[]>] [-DebugMode] [-UseICMP6] [-PrintNumericAddressOnly] [-PrintVerbose] [-Gateway <String>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
