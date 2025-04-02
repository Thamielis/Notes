Get-NcSnapmirrorDestination
---------------------------

### Synopsis
Get information about one or more SnapMirror relationships whose source endpoints are in the  Vserver or the cluster the cmdlet is issued on.

---

### Description

Get information about one or more SnapMirror relationships whose source endpoints are in the  Vserver or the cluster the cmdlet is issued on.

The information returned can be stale. Stale information corresponds to a SnapMirror relationship that has been deleted on its destination cluster or Vserver. Stale information may result to several entries being returned with the same source and destination endpoints, but with different relationship IDs.

Note that the information for a SnapMirror relationship will not be available on its source Vserver or source cluster until at least one transfer is initiated.

This API is only supported in ONTAP 8.2 and above operating in Cluster-Mode.  It can be issued on a Vserver or a Cluster.

---

### Related Links
* [Get-NcSnapmirror](Get-NcSnapmirror)

* [Remove-NcSnapmirror](Remove-NcSnapmirror)

---

### Examples
> Example 1

```PowerShell
Get-NcSnapmirrorDestination
Get all of the snapmirror destinations on the current cluster.
```

---

### Parameters
#### **Source**
Specifies the source endpoint of the SnapMirror relationship in the format [vserver:]volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases       |
|------------|--------|--------|---------------------|--------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|SourceLocation|

#### **SourceVolume**
A SnapMirror source volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SourceVserver**
A SnapMirror source vserver.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Destination**
Specifies the destination endpoint of the SnapMirror relationship in the format [vserver:]volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases            |
|------------|--------|--------|---------------------|-------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|DestinationLocation|

#### **DestinationVolume**
A SnapMirror destination volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **DestinationVserver**
A SnapMirror destination vserver.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Expand**
Specify to show constituents of the group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SnapmirrorDestinationInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSnapmirrorDestination -Template" to get the initially empty SnapmirrorDestinationInfo object.  If not specified, all data is returned for each object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[SnapmirrorDestinationInfo]`|false   |named   |false        |

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
Specify to get an empty SnapmirrorDestinationInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SnapmirrorDestinationInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSnapmirrorDestination -Template" to get the initially empty SnapmirrorDestinationInfo object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[SnapmirrorDestinationInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.SnapmirrorDestinationInfo

---

### Notes
Category: snapmirror
API: snapmirror-get-destination-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcSnapmirrorDestination [-Source <String[]>] [-SourceVolume <String[]>] [-SourceVserver <String[]>] [-Destination <String[]>] [-DestinationVolume <String[]>] [-DestinationVserver 
```
```PowerShell
<String[]>] [-Expand] [-Attributes <SnapmirrorDestinationInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorDestination [-Expand] -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorDestination [-Expand] -Query <SnapmirrorDestinationInfo> [-Attributes <SnapmirrorDestinationInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
