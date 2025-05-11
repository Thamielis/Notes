Get-NcNetDeviceDiscovery
------------------------

### Synopsis
Get a list of network device discovery objects found by a discovery protocol such as CDP or LLDP.

---

### Description

Get a list of network device discovery objects found by a discovery protocol such as CDP or LLDP.

---

### Examples
> Example 1

Get-NcNetDeviceDiscovery
Get a list of network device discovery objects found.

DiscoveredDevice             Node                         Interface  Port   Platform             Capabilities
----------------             ----                         ---------  ----   --------             ------------
nivi-vsim2                   beam-vsim-sn1-01             e0b        e0b    SIMBOX               {host}
nivi-vsim2                   beam-vsim-sn1-01             e0a        e0b    SIMBOX               {host}
nivi-vsim2                   beam-vsim-sn1-01             e0b        e0a    SIMBOX               {host}
nivi-vsim2                   beam-vsim-sn1-01             e0a        e0a    SIMBOX               {host}

---

### Parameters
#### **Node**
One or more nodes on which the network port resides.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Port**
One or more physical network port for device discovery (for example, e0a).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Device**
One or more devices discovered by the physical network port.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases         |
|------------|--------|--------|---------------------|----------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|DiscoveredDevice|

#### **Interface**
.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetDeviceDiscoveryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetDeviceDiscovery -Template" to get the initially empty NetDeviceDiscoveryInfo object.  If not specified, all data is returned for each object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[NetDeviceDiscoveryInfo]`|false   |named   |false        |

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
Specify to get an empty NetDeviceDiscoveryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetDeviceDiscoveryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetDeviceDiscovery -Template" to get the initially empty NetDeviceDiscoveryInfo object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[NetDeviceDiscoveryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetDeviceDiscoveryInfo

---

### Notes
Category: net
API: net-device-discovery-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetDeviceDiscovery [[-Node] <String[]>] [[-Port] <String[]>] [[-Device] <String[]>] [[-Interface] <String[]>] [-Attributes <NetDeviceDiscoveryInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetDeviceDiscovery -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetDeviceDiscovery -Query <NetDeviceDiscoveryInfo> [-Attributes <NetDeviceDiscoveryInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
