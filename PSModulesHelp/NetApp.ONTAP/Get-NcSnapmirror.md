Get-NcSnapmirror
----------------

### Synopsis
List SnapMirror relationships.

---

### Description

List SnapMirror relationships.

---

### Related Links
* [Remove-NcSnapmirror](Remove-NcSnapmirror)

* [Set-NcSnapmirror](Set-NcSnapmirror)

---

### Examples
> Example 1

Get-NcSnapmirror
List all SnapMirror relationships.

SourceLocation                    DestinationLocation                 Status MirrorState
--------------                    -------------------                 ------ -----------
VxeRubble://costea01/vol1_LS1     VxeRubble://costea01/vol1_LS2       idle   snapmirrored
VxeRubble://costea01/unitTestLuns VxeRubble://costea02/unitTestLunsSM idle   snapmirrored

> Example 2

$query = Get-NcSnapmirror -Template
$query.RelationshipType = "load_sharing"
Get-NcSnapmirror -Query $query
Using an advanced query, get all load-sharing SnapMirror relationships.

SourceLocation                DestinationLocation           Status MirrorState
--------------                -------------------           ------ -----------
VxeRubble://costea01/vol1_LS1 VxeRubble://costea01/vol1_LS2 idle   snapmirrored

---

### Parameters
#### **Destination**
A SnapMirror destination endpoint in the format: [cluster:]//vserver/volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases            |
|------------|--------|--------|---------------------|-------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|DestinationLocation|

#### **DestinationCluster**
A SnapMirror destination cluster.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **DestinationVserver**
A SnapMirror destination vserver.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **DestinationVolume**
A SnapMirror destination volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Source**
A SnapMirror source endpoint in the format: [cluster:]//vserver/volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases       |
|------------|--------|--------|---------------------|--------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|SourceLocation|

#### **SourceCluster**
A SnapMirror source cluster.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SourceVserver**
A SnapMirror source vserver.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SourceVolume**
A SnapMirror source volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Expand**
Specify to show constituents of the group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SnapmirrorInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSnapmirror -Template" to get the initially empty SnapmirrorInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[SnapmirrorInfo]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty SnapmirrorInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SnapmirrorInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSnapmirror -Template" to get the initially empty SnapmirrorInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[SnapmirrorInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.SnapmirrorInfo

---

### Notes
Category: snapmirror
API: snapmirror-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSnapmirror [-Destination <String[]>] [-DestinationCluster <String[]>] [-DestinationVserver <String[]>] [-DestinationVolume <String[]>] [-Source <String[]>] [-SourceCluster <String[]>] 
```
```PowerShell
[-SourceVserver <String[]>] [-SourceVolume <String[]>] [-Expand] [-Attributes <SnapmirrorInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirror [-Expand] -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirror [-Expand] -Query <SnapmirrorInfo> [-Attributes <SnapmirrorInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
