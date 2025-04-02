Remove-NcNetPlacementCache
--------------------------

### Synopsis
Delete LIF placement cached information.

---

### Description

Delete LIF placement cached information.

---

### Related Links
* [Get-NcNetPlacementCache](Get-NcNetPlacementCache)

* [Update-NcNetPlacementCache](Update-NcNetPlacementCache)

---

### Examples
> Example 1

```PowerShell
Remove-NcNetPlacementCache -Node sfp-cmode-02-01 -Port e0c -Address 10.63.165.62 -NetmaskLength 24 -Vserver sfp-cmode-02
Remove the net placement cache entry.
```
> Example 2

```PowerShell
Get-NcNetPlacementCache | Remove-NcNetPlacementCache
Clear the net placement cache.
```

---

### Parameters
#### **Node**
Name of the node.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
Vserver name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Port**
The port name on the node.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Address**
The IP address that was searched.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **NetmaskLength**
The number of bits in the subnet mask.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |5       |true (ByPropertyName)|

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
API: net-placement-cache-delete
Family: cluster

---

### Syntax
```PowerShell
Remove-NcNetPlacementCache [-Node] <String> [-Vserver] <String> [-Port] <String> [-Address] <String> [-NetmaskLength] <Int32> [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
