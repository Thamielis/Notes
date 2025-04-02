New-NcNetRoutingGroupRoute
--------------------------

### Synopsis
Create a new network routing group route.

---

### Description

Create a new network routing group route.

---

### Related Links
* [Get-NcNetRoutingGroupRoute](Get-NcNetRoutingGroupRoute)

* [Remove-NcNetRoutingGroupRoute](Remove-NcNetRoutingGroupRoute)

---

### Examples
> Example 1

New-NcNetRoutingGroupRoute -RoutingGroup d10.61.172.0/24 -Vserver vserver1 -Destination 0.0.0.0/0 -Gateway 10.61.172.1 -Metric 10
Create a new routing group route 'd10.61.172.0/24' for vserver 'vserver1'.

RoutingGroup     DestinationAddress  GatewayAddress  Metric  Vserver
------------     ------------------  --------------  ------  -------
d10.61.172.0/24  0.0.0.0/0           10.61.172.1       10    vserver1

---

### Parameters
#### **RoutingGroup**
Specifies the name of routing group.  For example:
d192.168.1.0/24 ('d' stands for data LIF and 192.168.1.0/24 is subnet)
c192.168.1.0/24 ('c' stands for cluster LIF and 192.168.1.0/24 is subnet)
n192.168.1.0/24 ('n' stands for node management LIF and 192.168.1.0/24 is subnet)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
The vserver that will own the new route.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Destination**
Specifies the IP address and subnet mask of destination.  For example: '198.18.10.0/24'

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|true    |3       |true (ByPropertyName)|DestinationAddress|

#### **Gateway**
Specifies the IP address of gateway.  For example: '198.18.0.0'

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|true    |4       |true (ByPropertyName)|GatewayAddress|

#### **Metric**
Specifies the metric (hop count) of the LIF.  The default value is determined by the LIF role as follows:
If the LIF role is 'node_mgmt' or 'cluster_mgmt': 10
If the LIF role is 'data' or 'undef': 20
If the LIF role is 'cluster': 30
If the LIF role is 'intercluster': 40

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |5       |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.RoutingGroupRouteInfo

---

### Notes
Category: net
API: net-routing-group-route-create
Family: cluster

---

### Syntax
```PowerShell
New-NcNetRoutingGroupRoute [-RoutingGroup] <String> [-Vserver] <String> [-Destination] <String> [-Gateway] <String> [[-Metric] <Int32>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
