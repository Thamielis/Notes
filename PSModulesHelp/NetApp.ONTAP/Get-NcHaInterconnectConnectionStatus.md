Get-NcHaInterconnectConnectionStatus
------------------------------------

### Synopsis
Iterate over list of nodes in the cluster to get their high-availability interconnect connection status

---

### Description

Iterate over list of nodes in the cluster to get their high-availability interconnect connection status

---

### Examples
> Example 1

```PowerShell
Get-NcHaInterconnectConnectionStatus
Gives the connection status of the HA pair nodes sapanj-vsim3 and sapanj-vsim4

CommandRevision           : 
DebugFirmware             : 
DeviceType                : 
DriverName                : 
Firmware                  : 
HardwareRevision          : 
IcConnection              : up
IsLink0Active             : 
IsLink1Active             : 
Link0Status               : 
Link1Status               : 
LinkStatus                : up
NcController              : 10.238.73.251
NodeName                  : sapanj-vsim3
NvlogRdma                 : up
Port1BaseLid              : 
Port1DataRate             : 
Port1Gid                  : 
Port1LinkInfo             : 
Port1Mtu                  : 
Port1PortName             : 
Port1QsfpPartNumber       : 
Port1QsfpSerialNumber     : 
Port1QsfpType             : 
Port1QsfpVendor           : 
Port1RemoteLid            : 
Port2BaseLid              : 
Port2DataRate             : 
Port2Gid                  : 
Port2LinkInfo             : 
Port2Mtu                  : 
Port2PortName             : 
Port2QsfpPartNumber       : 
Port2QsfpSerialNumber     : 
Port2QsfpType             : 
Port2QsfpVendor           : 
PortNumber1               : 
PortNumber2               : 
RendezvousVi              : 
RvState                   : 
SerialNumber              : 
Slot                      : 
Version                   : 
CommandRevisionSpecified  : False
DebugFirmwareSpecified    : False
HardwareRevisionSpecified : False
IsLink0ActiveSpecified    : False
IsLink1ActiveSpecified    : False
Port1MtuSpecified         : False
Port2MtuSpecified         : False
PortNumber1Specified      : False
PortNumber2Specified      : False
SlotSpecified             : False

CommandRevision           : 
DebugFirmware             : 
DeviceType                : 
DriverName                : 
Firmware                  : 
HardwareRevision          : 
IcConnection              : up
IsLink0Active             : 
IsLink1Active             : 
Link0Status               : 
Link1Status               : 
LinkStatus                : up
NcController              : 10.238.73.251
NodeName                  : sapanj-vsim4
NvlogRdma                 : up
Port1BaseLid              : 
Port1DataRate             : 
Port1Gid                  : 
Port1LinkInfo             : 
Port1Mtu                  : 
Port1PortName             : 
Port1QsfpPartNumber       : 
Port1QsfpSerialNumber     : 
Port1QsfpType             : 
Port1QsfpVendor           : 
Port1RemoteLid            : 
Port2BaseLid              : 
Port2DataRate             : 
Port2Gid                  : 
Port2LinkInfo             : 
Port2Mtu                  : 
Port2PortName             : 
Port2QsfpPartNumber       : 
Port2QsfpSerialNumber     : 
Port2QsfpType             : 
Port2QsfpVendor           : 
PortNumber1               : 
PortNumber2               : 
RendezvousVi              : 
RvState                   : 
SerialNumber              : 
Slot                      : 
Version                   : 
CommandRevisionSpecified  : False
DebugFirmwareSpecified    : False
HardwareRevisionSpecified : False
IsLink0ActiveSpecified    : False
IsLink1ActiveSpecified    : False
Port1MtuSpecified         : False
Port2MtuSpecified         : False
PortNumber1Specified      : False
PortNumber2Specified      : False
SlotSpecified             : False

```

---

### Parameters
#### **NodeName**
Specify to filter by NodeName

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[HaInterconnectStatusInfo]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[HaInterconnectStatusInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.HaInterconnect.HaInterconnectStatusInfo

---

### Notes
Category: ha interconnect
API: ha-interconnect-connection-status-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcHaInterconnectConnectionStatus [[-NodeName] <String[]>] [-Attributes <HaInterconnectStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcHaInterconnectConnectionStatus -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcHaInterconnectConnectionStatus -Query <HaInterconnectStatusInfo> [-Attributes <HaInterconnectStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
