Get-NcNetRoutingGroupRoute
--------------------------

### Synopsis
Get network routing group routes.

---

### Description

Get network routing group routes.

---

### Related Links
* [New-NcNetRoutingGroupRoute](New-NcNetRoutingGroupRoute)

* [Remove-NcNetRoutingGroupRoute](Remove-NcNetRoutingGroupRoute)

---

### Examples
> Example 1

Get-NcNetRoutingGroupRoute
Get all routing group routes.

RoutingGroup   DestinationAddress GatewayAddress Metric Vserver
------------   ------------------ -------------- ------ -------
d10.58.92.0/22 0.0.0.0/0          10.58.92.1       20   Barker01
d10.58.92.0/22 0.0.0.0/0          10.58.92.1       20   Barker03
c10.58.92.0/22 0.0.0.0/0          10.58.92.1       20   Cerebus
n10.58.92.0/22 0.0.0.0/0          10.58.92.1       10   Cerebus-03
n10.58.92.0/22 0.0.0.0/0          10.58.92.1       10   Cerebus-04
n10.58.92.0/22 0.0.0.0/0          10.58.92.1       10   Cerebus-05
n10.58.92.0/22 0.0.0.0/0          10.58.92.1       10   Cerebus-06
d10.58.92.0/22 0.0.0.0/0          10.58.92.1       20   Kumar01
d10.58.93.0/22 0.0.0.0/0          10.58.92.1       20   Kumar01
d10.58.92.0/22 0.0.0.0/0          10.58.92.1       20   Lionetti01

> Example 2

$q = Get-NcNetRoutingGroupRoute -Template
$q.Metric = ">10"
Get-NcNetRoutingGroupRoute -Query $q
Get all routing group routes with metric values greater than 10.

RoutingGroup   DestinationAddress GatewayAddress Metric Vserver
------------   ------------------ -------------- ------ -------
d10.58.92.0/22 0.0.0.0/0          10.58.92.1       20   Barker01
d10.58.92.0/22 0.0.0.0/0          10.58.92.1       20   Barker03
c10.58.92.0/22 0.0.0.0/0          10.58.92.1       20   Cerebus
d10.58.92.0/22 0.0.0.0/0          10.58.92.1       20   Kumar01
d10.58.93.0/22 0.0.0.0/0          10.58.92.1       20   Kumar01
d10.58.92.0/22 0.0.0.0/0          10.58.92.1       20   Lionetti01

---

### Parameters
#### **RoutingGroup**
Restrict results to the specified routing group(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Destination**
Restrict results to the specified destination address(es).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases           |
|------------|--------|--------|---------------------|------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|DestinationAddress|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Gateway**
Restrict results to the specified gateway address(es).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases       |
|------------|--------|--------|---------------------|--------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|GatewayAddress|

#### **Metric**
Restrict results to the specified port metric(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a RoutingGroupRouteInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetRoutingGroupRoute -Template" to get the initially empty RoutingGroupRouteInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[RoutingGroupRouteInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty RoutingGroupRouteInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a RoutingGroupRouteInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetRoutingGroupRoute -Template" to get the initially empty RoutingGroupRouteInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[RoutingGroupRouteInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.RoutingGroupRouteInfo

---

### Notes
Category: net
API: net-routing-group-route-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetRoutingGroupRoute [[-RoutingGroup] <String[]>] [-Destination <String[]>] [-Vserver <String[]>] [-Gateway <String[]>] [-Metric <String[]>] [-Attributes <RoutingGroupRouteInfo>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetRoutingGroupRoute -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetRoutingGroupRoute -Query <RoutingGroupRouteInfo> [-Attributes <RoutingGroupRouteInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
