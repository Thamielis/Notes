Get-NcLunAlignment
------------------

### Synopsis
Get a list of LUN alignment objects.

---

### Description

Get a list of LUN alignment objects.

---

### Examples
> Example 1

```PowerShell
Get-NcLunAlignment
Get the LUN alignment of all the LUNs in the current cluster.

Alignment                   : aligned
MultiprotocolType           : windows_2008
NcController                : 192.168.182.119
PartitionCount              : 1
PartitionScheme             : mbr
PartitionTable              : {0x07: 2048}
Path                        : /vol/luns/lun0
ReadAlignmentHistogram      : {0: 88, 1: 0, 2: 0, 3: 0...}
ReadPartialBlocks           : 10
Vserver                     : joule
WriteAlignmentHistogram     : {0: 95, 1: 0, 2: 0, 3: 0...}
WritePartialBlocks          : 4
PartitionCountSpecified     : True
ReadPartialBlocksSpecified  : True
WritePartialBlocksSpecified : True

Alignment                   : misaligned
MultiprotocolType           : windows
NcController                : 192.168.182.119
PartitionCount              : 1
PartitionScheme             : mbr
PartitionTable              : {0x07: 2048}
Path                        : /vol/luns/lun1
ReadAlignmentHistogram      : {0: 0, 1: 87, 2: 0, 3: 0...}
ReadPartialBlocks           : 12
Vserver                     : joule
WriteAlignmentHistogram     : {0: 0, 1: 95, 2: 0, 3: 0...}
WritePartialBlocks          : 4
PartitionCountSpecified     : True
ReadPartialBlocksSpecified  : True
WritePartialBlocksSpecified : True

```
> Example 2

```PowerShell
$q = Get-NcLunAlignment -Template
$q.Alignment = "misaligned"
Get-NcLunAlignment -Query $q
Get all of the misaligned LUNs in the current cluster.

Alignment                   : misaligned
MultiprotocolType           : windows
NcController                : 192.168.182.119
PartitionCount              : 1
PartitionScheme             : mbr
PartitionTable              : {0x07: 2048}
Path                        : /vol/luns/lun1
ReadAlignmentHistogram      : {0: 0, 1: 87, 2: 0, 3: 0...}
ReadPartialBlocks           : 12
Vserver                     : joule
WriteAlignmentHistogram     : {0: 0, 1: 95, 2: 0, 3: 0...}
WritePartialBlocks          : 4
PartitionCountSpecified     : True
ReadPartialBlocksSpecified  : True
WritePartialBlocksSpecified : True

```

---

### Parameters
#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Path**
The path of one or more LUNs to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Lun<br/>Name|

#### **Attributes**
For improved scalability in large clusters, provide a LunAlignInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcLunAlignment -Template" to get the initially empty LunAlignInfo object.  If not specified, all data is returned for each object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[LunAlignInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
Specify to get an empty LunAlignInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a LunAlignInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcLunAlignment -Template" to get the initially empty LunAlignInfo object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[LunAlignInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunAlignInfo

---

### Notes
Category: lun
API: lun-alignment-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcLunAlignment [-Vserver <String[]>] [[-Path] <String[]>] [-Attributes <LunAlignInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLunAlignment -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLunAlignment -Query <LunAlignInfo> [-Attributes <LunAlignInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
