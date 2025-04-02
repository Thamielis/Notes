Remove-NcNetRoutingGroupRoute
-----------------------------

### Synopsis
Destroy an existing network routing group route.

---

### Description

Destroy an existing network routing group route.

---

### Related Links
* [Get-NcNetRoutingGroupRoute](Get-NcNetRoutingGroupRoute)

* [New-NcNetRoutingGroupRoute](New-NcNetRoutingGroupRoute)

---

### Examples
> Example 1

```PowerShell
Remove-NcNetRoutingGroupRoute d10.61.172.0/24 vserver1 0.0.0.0/0
Destroy routing group route 'd10.61.172.0/24' to destination 0.0.0.0/0 defined for vserver 'vserver1'.
```

---

### Parameters
#### **RoutingGroup**
The name of the routing group that owns the route to destroy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
The vserver that owns the route.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Destination**
The IP address and subnet mask of the destination.  For example: '198.18.10.0/24'

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|true    |3       |true (ByPropertyName)|DestinationAddress|

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
* 

---

### Notes
Category: net
API: net-routing-group-route-destroy
Family: cluster

---

### Syntax
```PowerShell
Remove-NcNetRoutingGroupRoute [-RoutingGroup] <String> [-Vserver] <String> [-Destination] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
