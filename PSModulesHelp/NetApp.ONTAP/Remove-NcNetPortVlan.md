Remove-NcNetPortVlan
--------------------

### Synopsis
Delete a VLAN interface.

---

### Description

Delete a VLAN interface.  The changes are persistent across reboots.

---

### Related Links
* [Get-NcNetPortVlan](Get-NcNetPortVlan)

* [New-NcNetPortVlan](New-NcNetPortVlan)

---

### Examples
> Example 1

```PowerShell
Remove-NcNetPortVlan i0b-4 fas3070cluster01-02
Destroy VLAN 'iob-4' on node 'fas3070cluster01-02'.
```
> Example 2

```PowerShell
Remove-NcNetPortVlan e0c fas3070cluster01-02 -VlanId 1,2,3 -Confirm:$false
Remove VLAN tags 1,2,3 from port 'e0c' on node 'fas3070cluster01-02'.
```
> Example 3

```PowerShell
Get-NcNetPortVlan -ParentInterface i0b | Remove-NcNetPortVlan -Confirm:$false
Remove all VLAN tags from ifgrp 'i0b'.
```

---

### Parameters
#### **Node**
The node that owns the port or ifgrp.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **VlanName**
Name of VLAN interface.  The name must be of the format <parent-inteface>-<vlanid>.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |1       |true (ByPropertyName)|InterfaceName|

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
The VLAN IDs to remove.  Range: [1..4094]

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[UInt16[]]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: net
API: net-vlan-delete
Family: cluster

---

### Syntax
```PowerShell
Remove-NcNetPortVlan [-Node] <String> [-VlanName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcNetPortVlan [-ParentInterface] <String> [-Node] <String> -VlanId <UInt16[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
