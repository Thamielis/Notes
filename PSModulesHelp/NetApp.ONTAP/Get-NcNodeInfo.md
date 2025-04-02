Get-NcNodeInfo
--------------

### Synopsis
Obtain node information which includes CPU and backplane information.

---

### Description

Obtain node information which includes CPU and backplane information.  I/O information is not included.

---

### Related Links
* [Get-NcNode](Get-NcNode)

---

### Examples
> Example 1

```PowerShell
Get-NcNodeInfo
List info about all cluster nodes.

NcController               : 10.61.172.155
Name                       : fas3070cluster01-01
BackplanePartNumber        :
BackplaneRevision          :
BackplaneSerialNumber      :
BoardSpeed                 : 1799
BoardType                  : System Board XII
ControllerAddress          :
CpuCiobRevisionId          :
CpuFirmwareRelease         : 2.5.0
CpuMicrocodeVersion        : 77
CpuPartNumber              : 110-00112
CpuProcessorId             :
CpuProcessorType           : Opteron
CpuRevision                : A2
CpuSerialNumber            : 434736
MemorySize                 : 8192
NumberOfProcessors         : 4
PartnerSystemId            : 0118054408
PartnerSystemName          : fas3070cluster01-02
PartnerSystemSerialNumber  :
ProdType                   :
SupportsRaidArray          : False
SystemId                   : 0118059099
SystemMachineType          : FAS3070
SystemModel                : FAS3070
SystemName                 : fas3070cluster01-01
SystemRevision             : D3
SystemSerialNumber         : 3091378
VendorId                   : NetApp
SupportsRaidArraySpecified : True

NcController               : 10.61.172.155
Name                       : fas3070cluster01-02
BackplanePartNumber        :
BackplaneRevision          :
BackplaneSerialNumber      :
BoardSpeed                 : 1800
BoardType                  : System Board XII
ControllerAddress          :
CpuCiobRevisionId          :
CpuFirmwareRelease         : 2.5.0
CpuMicrocodeVersion        : 77
CpuPartNumber              : 110-00112
CpuProcessorId             :
CpuProcessorType           : Opteron
CpuRevision                : A2
CpuSerialNumber            : 435180
MemorySize                 : 8192
NumberOfProcessors         : 4
PartnerSystemId            : 0118059099
PartnerSystemName          : fas3070cluster01-01
PartnerSystemSerialNumber  :
ProdType                   :
SupportsRaidArray          : False
SystemId                   : 0118054408
SystemMachineType          : FAS3070
SystemModel                : FAS3070
SystemName                 : fas3070cluster01-02
SystemRevision             : D3
SystemSerialNumber         : 3091379
VendorId                   : NetApp
SupportsRaidArraySpecified : True

```

---

### Parameters
#### **Name**
The name of one or more nodes to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Node   |

#### **Attributes**
For improved scalability in large clusters, provide a SystemInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNodeInfo -Template" to get the initially empty SystemInfo object.  If not specified, all data is returned for each object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[SystemInfo]`|false   |named   |false        |

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
Specify to get an empty SystemInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SystemInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNodeInfo -Template" to get the initially empty SystemInfo object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[SystemInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.System.SystemInfo

---

### Notes
Category: system
API: system-get-node-info-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNodeInfo [[-Name] <String[]>] [-Attributes <SystemInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNodeInfo -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNodeInfo -Query <SystemInfo> [-Attributes <SystemInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
