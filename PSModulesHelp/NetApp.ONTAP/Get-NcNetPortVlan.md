Get-NcNetPortVlan
-----------------

### Synopsis
Get network VLANs.

---

### Description

Get network VLANs.

---

### Related Links
* [New-NcNetPortVlan](New-NcNetPortVlan)

* [Remove-NcNetPortVlan](Remove-NcNetPortVlan)

---

### Examples
> Example 1

Get-NcNetPortVlan
List all VLANs in the cluster.

InterfaceName  ParentInterface VlanID Node
 -------------  --------------- ------ ----
     e0c-1            e0c         1    fas3070cluster01-02
     e0c-2            e0c         2    fas3070cluster01-02
     e0c-3            e0c         3    fas3070cluster01-02
     i0b-1            i0b         1    fas3070cluster01-02
     i0b-2            i0b         2    fas3070cluster01-02
     i0b-3            i0b         3    fas3070cluster01-02

> Example 2

$q = Get-NcNetPortVlan -Template
$q.Vlanid = "!2"
Get-NcNetPortVlan -Query $q
Get all VLANs with IDs other than '2'.

InterfaceName  ParentInterface VlanID Node
 -------------  --------------- ------ ----
     e0c-1            e0c         1    fas3070cluster01-01
     e0c-3            e0c         3    fas3070cluster01-01
     i0b-1            i0b         1    fas3070cluster01-02
     i0b-3            i0b         3    fas3070cluster01-02

---

### Parameters
#### **Name**
The name of one or more VLANs to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|InterfaceName|

#### **Node**
Restrict results to the specified nodes(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|NodeName|

#### **VlanId**
Restrict results to the specified VLAN ID(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[Int16][]]`|false   |named   |true (ByPropertyName)|Id     |

#### **ParentInterface**
Restrict results to the specified parent interfaces(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a VlanInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetPortVlan -Template" to get the initially empty VlanInfo object.  If not specified, all data is returned for each object.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[VlanInfo]`|false   |named   |false        |

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
Specify to get an empty VlanInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a VlanInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetPortVlan -Template" to get the initially empty VlanInfo object.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[VlanInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.VlanInfo

---

### Notes
Category: net
API: net-vlan-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetPortVlan [[-Name] <String[]>] [-Node <String[]>] [-VlanId <Int16][]>] [-ParentInterface <String[]>] [-Attributes <VlanInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetPortVlan -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetPortVlan -Query <VlanInfo> [-Attributes <VlanInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
