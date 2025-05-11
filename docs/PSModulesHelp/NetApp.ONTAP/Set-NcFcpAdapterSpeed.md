Set-NcFcpAdapterSpeed
---------------------

### Synopsis
Set the speed on the Fibre Channel target adapter.

---

### Description

Set the speed on the Fibre Channel target adapter. It can be configured to run at 1Gb, 2Gb, 4Gb, or to autonegotiate.  Note only 4Gb adapters support the 4Gb speed. If the adapter is online it must be brought offline before setting the speed, and then online in order for a new speed to take effect. This may temporarily disrupt fcp service on the target adapter.

---

### Related Links
* [Get-NcFcpAdapter](Get-NcFcpAdapter)

* [Enable-NcFcpAdapter](Enable-NcFcpAdapter)

* [Disable-NcFcpAdapter](Disable-NcFcpAdapter)

---

### Examples
> Example 1

```PowerShell
Set-NcFcpAdapterSpeed VxeRubble-03 0a 4
Set the FCP adapter speed for the adapter 0a on node VxeRubble-02 to 4GB.

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
Node                          : VxeRubble-02
NodeName                      : 50:0a:09:80:89:eb:bf:47
PacketSize                    : 2048
PciBusWidth                   : 64
PciClockSpeed                 : 33
PhyFirmwareRev                :
PhysicalDataLinkRate          :
PhysicalLinkState             :
PhysicalProtocol              : fibre_channel
PortAddress                   : 71424
PortName                      : 50:0a:09:81:89:eb:bf:47
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
The name of the storage system node where the adapter is installed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Adapter**
FC target adapter.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |2       |true (ByPropertyName)|FcpAdapter|

#### **Speed**
Link speed (in GB).  Possible values: "1", "2", "4", or "auto" (autonegotiate speed).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

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
API: fcp-adapter-set-speed
Family: cluster

---

### Syntax
```PowerShell
Set-NcFcpAdapterSpeed [-Node] <String> [-Adapter] <String> [-Speed] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
