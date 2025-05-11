New-NcNetPortVlan
-----------------

### Synopsis
Create a new VLAN interface.

---

### Description

Create a new VLAN interface.  The changes are persistent across reboots.

---

### Related Links
* [Get-NcNetPortVlan](Get-NcNetPortVlan)

* [Remove-NcNetPortVlan](Remove-NcNetPortVlan)

---

### Examples
> Example 1

New-NcNetPortVlan i0b  -Node fas3070cluster01-02 -VlanId 1,2,3
Add VLAN tags 1,2,3 to ifgrp "i0b".

InterfaceName  ParentInterface VlanID Node
 -------------  --------------- ------ ----
     i0b-1            i0b         1    fas3070cluster01-02
     i0b-2            i0b         2    fas3070cluster01-02
     i0b-3            i0b         3    fas3070cluster01-02

> Example 2

New-NcNetPortVlan i0b-4 fas3070cluster01-02
Create VLAN 'iob-4' to node 'fas3070cluster01-02'.

InterfaceName  ParentInterface VlanID Node
 -------------  --------------- ------ ----
     i0b-4            i0b         4    fas3070cluster01-02

---

### Parameters
#### **Node**
The node that owns the port or ifgrp.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **VlanName**
Name of vlan interface.  The name must be of the format <parent-inteface>-<vlanid>. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |1       |true (ByPropertyName)|InterfaceName|

#### **BroadcastDomain**
Broadcast domain name and Ipspace name provided on input. To instantiate the object please create object using New-Object DataONTAP.C.Types.Net.BroadcastDomain. This parameter is supported with Rest only.

|Type                                     |Required|Position|PipelineInput        |
|-----------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Net.BroadcastDomain]`|false   |named   |true (ByPropertyName)|

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

#### **ParentInterface**
The name of the port or ifgrp to modify.

|Type      |Required|Position|PipelineInput        |Aliases                                  |
|----------|--------|--------|---------------------|-----------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|PortName<br/>Port<br/>IfgrpName<br/>Ifgrp|

#### **VlanId**
The VLAN IDs to add.  Range: [1..4094]

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[UInt16[]]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.VlanInfo

---

### Notes
Category: net
API: net-vlan-create
Family: cluster

---

### Syntax
```PowerShell
New-NcNetPortVlan [-Node] <String> [-VlanName] <String> [-BroadcastDomain <DataONTAP.C.Types.Net.BroadcastDomain>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcNetPortVlan [-ParentInterface] <String> [-Node] <String> -VlanId <UInt16[]> [-BroadcastDomain <DataONTAP.C.Types.Net.BroadcastDomain>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
