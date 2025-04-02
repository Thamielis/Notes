Get-NcFcpAdapter
----------------

### Synopsis
Get a list of physical FC adapters.

---

### Description

Get a list of physical FC adapters.

---

### Related Links
* [Enable-NcFcpAdapter](Enable-NcFcpAdapter)

* [Disable-NcFcpAdapter](Disable-NcFcpAdapter)

* [Set-NcFcpAdapterSpeed](Set-NcFcpAdapterSpeed)

---

### Examples
> Example 1

```PowerShell
Get-NcFcpAdapter
Get all the FCP adapters in the current cluster.

Adapter                       : 0a
CacheLineSize                 : 16
ConnectionEstablished         : ptp
DataLinkRate                  : 4
ExternalGbicEnabled           : False
FabricEstablished             : True
FirmwareRev                   : 5.5.2
HardwareRev                   : 2
InfoName                      : Fibre Channel Target Adapter 0a (rev. 2)
MaxSpeed                      : 4
MediaType                     : ptp
MpiFirmwareRev                :
Node                          : VxeRubble-01
NodeName                      : 50:0a:09:80:89:0b:bf:89
PacketSize                    : 2048
PciBusWidth                   : 64
PciClockSpeed                 : 33
PhyFirmwareRev                :
PhysicalDataLinkRate          :
PhysicalLinkState             :
PhysicalProtocol              : fibre_channel
PortAddress                   : 70912
PortName                      : 50:0a:09:81:89:0b:bf:89
Speed                         : auto
SramParityEnabled             : True
State                         : online
SwitchPort                    :
VlanId                        :
CacheLineSizeSpecified        : True
DataLinkRateSpecified         : True
ExternalGbicEnabledSpecified  : True
FabricEstablishedSpecified    : True
PacketSizeSpecified           : True
PciBusWidthSpecified          : True
PciClockSpeedSpecified        : True
PhysicalDataLinkRateSpecified : False
PortAddressSpecified          : True
SramParityEnabledSpecified    : True
VlanIdSpecified               : False

```
> Example 2

```PowerShell
$q = Get-NcFcpAdapter -Template
$q.State = "online"
Get-NcFcpAdapter -Query $q
Get all of the online FCP adapters in the current cluster.

Adapter                       : 0a
CacheLineSize                 : 16
ConnectionEstablished         : ptp
DataLinkRate                  : 4
ExternalGbicEnabled           : False
FabricEstablished             : True
FirmwareRev                   : 5.5.2
HardwareRev                   : 2
InfoName                      : Fibre Channel Target Adapter 0a (rev. 2)
MaxSpeed                      : 4
MediaType                     : ptp
MpiFirmwareRev                :
Node                          : VxeRubble-01
NodeName                      : 50:0a:09:80:89:0b:bf:89
PacketSize                    : 2048
PciBusWidth                   : 64
PciClockSpeed                 : 33
PhyFirmwareRev                :
PhysicalDataLinkRate          :
PhysicalLinkState             :
PhysicalProtocol              : fibre_channel
PortAddress                   : 70912
PortName                      : 50:0a:09:81:89:0b:bf:89
Speed                         : auto
SramParityEnabled             : True
State                         : online
SwitchPort                    :
VlanId                        :
CacheLineSizeSpecified        : True
DataLinkRateSpecified         : True
ExternalGbicEnabledSpecified  : True
FabricEstablishedSpecified    : True
PacketSizeSpecified           : True
PciBusWidthSpecified          : True
PciClockSpeedSpecified        : True
PhysicalDataLinkRateSpecified : False
PortAddressSpecified          : True
SramParityEnabledSpecified    : True
VlanIdSpecified               : False

```

---

### Parameters
#### **Node**
The name of the node where the adapter is installed.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Adapter**
The slot name of the FC adapter.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|FcpAdapter|

#### **NodeName**
The FCP World Wide Node Name (WWNN) of the adapter.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |3       |true (ByPropertyName)|Wwnn   |

#### **Attributes**
For improved scalability in large clusters, provide an FcpConfigAdapterInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFcpAdapter -Template" to get the initially empty FcpConfigAdapterInfo object.  If not specified, all data is returned for each object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[FcpConfigAdapterInfo]`|false   |named   |false        |

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
Specify to get an empty FcpConfigAdapterInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FcpConfigAdapterInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFcpAdapter -Template" to get the initially empty FcpConfigAdapterInfo object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[FcpConfigAdapterInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fcp.FcpConfigAdapterInfo

---

### Notes
Category: fcp
API: fcp-adapter-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcFcpAdapter [[-Node] <String[]>] [[-Adapter] <String[]>] [[-NodeName] <String[]>] [-Attributes <FcpConfigAdapterInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpAdapter -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcFcpAdapter -Query <FcpConfigAdapterInfo> [-Attributes <FcpConfigAdapterInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
