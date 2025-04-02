Get-NcNetPlacementCache
-----------------------

### Synopsis
Get the LIF placement cached information.

---

### Description

Get the LIF placement cached information.  Use Update-NcNetPlacementCache to update the placement cache.

---

### Related Links
* [Update-NcNetPlacementCache](Update-NcNetPlacementCache)

* [Remove-NcNetPlacementCache](Remove-NcNetPlacementCache)

---

### Examples
> Example 1

Get-NcNetPlacementCache
Get the net placement cache.

Node                         Port      Found   Address            Vserver
----                         ----      -----   -------            -------
sfp-cmode-02-01              e0c       False   10.63.165.62       sfp-cmode-02
sfp-cmode-02-01              e0d       False   10.63.165.62       sfp-cmode-02
sfp-cmode-02-01              e0b       False   10.63.165.62       sfp-cmode-02
sfp-cmode-02-01              e0M        True   10.63.165.62       sfp-cmode-02
sfp-cmode-02-01              e0a        True   10.63.165.62       sfp-cmode-02
sfp-cmode-02-02              e0c       False   10.63.165.62       sfp-cmode-02
sfp-cmode-02-02              e0d       False   10.63.165.62       sfp-cmode-02
sfp-cmode-02-02              e0a        True   10.63.165.62       sfp-cmode-02
sfp-cmode-02-02              e0b       False   10.63.165.62       sfp-cmode-02

---

### Parameters
#### **Node**
One or more nodes.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Vserver**
One or more Vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Port**
One or more port names on the node.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Address**
One or more IP addresses that were searched.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **NetmaskLength**
The number of bits in the subnet mask.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetPlacementCache object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetPlacementCache -Template" to get the initially empty NetPlacementCache object.  If not specified, all data is returned for each object.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[NetPlacementCache]`|false   |named   |false        |

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
Specify to get an empty NetPlacementCache object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetPlacementCache object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetPlacementCache -Template" to get the initially empty NetPlacementCache object.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[NetPlacementCache]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetPlacementCache

---

### Notes
Category: net
API: net-placement-cache-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetPlacementCache [-Node <String[]>] [-Vserver <String[]>] [-Port <String[]>] [-Address <String[]>] [-NetmaskLength <String[]>] [-Attributes <NetPlacementCache>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetPlacementCache -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetPlacementCache -Query <NetPlacementCache> [-Attributes <NetPlacementCache>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
