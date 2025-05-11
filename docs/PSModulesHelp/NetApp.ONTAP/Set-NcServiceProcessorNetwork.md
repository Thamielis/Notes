Set-NcServiceProcessorNetwork
-----------------------------

### Synopsis
Modify the service processor network configuration.

---

### Description

Modify the service processor network configuration.

---

### Related Links
* [Get-NcServiceProcessorNetwork](Get-NcServiceProcessorNetwork)

---

### Examples
> Example 1

```PowerShell
Set-NcServiceProcessorNetwork -Node sfp-cmode-02-01 -AddressType ipv4 -Enable -Address 10.63.165.55  -Netmask 255.255.255.0 -GatewayAddress 10.63.165.1
Configure the ipv4 network for service processor on node sfp-cmode-02-01.

AddressType           : ipv4
DeviceType            : sp
Dhcp                  : none
GatewayIpAddress      : 10.63.165.1
IpAddress             : 10.63.165.55
IsEnabled             : True
LinkLocalIpAddress    :
LinkStatus            : up
MacAddress            : 00:a0:98:1d:3c:a4
NcController          : 10.63.165.62
Netmask               : 255.255.255.0
Node                  : sfp-cmode-02-01
PrefixLength          :
RouterIpAddress       :
Status                : online
IsEnabledSpecified    : True
PrefixLengthSpecified : False

```
> Example 2

```PowerShell
Set-NcServiceProcessorNetwork -Nodes f3250-215-73-75-01,f3250-215-73-75-02 -AddressType ipv4 -Enable -Dhcp v4
Change configuration for more than one node.

ErrorCode           : 
ErrorMessage        : 
NcController        : 10.225.215.73
ServiceProcessorKey : DataONTAP.C.Types.ServiceProcessor.ServiceProcessorNetworkInfo
ErrorCodeSpecified  : False

ErrorCode           : 
ErrorMessage        : 
NcController        : 10.225.215.73
ServiceProcessorKey : DataONTAP.C.Types.ServiceProcessor.ServiceProcessorNetworkInfo
ErrorCodeSpecified  : False

```

---

### Parameters
#### **Node**
Node on which the device is located.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **AddressType**
Network configuration that is being addressed.  Possible values:  ipv4, ipv6

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Enable**
If specified, enable the address configuration.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Disable**
If specified, disable the address configuration.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Dhcp**
DHCP status for the configuration.  Possible values:  v4, none

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Address**
IP address currently held by the device.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|false   |named   |true (ByPropertyName)|IpAddress|

#### **Netmask**
Netmask for the device.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PrefixLength**
Prefix length of subnet mask.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **GatewayAddress**
IP address of the network gateway.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|false   |named   |true (ByPropertyName)|GatewayIpAddress|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Attributes**
Specify to restrict fields returned by Data ONTAP

|Type                           |Required|Position|PipelineInput        |
|-------------------------------|--------|--------|---------------------|
|`[ServiceProcessorNetworkInfo]`|false   |named   |true (ByPropertyName)|

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

#### **Nodes**
"Nodes for which the same configuration is to be set on the SP device.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|

#### **ContinueOnFailure**
Specify to continue modifications on other nodes in case operations fail on one (or more) nodes

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
If operation is allowed to continue on failure on one (or more) nodes, this can be specified to stop the operation after n number of failrues

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Query**
Specify to query using a object with restricting fields set.

|Type                           |Required|Position|PipelineInput        |
|-------------------------------|--------|--------|---------------------|
|`[ServiceProcessorNetworkInfo]`|true    |1       |true (ByPropertyName)|

#### **Template**
Can be used to obtain an empty object for constructing the query

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ServiceProcessor.ServiceProcessorNetworkInfo

---

### Notes
Category: service processor
API: service-processor-network-modify, service-processor-network-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Set-NcServiceProcessorNetwork [-Node] <String> [-AddressType] <String> [-Enable] [-Disable] [-Dhcp <String>] [-Address <String>] [-Netmask <String>] [-PrefixLength <Int32>] [-GatewayAddress 
```
```PowerShell
<String>] [-Controller <NcController[]>] [-Attributes <ServiceProcessorNetworkInfo>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcServiceProcessorNetwork [-Nodes] <String[]> [-AddressType] <String> [-Enable] [-Disable] [-Dhcp <String>] [-Address <String>] [-Netmask <String>] [-PrefixLength <Int32>] 
```
```PowerShell
[-GatewayAddress <String>] [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Attributes <ServiceProcessorNetworkInfo>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcServiceProcessorNetwork [-Query] <ServiceProcessorNetworkInfo> [-AddressType] <String> [-Enable] [-Disable] [-Dhcp <String>] [-Address <String>] [-Netmask <String>] [-PrefixLength 
```
```PowerShell
<Int32>] [-GatewayAddress <String>] [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Attributes <ServiceProcessorNetworkInfo>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcServiceProcessorNetwork [-Template] [-Enable] [-Disable] [-Dhcp <String>] [-Address <String>] [-Netmask <String>] [-PrefixLength <Int32>] [-GatewayAddress <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-Attributes <ServiceProcessorNetworkInfo>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
