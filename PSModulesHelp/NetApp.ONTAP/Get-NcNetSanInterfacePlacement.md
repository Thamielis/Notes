Get-NcNetSanInterfacePlacement
------------------------------

### Synopsis
Get the SAN LIF placement.

---

### Description

Get the SAN LIF placement.

---

### Examples
> Example 1

```PowerShell
Get-NcNetSanInterfacePlacement
```

---

### Parameters
#### **AdapterType**
Adapter type.  
Possible values:  
"fc"  - Used for FC Adapters
"cna" - Used for CNA Adapters
"nic" - Used for NIC Adapters

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Protocol**
Data protocol.
Possible values: 
"nfs"      - Used for NFS connections
"cifs"     - Used for CIFS connections
"iscsi"    - Used for iSCSI connections
"fcp"      - Used for Fibre Channel connections
"fcache"   - Used for FlexCache connections
"none"     - Used for management. Does not serve any file protocols.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Node**
One or more nodes.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |3       |true (ByPropertyName)|NodeList|

#### **LifsPerNode**
LIFs per node.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |4       |true (ByPropertyName)|

#### **Subnet**
If provided, only the candidate ports in the broadcast domain that the subnet belongs to will be returned; otherwise, all candidate ports will be returned.  For iSCSI protocol only.
        
It is interchangeable with BroadcastDomain. If both are provide but the given subnet is not in the given broadcast domain, then an error will be returned.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |named   |true (ByPropertyName)|SubnetName|

#### **BroadcastDomain**
If provided, only the candidate ports in the given broadcast domain will be returned; otherwise, all candidate ports will be returned.  For iSCSI protocol only.
It is interchangeable with SubnetName.  If both are provided but the given subnet is not in the given broadcast domain, then an error will be returned.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Ipspace**
The IPspace that the given subnet or broadcast domain belongs to. It is required when either SubnetName or BroadcastDomain is provided.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Net.LifPlacementInfo

---

### Notes
Category: net
API: net-san-lif-placement-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetSanInterfacePlacement [-AdapterType] <String> [-Protocol] <String> [[-Node] <String[]>] [-LifsPerNode] <Int32> [-Subnet <String>] [-BroadcastDomain <String>] [-Ipspace <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
