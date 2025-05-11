Get-NcAggrNodeInfo
------------------

### Synopsis
Get information on what possibilities and parameters exist for aggregates on a given controller.

---

### Description

Get information on what possibilities and parameters exist for aggregates on a given controller.

---

### Related Links
* [Get-NcNode](Get-NcNode)

---

### Examples
> Example 1

Get-NcNode | Get-NcAggrNodeInfo
List aggregate info for each node.

NcController            : 10.61.172.155
Node                    : fas3070cluster01-01
AllowedRaidTypes        : {raid0, raid4, raid_dp}
ChecksumTypes           : block
DefaultRaidType         : raid_dp
DiskTypes               : 520
MaxNamedDisksPerRequest : 128
RaidGroupSize           : {raid0: Min/Def/Max = 1/8/26, raid4: Min/Def/Max = 2/8/14, raid_dp: Min/Def/Max = 3/16/28}
RootVolume              : vol0
SnapshotsMax            : 255

NcController            : 10.61.172.155
Node                    : fas3070cluster01-02
AllowedRaidTypes        : {raid0, raid4, raid_dp}
ChecksumTypes           : block
DefaultRaidType         : raid_dp
DiskTypes               : 520
MaxNamedDisksPerRequest : 128
RaidGroupSize           : {raid0: Min/Def/Max = 1/8/26, raid4: Min/Def/Max = 2/8/14, raid_dp: Min/Def/Max = 3/16/28}
RootVolume              : vol0
SnapshotsMax            : 255

---

### Parameters
#### **Name**
Name of the node to query.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Node<br/>NodeName|

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
* DataONTAP.C.Types.Aggr.AggrNodeInfo

---

### Notes
Category: aggr
API: aggr-get-filer-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrNodeInfo [-Name] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
