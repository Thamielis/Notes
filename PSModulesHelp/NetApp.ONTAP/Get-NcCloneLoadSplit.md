Get-NcCloneLoadSplit
--------------------

### Synopsis
Gets information about load on all nodes due to file or LUN clone split operations.

---

### Description

Gets information about load on all nodes due to file or LUN clone split operations.

---

### Related Links
* [New-NcCloneToken](New-NcCloneToken)

---

### Examples
> Example 1

```PowerShell
Get-NcCloneLoadSplit
Get load split information from all nodes

AvailableSplitLoad : 35184372076544
CurrentSplitLoad   : 0
MaxSplitLoad       : 35184372088832
NcController       : 10.238.49.117
Node               : aparajir-vsim1
TokenReservedLoad  : 12288

AvailableSplitLoad : 35184372088832
CurrentSplitLoad   : 0
MaxSplitLoad       : 35184372088832
NcController       : 10.238.49.117
Node               : aparajir-vsim2
TokenReservedLoad  : 0

```

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide a CifsServerConfig object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsServer -Template" to get the initially empty CifsServerConfig object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[CloneSplitLoadInfo]`|false   |named   |false        |

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

#### **Node**
Restrict results to one or more nodes. Data ONTAP Wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Nodes  |

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
Specify to get an empty object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[CloneSplitLoadInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Clone.CloneSplitLoadInfo

---

### Notes
Category: clone
API: clone-split-load-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCloneLoadSplit [-Attributes <CloneSplitLoadInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [[-Node] <String[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCloneLoadSplit -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCloneLoadSplit -Query <CloneSplitLoadInfo> [-Attributes <CloneSplitLoadInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
