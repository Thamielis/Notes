Get-NcNetActiveRoutes
---------------------

### Synopsis
Get a list of network route active-entry objects.

---

### Description

Get a list of network route active-entry objects

---

### Related Links
* [Get-NcNetInterface](Get-NcNetInterface)

---

### Examples
> Example 1

```PowerShell
Get-NcNetActiveRoutes -Vserver pstk -Node aparajir-vsim1
Get all active routes of vserver pstk on node 1

AddressType             : ipv4
Destination             : 10.238.63.255
Flags                   : UHL
Gateway                 : ff:ff:ff:ff:ff:ff
Interface               : e0d
LookupCount             : 27
Metric                  : 0
NcController            : 10.238.49.117
NodeName                : aparajir-vsim1
PathMtu                 : 1500
ReferenceCount          : 1
RouteInterfaceAddress   : 10.238.49.161
SubnetGroup             : 10.238.0.0/18
Vserver                 : pstk
LookupCountSpecified    : True
MetricSpecified         : True
PathMtuSpecified        : True
ReferenceCountSpecified : True

AddressType             : ipv4
Destination             : 10.238.47.229
Flags                   : UHL
Gateway                 : 0:c:29:b6:62:cf
Interface               : e0d
LookupCount             : 9
Metric                  : 0
NcController            : 10.238.49.117
NodeName                : aparajir-vsim1
PathMtu                 : 1500
ReferenceCount          : 1
RouteInterfaceAddress   : 10.238.49.161
SubnetGroup             : 10.238.0.0/18
Vserver                 : pstk
LookupCountSpecified    : True
MetricSpecified         : True
PathMtuSpecified        : True
ReferenceCountSpecified : True

AddressType             : ipv4
Destination             : default
Flags                   : UGS
Gateway                 : 10.238.0.1
Interface               : e0d
LookupCount             : 294717
Metric                  : 20
NcController            : 10.238.49.117
NodeName                : aparajir-vsim1
PathMtu                 : 1500
ReferenceCount          : 2
RouteInterfaceAddress   : 10.238.49.161
SubnetGroup             : 10.238.0.0/18
Vserver                 : pstk
LookupCountSpecified    : True
MetricSpecified         : True
PathMtuSpecified        : True
ReferenceCountSpecified : True

AddressType             : ipv4
Destination             : 10.238/18
Flags                   : UC
Gateway                 : link#4
Interface               : e0d
LookupCount             : 0
Metric                  : 0
NcController            : 10.238.49.117
NodeName                : aparajir-vsim1
PathMtu                 : 1500
ReferenceCount          : 1
RouteInterfaceAddress   : 10.238.49.161
SubnetGroup             : 10.238.0.0/18
Vserver                 : pstk
LookupCountSpecified    : True
MetricSpecified         : True
PathMtuSpecified        : True
ReferenceCountSpecified : True

AddressType             : ipv4
Destination             : 10.238.47.228
Flags                   : UHL
Gateway                 : 0:c:29:b6:62:cf
Interface               : e0d
LookupCount             : 25
Metric                  : 0
NcController            : 10.238.49.117
NodeName                : aparajir-vsim1
PathMtu                 : 1500
ReferenceCount          : 1
RouteInterfaceAddress   : 10.238.49.161
SubnetGroup             : 10.238.0.0/18
Vserver                 : pstk
LookupCountSpecified    : True
MetricSpecified         : True
PathMtuSpecified        : True
ReferenceCountSpecified : True

AddressType             : ipv4
Destination             : 10.238.0.2
Flags                   : UHL
Gateway                 : 0:26:98:9:be:41
Interface               : e0d
LookupCount             : 0
Metric                  : 0
NcController            : 10.238.49.117
NodeName                : aparajir-vsim1
PathMtu                 : 1500
ReferenceCount          : 1
RouteInterfaceAddress   : 10.238.49.161
SubnetGroup             : 10.238.0.0/18
Vserver                 : pstk
LookupCountSpecified    : True
MetricSpecified         : True
PathMtuSpecified        : True
ReferenceCountSpecified : True

AddressType             : ipv4
Destination             : 10.238.0.1
Flags                   : UHL
Gateway                 : 0:0:c:9f:f0:20
Interface               : e0d
LookupCount             : 0
Metric                  : 0
NcController            : 10.238.49.117
NodeName                : aparajir-vsim1
PathMtu                 : 1500
ReferenceCount          : 2
RouteInterfaceAddress   : 10.238.49.161
SubnetGroup             : 10.238.0.0/18
Vserver                 : pstk
LookupCountSpecified    : True
MetricSpecified         : True
PathMtuSpecified        : True
ReferenceCountSpecified : True

AddressType             : ipv4
Destination             : 10.238.31.136
Flags                   : UHL
Gateway                 : 0:c:29:6d:58:4b
Interface               : e0d
LookupCount             : 146
Metric                  : 0
NcController            : 10.238.49.117
NodeName                : aparajir-vsim1
PathMtu                 : 1500
ReferenceCount          : 1
RouteInterfaceAddress   : 10.238.49.161
SubnetGroup             : 10.238.0.0/18
Vserver                 : pstk
LookupCountSpecified    : True
MetricSpecified         : True
PathMtuSpecified        : True
ReferenceCountSpecified : True

AddressType             : ipv4
Destination             : 10.238.0.3
Flags                   : UHL
Gateway                 : 0:22:55:79:52:c1
Interface               : e0d
LookupCount             : 0
Metric                  : 0
NcController            : 10.238.49.117
NodeName                : aparajir-vsim1
PathMtu                 : 1500
ReferenceCount          : 1
RouteInterfaceAddress   : 10.238.49.161
SubnetGroup             : 10.238.0.0/18
Vserver                 : pstk
LookupCountSpecified    : True
MetricSpecified         : True
PathMtuSpecified        : True
ReferenceCountSpecified : True

```

---

### Parameters
#### **Vserver**
One or more vservers from which to get the active routes.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Node**
One or more nodes from which to get the active routes.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |2       |true (ByPropertyName)|NodeName|

#### **SubnetGroup**
One or more subnet groups.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Interface**
One or more interface for which active routes are to be returned.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Destination**
One or more destinations for which active routes are to be returned.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **IPv4Only**
Specify to restrict results to IPv4 routes only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **IPv6Only**
Specify to restrict results to IPv6 routes only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **RouteInterfaceAddress**
Specify the Route Interface Address.
This parameter is available in ONTAP 9.2 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[NetActiveRoutesInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **Template**
Can be used in Powershell 2 to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[NetActiveRoutesInfo]`|true    |named   |false        |

#### **Gateway**
Specify the gateway.  Example: 10.7.125.1, fd20:13::1

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetActiveRoutesInfo

---

### Notes
Category: net
API: net-active-routes-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNetActiveRoutes [[-Vserver] <String[]>] [[-Node] <String[]>] [-SubnetGroup <String[]>] [-Interface <String[]>] [-Destination <String[]>] [-IPv4Only] [-IPv6Only] [-RouteInterfaceAddress 
```
```PowerShell
<String[]>] [-Attributes <NetActiveRoutesInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetActiveRoutes -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetActiveRoutes -Query <NetActiveRoutesInfo> [-Attributes <NetActiveRoutesInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [-Gateway <String>] [<CommonParameters>]
```
