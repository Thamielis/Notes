Get-NcLunStatistics
-------------------

### Synopsis
Get block-protocol access statistics for LUNs.

---

### Description

Get block-protocol access statistics for LUNs.

---

### Related Links
* [Get-NcLun](Get-NcLun)

---

### Examples
> Example 1

```PowerShell
Get-NcLunStatistics /vol/SQL_fuji6_data2/SQLData2
Get I/O stats for the specified LUN.

Vserver      : Parker02
Path         : /vol/SQL_fuji6_data2/SQLData2
NcController : cerebus
BlockSize    : 512
OtherOps     : 239406
ReadBlocks   : 250348
ReadBytes    : 128178176
ReadOps      : 73058
ScsiErrors   : 65
WriteBlocks  : 1517844
WriteBytes   : 777136128
WriteOps     : 1165

```

---

### Parameters
#### **Path**
The name of one or more LUNs to query for statistics info.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Lun<br/>Name|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a LunStatsInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcLunStatistics -Template" to get the initially empty LunStatsInfo object.  If not specified, all data is returned for each object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[LunStatsInfo]`|false   |named   |false        |

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
Specify to get an empty LunStatsInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a LunStatsInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcLunStatistics -Template" to get the initially empty LunStatsInfo object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[LunStatsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunStatsInfo

---

### Notes
Category: lun
API: lun-map-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcLunStatistics [[-Path] <String[]>] [-Vserver <String[]>] [-VserverContext <String>] [-Attributes <LunStatsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLunStatistics [-VserverContext <String>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLunStatistics [-VserverContext <String>] -Query <LunStatsInfo> [-Attributes <LunStatsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
