Get-NcServiceProcessorNetwork
-----------------------------

### Synopsis
Get the service processor network configuration.

---

### Description

Get the service processor network configuration.

---

### Related Links
* [Get-NcServiceProcessor](Get-NcServiceProcessor)

* [Get-NcServiceProcessorImage](Get-NcServiceProcessorImage)

* [Set-NcServiceProcessorNetwork](Set-NcServiceProcessorNetwork)

---

### Examples
> Example 1

```PowerShell
Get-NcServiceProcessorNetwork -Node sfp-cmode-02-01 -AddressType ipv4
Get the IPv4 network settings for service process on node sfp-cmode-02-01.

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

Get-NcServiceProcessorNetwork
Get network information from multiple nodes (Works only in ONTAP 8.3 and later)

Node                                AddressType    Dhcp   LinkStatus   Status         IpAddress       
----                                -----------    ----   ----------   ------         ---------       
f3250-215-73-75-01                  ipv4                  disabled     online                         
f3250-215-73-75-01                  ipv6           none   disabled     online                         
f3250-215-73-75-02                  ipv4                  disabled     online                         
f3250-215-73-75-02                  ipv6           none   disabled     online

---

### Parameters
#### **Node**
Node on which the device is located.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **AddressType**
Network configuration that is being addressed.  Possible values:  ipv4, ipv6

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **LinkStatus**
Current status of the underlying network link used by this address

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |named   |true (ByPropertyName)|LinkState|

#### **Attributes**
For improved scalability in large clusters, provide a ServiceProcessorNetworkInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcServiceProcessorNetwork -Template" to get the initially empty ServiceProcessorNetworkInfo object.  If not specified, all data is returned for each object.

|Type                           |Required|Position|PipelineInput        |Aliases          |
|-------------------------------|--------|--------|---------------------|-----------------|
|`[ServiceProcessorNetworkInfo]`|false   |named   |true (ByPropertyName)|DesiredAttributes|

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

#### **Query**
Specify to query using a object with restricting fields set.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[ServiceProcessorNetworkInfo]`|true    |named   |false        |

#### **Template**
Specify to get an empty ServiceProcessorNetworkInfo object for use with advanced queries involving the Query attribute.

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
API: service-processor-network-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcServiceProcessorNetwork [[-Node] <String[]>] [[-AddressType] <String[]>] [-LinkStatus <String[]>] [-Attributes <ServiceProcessorNetworkInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcServiceProcessorNetwork [-Attributes <ServiceProcessorNetworkInfo>] -Query <ServiceProcessorNetworkInfo> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcServiceProcessorNetwork [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
