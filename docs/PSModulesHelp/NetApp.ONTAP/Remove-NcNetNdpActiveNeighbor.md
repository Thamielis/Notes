Remove-NcNetNdpActiveNeighbor
-----------------------------

### Synopsis
Delete an existing network ndp active neighbor object.

---

### Description

Delete an existing network ndp active neighbor object.

---

### Related Links
* [Get-NcNetNdpActiveNeighbor](Get-NcNetNdpActiveNeighbor)

---

### Examples
> Example 1

```PowerShell
Remove-NcNetNdpActiveNeighbor -Neighbor fe80:4::5:73ff:fea0:107 -SubnetGroup ::/0 -Node beam-fs-ps-01 -Port e0d -Vserver beam-fs-ps
Remove the given NDP active neighbor.
```

---

### Parameters
#### **Neighbor**
The neighbor IPv6 address.  Example: fd20:13::1

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **SubnetGroup**
The subnet group the neighbor belongs to.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Node**
The name of the node.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Port**
The physical port.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **Vserver**
The name of the Vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |5       |true (ByPropertyName)|

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
API: net-ndp-active-neighbor-destroy
Family: cluster

---

### Syntax
```PowerShell
Remove-NcNetNdpActiveNeighbor [-Neighbor] <String> [-SubnetGroup] <String> [-Node] <String> [-Port] <String> [-Vserver] <String> [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
