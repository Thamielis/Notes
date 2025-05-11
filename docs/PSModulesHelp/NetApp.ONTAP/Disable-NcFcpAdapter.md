Disable-NcFcpAdapter
--------------------

### Synopsis
Bring a Fibre Channel target adapter offline.

---

### Description

Bring a Fibre Channel target adapter offline. The adapter may not be offline immediately after the call returns, it may take up to a few seconds for the adapter to change state. in ONTAP 7-Mode, if the FCP service is not running then all adapters are automatically offlined. They cannot be brought online again until FCP service is started. adapter to change state. In clustered Data ONTAP, offlining an adapter will operationally disable all FCP logical interfaces (LIFs) hosted by the adapter.

---

### Related Links
* [Enable-NcFcpAdapter](Enable-NcFcpAdapter)

* [Get-NcFcpAdapter](Get-NcFcpAdapter)

* [Set-NcFcpAdapterSpeed](Set-NcFcpAdapterSpeed)

---

### Examples
> Example 1

```PowerShell
Disable-NcFcpAdapter VxeRubble-01 0a
Disable the adapter 0a on node VxeRubble-01.

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
State                         : offline
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
The name of the storage system node where the adapter is installed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Adapter**
FC adapter to bring offline.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |2       |true (ByPropertyName)|FcpAdapter|

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
* DataONTAP.C.Types.Fcp.FcpConfigAdapterInfo

---

### Notes
Category: fcp
API: fcp-adapter-config-up
Family: cluster

---

### Syntax
```PowerShell
Disable-NcFcpAdapter [-Node] <String> [-Adapter] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
